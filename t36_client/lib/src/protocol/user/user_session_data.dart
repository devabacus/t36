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
import 'package:t36_client/src/protocol/protocol.dart' as _i2;

abstract class UserSessionData implements _i1.SerializableModel {
  UserSessionData._({
    required this.userId,
    required this.customerId,
    required this.roleId,
    required this.activePermissions,
  });

  factory UserSessionData({
    required int userId,
    required _i1.UuidValue customerId,
    required _i1.UuidValue roleId,
    required List<String> activePermissions,
  }) = _UserSessionDataImpl;

  factory UserSessionData.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserSessionData(
      userId: jsonSerialization['userId'] as int,
      customerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['customerId'],
      ),
      roleId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['roleId']),
      activePermissions: _i2.Protocol().deserialize<List<String>>(
        jsonSerialization['activePermissions'],
      ),
    );
  }

  int userId;

  _i1.UuidValue customerId;

  _i1.UuidValue roleId;

  List<String> activePermissions;

  /// Returns a shallow copy of this [UserSessionData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserSessionData copyWith({
    int? userId,
    _i1.UuidValue? customerId,
    _i1.UuidValue? roleId,
    List<String>? activePermissions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserSessionData',
      'userId': userId,
      'customerId': customerId.toJson(),
      'roleId': roleId.toJson(),
      'activePermissions': activePermissions.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UserSessionDataImpl extends UserSessionData {
  _UserSessionDataImpl({
    required int userId,
    required _i1.UuidValue customerId,
    required _i1.UuidValue roleId,
    required List<String> activePermissions,
  }) : super._(
         userId: userId,
         customerId: customerId,
         roleId: roleId,
         activePermissions: activePermissions,
       );

  /// Returns a shallow copy of this [UserSessionData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserSessionData copyWith({
    int? userId,
    _i1.UuidValue? customerId,
    _i1.UuidValue? roleId,
    List<String>? activePermissions,
  }) {
    return UserSessionData(
      userId: userId ?? this.userId,
      customerId: customerId ?? this.customerId,
      roleId: roleId ?? this.roleId,
      activePermissions:
          activePermissions ?? this.activePermissions.map((e0) => e0).toList(),
    );
  }
}
