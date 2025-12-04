// manifest: startProject
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import '../services/s3/mime_type_helper.dart';
import '../services/s3/s3_service.dart';
import '../services/s3/upload_validator.dart';
import 'shared/auth_context_mixin.dart';

class StorageEndpoint extends Endpoint with AuthContextMixin {
  late final S3Service s3Service;
  
  @override
  void initialize(Server server, String name, String? module) {
    super.initialize(server, name, module);
    
    s3Service = S3Service(
      config: {
        'endpoint': 's3.twcstorage.ru',
        'region': 'ru-1',
        'bucketName': '20fa301e-80dd2c5b-b96d-4abf-ae45-36c63a28c51b',
      },
      passwords: {
        'accessKey': 'PCI7AF9S3YV4RCO93KTD',
        'secretKey': 'd0VcA7wRRvgBOJkccWUxDsJMUZo8BDNl8dj1qpxw',
      },
    );
  }
  
  /// Запрос разрешения на загрузку файла
  Future<UploadRequest> requestUpload(
    Session session,
    String filename,
    String mimeType,
    int size,
  ) async {
    final authContext = await getAuthenticatedUserContext(session);
    
    final correctedMimeType = MimeTypeHelper.fixMimeType(mimeType, filename);
    session.log(
      'Upload request: $filename, MIME: $correctedMimeType, Size: $size bytes',
      level: LogLevel.info,
    );
    
    if (!UploadValidator.isValidFile(mimeType: correctedMimeType, size: size)) {
      throw Exception(
        UploadValidator.getValidationError(mimeType: correctedMimeType, size: size)
      );
    }
    
    final fileId = UuidValue.fromString(const Uuid().v4());
    final extension = filename.split('.').last.toLowerCase();
    final objectKey = 'uploads/${authContext.customerId}/${authContext.userId}/$fileId.$extension';
    
    final fileRecord = UploadedFile(
      id: fileId,
      bucketName: s3Service.defaultBucket,
      objectKey: objectKey,
      originalFilename: filename,
      mimeType: correctedMimeType,
      size: size,
      status: UploadStatus.pending,
      uploadedAt: DateTime.now().toUtc(),
      customerId: authContext.customerId,
      userId: authContext.userId,
    );
    
    final insertedFile = await UploadedFile.db.insertRow(session, fileRecord);
    
    if (insertedFile.id == null) {
      throw Exception('Не удалось создать запись о файле в базе данных');
    }
    
    session.log('File record created with ID: ${insertedFile.id}', level: LogLevel.info);
    
    final expiryDuration = const Duration(minutes: 15);
    final uploadUrl = await s3Service.generateUploadUrl(
      objectKey: objectKey,
      expiry: expiryDuration,
    );
    
    return UploadRequest(
      uploadUrl: uploadUrl,
      fileId: insertedFile.id!,
      objectKey: objectKey,
      expiresAt: DateTime.now().toUtc().add(expiryDuration),
    );
  }

  /// Подтверждение успешной загрузки
  Future<bool> confirmUpload(
    Session session,
    UuidValue fileId,
  ) async {
    final authContext = await getAuthenticatedUserContext(session);
    
    session.log('Confirming upload for file ID: $fileId', level: LogLevel.info);
    
    final file = await UploadedFile.db.findById(session, fileId);
    if (file == null || file.userId != authContext.userId || file.customerId != authContext.customerId) {
      throw Exception('Доступ запрещен или файл не найден');
    }
    
    // Проверяем файл через прямой URL к Timeweb S3
    bool exists = false;
    const maxRetries = 3;
    
    for (int i = 0; i < maxRetries; i++) {
      session.log('Attempt ${i + 1}/$maxRetries to verify file', level: LogLevel.info);
      
      try {
        final directUrl = 'https://s3.twcstorage.ru/${file.bucketName}/${file.objectKey}';
        final response = await http.head(Uri.parse(directUrl));
        
        if (response.statusCode == 200) {
          session.log('File verified via direct URL (status: 200)', level: LogLevel.info);
          exists = true;
          break;
        }
      } catch (e) {
        session.log('Error checking file: $e', level: LogLevel.warning);
      }
      
      if (!exists && i < maxRetries - 1) {
        // Ждём перед следующей попыткой
        await Future.delayed(const Duration(seconds: 2));
      }
    }
    
    if (!exists) {
      file.status = UploadStatus.failed;
      await UploadedFile.db.updateRow(session, file);
      session.log('File verification failed: ${file.objectKey}', level: LogLevel.error);
      return false;
    }
    
    file.status = UploadStatus.uploaded;
    await UploadedFile.db.updateRow(session, file);
    session.log('Upload confirmed successfully for file: $fileId', level: LogLevel.info);
    
    return true;
  }
  
  /// Получение списка файлов пользователя
  Future<List<UploadedFile>> getUserFiles(
    Session session, {
    int? limit,
    int? offset,
  }) async {
    final authContext = await getAuthenticatedUserContext(session);
    
    return await UploadedFile.db.find(
      session,
      where: (t) => 
        t.userId.equals(authContext.userId) &
        t.customerId.equals(authContext.customerId) &
        t.status.notEquals(UploadStatus.deleted),
      orderBy: (t) => t.uploadedAt,
      orderDescending: true,
      limit: limit ?? 50,
      offset: offset,
    );
  }

  /// Получение URL для скачивания
  Future<String?> getDownloadUrl(
    Session session,
    UuidValue fileId,
  ) async {
    final authContext = await getAuthenticatedUserContext(session);
    
    final file = await UploadedFile.db.findById(session, fileId);
    if (file == null) return null;
    
    if (file.userId != authContext.userId || 
        file.customerId != authContext.customerId) {
      throw Exception('Доступ запрещен');
    }
    
    return await s3Service.generateDownloadUrl(
      objectKey: file.objectKey,
      expiry: const Duration(hours: 1),
    );
  }

  /// Удаление файла
  Future<bool> deleteFile(
    Session session,
    UuidValue fileId,
  ) async {
    final authContext = await getAuthenticatedUserContext(session);
    
    final file = await UploadedFile.db.findById(session, fileId);
    if (file == null) return false;
    
    if (file.userId != authContext.userId || 
        file.customerId != authContext.customerId) {
      throw Exception('Доступ запрещен');
    }
    
    try {
      await s3Service.deleteObject(objectKey: file.objectKey);
      file.status = UploadStatus.deleted;
      await UploadedFile.db.updateRow(session, file);
      return true;
    } catch (e) {
      session.log('Error deleting file: $e', level: LogLevel.error);
      return false;
    }
  }
}