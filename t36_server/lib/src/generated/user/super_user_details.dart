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
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import '../user/customer.dart' as _i3;
import '../user/role.dart' as _i4;
import '../user/customer_user.dart' as _i5;
import 'package:t36_server/src/generated/protocol.dart' as _i6;

abstract class SuperUserDetails
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SuperUserDetails._({
    required this.userInfo,
    this.customer,
    this.role,
    this.customerUser,
  });

  factory SuperUserDetails({
    required _i2.UserInfo userInfo,
    _i3.Customer? customer,
    _i4.Role? role,
    _i5.CustomerUser? customerUser,
  }) = _SuperUserDetailsImpl;

  factory SuperUserDetails.fromJson(Map<String, dynamic> jsonSerialization) {
    return SuperUserDetails(
      userInfo: _i6.Protocol().deserialize<_i2.UserInfo>(
        jsonSerialization['userInfo'],
      ),
      customer: jsonSerialization['customer'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.Customer>(
              jsonSerialization['customer'],
            ),
      role: jsonSerialization['role'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.Role>(jsonSerialization['role']),
      customerUser: jsonSerialization['customerUser'] == null
          ? null
          : _i6.Protocol().deserialize<_i5.CustomerUser>(
              jsonSerialization['customerUser'],
            ),
    );
  }

  _i2.UserInfo userInfo;

  _i3.Customer? customer;

  _i4.Role? role;

  _i5.CustomerUser? customerUser;

  /// Returns a shallow copy of this [SuperUserDetails]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SuperUserDetails copyWith({
    _i2.UserInfo? userInfo,
    _i3.Customer? customer,
    _i4.Role? role,
    _i5.CustomerUser? customerUser,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SuperUserDetails',
      'userInfo': userInfo.toJson(),
      if (customer != null) 'customer': customer?.toJson(),
      if (role != null) 'role': role?.toJson(),
      if (customerUser != null) 'customerUser': customerUser?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SuperUserDetails',
      'userInfo': userInfo.toJsonForProtocol(),
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      if (role != null) 'role': role?.toJsonForProtocol(),
      if (customerUser != null)
        'customerUser': customerUser?.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SuperUserDetailsImpl extends SuperUserDetails {
  _SuperUserDetailsImpl({
    required _i2.UserInfo userInfo,
    _i3.Customer? customer,
    _i4.Role? role,
    _i5.CustomerUser? customerUser,
  }) : super._(
         userInfo: userInfo,
         customer: customer,
         role: role,
         customerUser: customerUser,
       );

  /// Returns a shallow copy of this [SuperUserDetails]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SuperUserDetails copyWith({
    _i2.UserInfo? userInfo,
    Object? customer = _Undefined,
    Object? role = _Undefined,
    Object? customerUser = _Undefined,
  }) {
    return SuperUserDetails(
      userInfo: userInfo ?? this.userInfo.copyWith(),
      customer: customer is _i3.Customer?
          ? customer
          : this.customer?.copyWith(),
      role: role is _i4.Role? ? role : this.role?.copyWith(),
      customerUser: customerUser is _i5.CustomerUser?
          ? customerUser
          : this.customerUser?.copyWith(),
    );
  }
}
