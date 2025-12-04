// manifest: startProject
import 'package:minio/minio.dart';

class S3Service {
  late final Minio _client;
  final String defaultBucket;
  final bool pathStyle;
  
  S3Service({
    required Map<String, dynamic> config,
    required Map<String, dynamic> passwords,
  }) : defaultBucket = config['bucketName'],
       pathStyle = config['pathStyle'] ?? true {
    
    _client = Minio(
      endPoint: config['endpoint'],
      region: config['region'],
      accessKey: passwords['accessKey'],
      secretKey: passwords['secretKey'],
      useSSL: true,
      pathStyle: pathStyle,
    );
  }

  Future<String> generateUploadUrl({
    required String objectKey,
    String? bucket,
    Duration expiry = const Duration(minutes: 15),
  }) async {
    try {
      return await _client.presignedPutObject(
        bucket ?? defaultBucket,
        objectKey,
        expires: expiry.inSeconds,
      );
    } catch (e) {
      throw Exception('Failed to generate upload URL: $e');
    }
  }

  Future<String> generateDownloadUrl({
    required String objectKey,
    String? bucket,
    Duration expiry = const Duration(hours: 1),
  }) async {
    try {
      return await _client.presignedGetObject(
        bucket ?? defaultBucket,
        objectKey,
        expires: expiry.inSeconds,
      );
    } catch (e) {
      throw Exception('Failed to generate download URL: $e');
    }
  }

  Future<void> deleteObject({
    required String objectKey,
    String? bucket,
  }) async {
    try {
      await _client.removeObject(
        bucket ?? defaultBucket,
        objectKey,
      );
    } catch (e) {
      throw Exception('Failed to delete object: $e');
    }
  }

  Future<bool> objectExists({
    required String objectKey,
    String? bucket,
  }) async {
    try {
      await _client.statObject(bucket ?? defaultBucket, objectKey);
      return true;
    } catch (e) {
      return false;
    }
  }

}