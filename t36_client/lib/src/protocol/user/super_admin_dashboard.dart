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
import 'package:t36_client/src/protocol/protocol.dart' as _i3;

abstract class SuperAdminDashboard implements _i1.SerializableModel {
  SuperAdminDashboard._({
    required this.totalUsers,
    required this.totalCustomers,
    required this.blockedUsers,
    required this.activeUsers,
    required this.recentUsers,
  });

  factory SuperAdminDashboard({
    required int totalUsers,
    required int totalCustomers,
    required int blockedUsers,
    required int activeUsers,
    required List<_i2.UserInfo> recentUsers,
  }) = _SuperAdminDashboardImpl;

  factory SuperAdminDashboard.fromJson(Map<String, dynamic> jsonSerialization) {
    return SuperAdminDashboard(
      totalUsers: jsonSerialization['totalUsers'] as int,
      totalCustomers: jsonSerialization['totalCustomers'] as int,
      blockedUsers: jsonSerialization['blockedUsers'] as int,
      activeUsers: jsonSerialization['activeUsers'] as int,
      recentUsers: _i3.Protocol().deserialize<List<_i2.UserInfo>>(
        jsonSerialization['recentUsers'],
      ),
    );
  }

  int totalUsers;

  int totalCustomers;

  int blockedUsers;

  int activeUsers;

  List<_i2.UserInfo> recentUsers;

  /// Returns a shallow copy of this [SuperAdminDashboard]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SuperAdminDashboard copyWith({
    int? totalUsers,
    int? totalCustomers,
    int? blockedUsers,
    int? activeUsers,
    List<_i2.UserInfo>? recentUsers,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SuperAdminDashboard',
      'totalUsers': totalUsers,
      'totalCustomers': totalCustomers,
      'blockedUsers': blockedUsers,
      'activeUsers': activeUsers,
      'recentUsers': recentUsers.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SuperAdminDashboardImpl extends SuperAdminDashboard {
  _SuperAdminDashboardImpl({
    required int totalUsers,
    required int totalCustomers,
    required int blockedUsers,
    required int activeUsers,
    required List<_i2.UserInfo> recentUsers,
  }) : super._(
         totalUsers: totalUsers,
         totalCustomers: totalCustomers,
         blockedUsers: blockedUsers,
         activeUsers: activeUsers,
         recentUsers: recentUsers,
       );

  /// Returns a shallow copy of this [SuperAdminDashboard]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SuperAdminDashboard copyWith({
    int? totalUsers,
    int? totalCustomers,
    int? blockedUsers,
    int? activeUsers,
    List<_i2.UserInfo>? recentUsers,
  }) {
    return SuperAdminDashboard(
      totalUsers: totalUsers ?? this.totalUsers,
      totalCustomers: totalCustomers ?? this.totalCustomers,
      blockedUsers: blockedUsers ?? this.blockedUsers,
      activeUsers: activeUsers ?? this.activeUsers,
      recentUsers:
          recentUsers ?? this.recentUsers.map((e0) => e0.copyWith()).toList(),
    );
  }
}
