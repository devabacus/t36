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

abstract class RolePermission implements _i1.SerializableModel {
  RolePermission._({
    this.id,
    required this.roleId,
    required this.permissionId,
  });

  factory RolePermission({
    _i1.UuidValue? id,
    required _i1.UuidValue roleId,
    required _i1.UuidValue permissionId,
  }) = _RolePermissionImpl;

  factory RolePermission.fromJson(Map<String, dynamic> jsonSerialization) {
    return RolePermission(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      roleId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['roleId']),
      permissionId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['permissionId'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  _i1.UuidValue roleId;

  _i1.UuidValue permissionId;

  /// Returns a shallow copy of this [RolePermission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RolePermission copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? roleId,
    _i1.UuidValue? permissionId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RolePermission',
      if (id != null) 'id': id?.toJson(),
      'roleId': roleId.toJson(),
      'permissionId': permissionId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RolePermissionImpl extends RolePermission {
  _RolePermissionImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue roleId,
    required _i1.UuidValue permissionId,
  }) : super._(
         id: id,
         roleId: roleId,
         permissionId: permissionId,
       );

  /// Returns a shallow copy of this [RolePermission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RolePermission copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? roleId,
    _i1.UuidValue? permissionId,
  }) {
    return RolePermission(
      id: id is _i1.UuidValue? ? id : this.id,
      roleId: roleId ?? this.roleId,
      permissionId: permissionId ?? this.permissionId,
    );
  }
}
