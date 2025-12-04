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

abstract class CustomerUser implements _i1.SerializableModel {
  CustomerUser._({
    this.id,
    required this.customerId,
    required this.userId,
    required this.roleId,
  });

  factory CustomerUser({
    _i1.UuidValue? id,
    required _i1.UuidValue customerId,
    required int userId,
    required _i1.UuidValue roleId,
  }) = _CustomerUserImpl;

  factory CustomerUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomerUser(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      customerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['customerId'],
      ),
      userId: jsonSerialization['userId'] as int,
      roleId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['roleId']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  _i1.UuidValue customerId;

  int userId;

  _i1.UuidValue roleId;

  /// Returns a shallow copy of this [CustomerUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerUser copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? customerId,
    int? userId,
    _i1.UuidValue? roleId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CustomerUser',
      if (id != null) 'id': id?.toJson(),
      'customerId': customerId.toJson(),
      'userId': userId,
      'roleId': roleId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerUserImpl extends CustomerUser {
  _CustomerUserImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue customerId,
    required int userId,
    required _i1.UuidValue roleId,
  }) : super._(
         id: id,
         customerId: customerId,
         userId: userId,
         roleId: roleId,
       );

  /// Returns a shallow copy of this [CustomerUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerUser copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? customerId,
    int? userId,
    _i1.UuidValue? roleId,
  }) {
    return CustomerUser(
      id: id is _i1.UuidValue? ? id : this.id,
      customerId: customerId ?? this.customerId,
      userId: userId ?? this.userId,
      roleId: roleId ?? this.roleId,
    );
  }
}
