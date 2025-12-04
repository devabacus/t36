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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import '../user/role.dart' as _i3;
import 'package:t36_client/src/protocol/protocol.dart' as _i4;

abstract class UserDetails implements _i1.SerializableModel {
  UserDetails._({
    required this.userInfo,
    this.role,
  });

  factory UserDetails({
    required _i2.UserInfo userInfo,
    _i3.Role? role,
  }) = _UserDetailsImpl;

  factory UserDetails.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserDetails(
      userInfo: _i4.Protocol().deserialize<_i2.UserInfo>(
        jsonSerialization['userInfo'],
      ),
      role: jsonSerialization['role'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Role>(jsonSerialization['role']),
    );
  }

  _i2.UserInfo userInfo;

  _i3.Role? role;

  /// Returns a shallow copy of this [UserDetails]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserDetails copyWith({
    _i2.UserInfo? userInfo,
    _i3.Role? role,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserDetails',
      'userInfo': userInfo.toJson(),
      if (role != null) 'role': role?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserDetailsImpl extends UserDetails {
  _UserDetailsImpl({
    required _i2.UserInfo userInfo,
    _i3.Role? role,
  }) : super._(
         userInfo: userInfo,
         role: role,
       );

  /// Returns a shallow copy of this [UserDetails]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserDetails copyWith({
    _i2.UserInfo? userInfo,
    Object? role = _Undefined,
  }) {
    return UserDetails(
      userInfo: userInfo ?? this.userInfo.copyWith(),
      role: role is _i3.Role? ? role : this.role?.copyWith(),
    );
  }
}
