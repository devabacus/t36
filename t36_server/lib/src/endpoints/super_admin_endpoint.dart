// manifest: startProject
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

import '../generated/protocol.dart';
import '../services/admin_service.dart';
import 'shared/auth_context_mixin.dart';

class SuperAdminEndpoint extends Endpoint with AuthContextMixin {
  final AdminService _adminService = AdminService();
  static const List<int> _superAdminUserIds = [1];

  Future<void> _requireSuperAdmin(Session session) async {
    final authContext = await getAuthenticatedUserContext(session);
    if (!_superAdminUserIds.contains(authContext.userId)) {
      throw Exception('Доступ запрещен.');
    }
  }

  Future<List<Customer>> saListCustomers(Session session) async {
    await _requireSuperAdmin(session);
    return _adminService.listCustomers(session);
  }

  Future<Customer> saSaveCustomer(Session session, Customer customer) async {
    await _requireSuperAdmin(session);
    final authContext = await getAuthenticatedUserContext(session);
    return _adminService.saveCustomer(session,
        customer: customer, creatorId: authContext.userId);
  }

  Future<UserInfo?> saCreateUser(
    Session session, {
    required String userName,
    required String email,
    required String password,
    required UuidValue customerId,
    required UuidValue roleId,
  }) async {
    await _requireSuperAdmin(session);
    return _adminService.createUser(session,
        userName: userName,
        email: email,
        password: password,
        customerId: customerId,
        roleId: roleId);
  }

  Future<List<SuperUserDetails>> saListAllUsers(
    Session session, {
    UuidValue? customerId,
    int? limit,
    int? offset,
  }) async {
    await _requireSuperAdmin(session);
    return _adminService.listAllUsers(session, limit: limit, offset: offset);
  }

  Future<bool> saBlockUser(Session session, int userId, bool blocked) async {
    await _requireSuperAdmin(session);
    return _adminService.blockUser(session, userId, blocked);
  }

  // ИСПРАВЛЕНО: Делегируем удаление сервису
  Future<bool> saDeleteCustomer(Session session, UuidValue customerId) async {
    await _requireSuperAdmin(session);
    return _adminService.deleteCustomer(session, customerId);
  }

  Future<SuperAdminDashboard> saGetDashboard(Session session) async {
    await _requireSuperAdmin(session);

    final totalUsers = await UserInfo.db.count(session);
    final totalCustomers = await Customer.db.count(session);
    final blockedUsers = await UserInfo.db.count(
      session,
      where: (u) => u.blocked.equals(true),
    );
    final activeUsers = await CustomerUser.db.count(session);

    final recentUsers = await UserInfo.db.find(
      session,
      orderBy: (u) => u.created,
      orderDescending: true,
      limit: 10,
    );

    return SuperAdminDashboard(
      totalUsers: totalUsers,
      totalCustomers: totalCustomers,
      blockedUsers: blockedUsers,
      activeUsers: activeUsers,
      recentUsers: recentUsers,
    );
  }

  Future<List<Role>> saListAllRoles(Session session,
      {UuidValue? customerId}) async {
    await _requireSuperAdmin(session);
    return _adminService.listAllRoles(session);
  }

  Future<bool> saMoveUserToCustomer(
    Session session, {
    required int userId,
    required UuidValue newCustomerId,
    required UuidValue newRoleId,
  }) async {
    await _requireSuperAdmin(session);

    // ИСПРАВЛЕНО: Проверяем только, что роль существует, без привязки к организации
    final role = await Role.db.findById(session, newRoleId);
    if (role == null) {
      throw Exception('Роль не найдена.');
    }

    var customerUser = await CustomerUser.db.findFirstRow(
      session,
      where: (cu) => cu.userId.equals(userId),
    );

    if (customerUser == null) {
      await CustomerUser.db.insertRow(
        session,
        CustomerUser(
          customerId: newCustomerId,
          userId: userId,
          roleId: newRoleId,
        ),
      );
    } else {
      customerUser.customerId = newCustomerId;
      customerUser.roleId = newRoleId;
      await CustomerUser.db.updateRow(session, customerUser);
    }

    return true;
  }

  Future<List<Permission>> saListAllPermissions(Session session) async {
    await _requireSuperAdmin(session);
    return _adminService.listAllPermissions(session);
  }

  Future<Role> saCreateOrUpdateRole(
    Session session, {
    required Role role,
    required List<UuidValue> permissionIds,
  }) async {
    await _requireSuperAdmin(session);
    return _adminService.createOrUpdateRole(session,
        role: role, permissionIds: permissionIds);
  }

  Future<bool> saDeleteRole(Session session, UuidValue roleId) async {
    await _requireSuperAdmin(session);
    return _adminService.deleteRole(session, roleId);
  }

  Future<RoleDetails?> saGetRoleDetails(
      Session session, UuidValue roleId) async {
    await _requireSuperAdmin(session);
    return _adminService.getRoleDetails(session, roleId);
  }

  Future<bool> saUpdateUser(
    Session session, {
    required int userId,
    required String userName,
    required String email,
    required UuidValue customerId,
    required UuidValue roleId,
  }) async {
    await _requireSuperAdmin(session);
    return _adminService.updateUser(session,
        userId: userId,
        userName: userName,
        email: email,
        customerId: customerId,
        roleId: roleId);
  }

  Future<bool> saDeleteUser(Session session, int userId) async {
    await _requireSuperAdmin(session);
    return _adminService.deleteUser(session,
        userId: userId, superAdminUserIds: _superAdminUserIds);
  }

  Future<SuperUserDetails?> saGetUserDetails(
      Session session, int userId) async {
    await _requireSuperAdmin(session);
    return _adminService.getUserDetails(session, userId);
  }

  Future<Customer?> saGetCustomer(Session session, UuidValue customerId) async {
    await _requireSuperAdmin(session);
    return await Customer.db.findById(session, customerId);
  }
}