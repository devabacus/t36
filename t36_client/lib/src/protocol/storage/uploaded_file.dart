/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../storage/upload_status.dart' as _i2;

abstract class UploadedFile implements _i1.SerializableModel {
  UploadedFile._({
    this.id,
    required this.bucketName,
    required this.objectKey,
    required this.originalFilename,
    required this.mimeType,
    required this.size,
    required this.status,
    required this.uploadedAt,
    required this.userId,
    required this.customerId,
    this.metadata,
    this.publicUrl,
    this.expiresAt,
  });

  factory UploadedFile({
    _i1.UuidValue? id,
    required String bucketName,
    required String objectKey,
    required String originalFilename,
    required String mimeType,
    required int size,
    required _i2.UploadStatus status,
    required DateTime uploadedAt,
    required int userId,
    required _i1.UuidValue customerId,
    String? metadata,
    String? publicUrl,
    DateTime? expiresAt,
  }) = _UploadedFileImpl;

  factory UploadedFile.fromJson(Map<String, dynamic> jsonSerialization) {
    return UploadedFile(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      bucketName: jsonSerialization['bucketName'] as String,
      objectKey: jsonSerialization['objectKey'] as String,
      originalFilename: jsonSerialization['originalFilename'] as String,
      mimeType: jsonSerialization['mimeType'] as String,
      size: jsonSerialization['size'] as int,
      status: _i2.UploadStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      uploadedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['uploadedAt'],
      ),
      userId: jsonSerialization['userId'] as int,
      customerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['customerId'],
      ),
      metadata: jsonSerialization['metadata'] as String?,
      publicUrl: jsonSerialization['publicUrl'] as String?,
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  String bucketName;

  String objectKey;

  String originalFilename;

  String mimeType;

  int size;

  _i2.UploadStatus status;

  DateTime uploadedAt;

  int userId;

  _i1.UuidValue customerId;

  String? metadata;

  String? publicUrl;

  DateTime? expiresAt;

  /// Returns a shallow copy of this [UploadedFile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UploadedFile copyWith({
    _i1.UuidValue? id,
    String? bucketName,
    String? objectKey,
    String? originalFilename,
    String? mimeType,
    int? size,
    _i2.UploadStatus? status,
    DateTime? uploadedAt,
    int? userId,
    _i1.UuidValue? customerId,
    String? metadata,
    String? publicUrl,
    DateTime? expiresAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UploadedFile',
      if (id != null) 'id': id?.toJson(),
      'bucketName': bucketName,
      'objectKey': objectKey,
      'originalFilename': originalFilename,
      'mimeType': mimeType,
      'size': size,
      'status': status.toJson(),
      'uploadedAt': uploadedAt.toJson(),
      'userId': userId,
      'customerId': customerId.toJson(),
      if (metadata != null) 'metadata': metadata,
      if (publicUrl != null) 'publicUrl': publicUrl,
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UploadedFileImpl extends UploadedFile {
  _UploadedFileImpl({
    _i1.UuidValue? id,
    required String bucketName,
    required String objectKey,
    required String originalFilename,
    required String mimeType,
    required int size,
    required _i2.UploadStatus status,
    required DateTime uploadedAt,
    required int userId,
    required _i1.UuidValue customerId,
    String? metadata,
    String? publicUrl,
    DateTime? expiresAt,
  }) : super._(
         id: id,
         bucketName: bucketName,
         objectKey: objectKey,
         originalFilename: originalFilename,
         mimeType: mimeType,
         size: size,
         status: status,
         uploadedAt: uploadedAt,
         userId: userId,
         customerId: customerId,
         metadata: metadata,
         publicUrl: publicUrl,
         expiresAt: expiresAt,
       );

  /// Returns a shallow copy of this [UploadedFile]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UploadedFile copyWith({
    Object? id = _Undefined,
    String? bucketName,
    String? objectKey,
    String? originalFilename,
    String? mimeType,
    int? size,
    _i2.UploadStatus? status,
    DateTime? uploadedAt,
    int? userId,
    _i1.UuidValue? customerId,
    Object? metadata = _Undefined,
    Object? publicUrl = _Undefined,
    Object? expiresAt = _Undefined,
  }) {
    return UploadedFile(
      id: id is _i1.UuidValue? ? id : this.id,
      bucketName: bucketName ?? this.bucketName,
      objectKey: objectKey ?? this.objectKey,
      originalFilename: originalFilename ?? this.originalFilename,
      mimeType: mimeType ?? this.mimeType,
      size: size ?? this.size,
      status: status ?? this.status,
      uploadedAt: uploadedAt ?? this.uploadedAt,
      userId: userId ?? this.userId,
      customerId: customerId ?? this.customerId,
      metadata: metadata is String? ? metadata : this.metadata,
      publicUrl: publicUrl is String? ? publicUrl : this.publicUrl,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
    );
  }
}
