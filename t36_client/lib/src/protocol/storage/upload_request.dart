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

abstract class UploadRequest implements _i1.SerializableModel {
  UploadRequest._({
    required this.uploadUrl,
    this.fileId,
    required this.objectKey,
    required this.expiresAt,
  });

  factory UploadRequest({
    required String uploadUrl,
    _i1.UuidValue? fileId,
    required String objectKey,
    required DateTime expiresAt,
  }) = _UploadRequestImpl;

  factory UploadRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return UploadRequest(
      uploadUrl: jsonSerialization['uploadUrl'] as String,
      fileId: jsonSerialization['fileId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['fileId']),
      objectKey: jsonSerialization['objectKey'] as String,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
    );
  }

  String uploadUrl;

  _i1.UuidValue? fileId;

  String objectKey;

  DateTime expiresAt;

  /// Returns a shallow copy of this [UploadRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UploadRequest copyWith({
    String? uploadUrl,
    _i1.UuidValue? fileId,
    String? objectKey,
    DateTime? expiresAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UploadRequest',
      'uploadUrl': uploadUrl,
      if (fileId != null) 'fileId': fileId?.toJson(),
      'objectKey': objectKey,
      'expiresAt': expiresAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UploadRequestImpl extends UploadRequest {
  _UploadRequestImpl({
    required String uploadUrl,
    _i1.UuidValue? fileId,
    required String objectKey,
    required DateTime expiresAt,
  }) : super._(
         uploadUrl: uploadUrl,
         fileId: fileId,
         objectKey: objectKey,
         expiresAt: expiresAt,
       );

  /// Returns a shallow copy of this [UploadRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UploadRequest copyWith({
    String? uploadUrl,
    Object? fileId = _Undefined,
    String? objectKey,
    DateTime? expiresAt,
  }) {
    return UploadRequest(
      uploadUrl: uploadUrl ?? this.uploadUrl,
      fileId: fileId is _i1.UuidValue? ? fileId : this.fileId,
      objectKey: objectKey ?? this.objectKey,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}
