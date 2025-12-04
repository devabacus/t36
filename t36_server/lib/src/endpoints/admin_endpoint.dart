// manifest: startProject
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

import '../generated/protocol.dart';
import '../permissions.dart';
import '../services/admin_service.dart';
import 'shared/auth_context_mixin.dart';

class AdminEndpoint extends Endpoint with AuthContextMixin {
  final AdminService _adminService = AdminService();

  Future<void> _requirePermission(Session session, String permissionKey) async {
    final authContext = await getAuthenticatedUserContext(session);
    final customerUser = await CustomerUser.db.findFirstRow(session,
        where: (cu) =>
            cu.userId.equals(authContext.userId) &
            cu.customerId.equals(authContext.customerId));
    if (customerUser == null) {
      throw Exception('Доступ запрещен: пользователь не найден в организации.');
    }
    final rolePermissions = await RolePermission.db
        .find(session, where: (rp) => rp.roleId.equals(customerUser.roleId));
    final permissionIds = rolePermissions.map((rp) => rp.permissionId).toList();
    if (permissionIds.isEmpty) {
      throw Exception('Доступ запрещен: у вашей роли нет разрешений.');
    }
    final permissions = await Permission.db
        .find(session, where: (p) => p.id.inSet(permissionIds.toSet()));
    final userPermissionKeys = permissions.map((p) => p.key).toSet();
    if (!userPermissionKeys.contains(Permissions.superAdmin) &&
        !userPermissionKeys.contains(permissionKey)) {
      throw Exception(
          'Доступ запрещен: недостаточно прав для выполнения операции.');
    }
  }

  Future<List<UserDetails>> listUsers(Session session) async {
    await _requirePermission(session, Permissions.usersRead);
    final authContext = await getAuthenticatedUserContext(session);

    return _adminService.listUsersForCustomer(session, authContext.customerId);
  }

  Future<bool> updateUserRole(Session session,
      {required int userId, required UuidValue roleId}) async {
    await _requirePermission(session, Permissions.usersUpdate);
    final authContext = await getAuthenticatedUserContext(session);
    var customerUser = await CustomerUser.db.findFirstRow(session,
        where: (cu) =>
            cu.userId.equals(userId) &
            cu.customerId.equals(authContext.customerId));
    if (customerUser == null) return false;
    customerUser.roleId = roleId;
    await CustomerUser.db.updateRow(session, customerUser);
    return true;
  }

  Future<List<Role>> listRoles(Session session) async {
    await _requirePermission(session, Permissions.rolesRead);
    return _adminService.listAllRoles(session);
  }

  Future<List<Permission>> listPermissions(Session session) async {
    await _requirePermission(session, Permissions.rolesRead);
    return _adminService.listAllPermissions(session);
  }

  Future<Role> createOrUpdateRole(
      Session session, Role role, List<UuidValue> permissionIds) async {
    if (role.id == null) {
      // Это создание новой роли
      await _requirePermission(session, Permissions.rolesCreate);
    } else {
      // Это обновление существующей роли
      await _requirePermission(session, Permissions.rolesUpdate);
    }
    
    return _adminService.createOrUpdateRole(
        session, role: role, permissionIds: permissionIds);
  }

  Future<bool> deleteRole(Session session, UuidValue roleId) async {
    await _requirePermission(session, Permissions.rolesDelete);
    return _adminService.deleteRole(session, roleId);
  }

  Future<Customer?> getMyCustomer(Session session) async {
    final authContext = await getAuthenticatedUserContext(session);
    return await Customer.db.findById(session, authContext.customerId);
  }

  Future<UserInfo?> createUser(
    Session session, {
    required String userName,
    required String email,
    required String password,
    required UuidValue roleId,
  }) async {
    await _requirePermission(session, Permissions.usersCreate);
    final authContext = await getAuthenticatedUserContext(session);

    final role = await Role.db.findById(session, roleId);
    if (role == null) {
      throw Exception('Указанная роль не найдена.');
    }

    return await _adminService.createUser(
      session,
      userName: userName,
      email: email,
      password: password,
      customerId: authContext.customerId,
      roleId: roleId,
    );
  }

  Future<UserDetails?> getUserDetails(Session session, int userId) async {
    await _requirePermission(session, Permissions.usersRead);
    final authContext = await getAuthenticatedUserContext(session);

    final customerUser = await CustomerUser.db.findFirstRow(session,
        where: (cu) =>
            cu.userId.equals(userId) &
            cu.customerId.equals(authContext.customerId));

    if (customerUser == null) {
      throw Exception('Пользователь не найден в вашей организации.');
    }

    final userInfo = await UserInfo.db.findById(session, userId);
    final role = await Role.db.findById(session, customerUser.roleId);

    if (userInfo == null) return null;

    return UserDetails(
      userInfo: userInfo,
      role: role,
    );
  }

  Future<bool> blockUser(Session session, int userId, bool blocked) async {
    await _requirePermission(session, Permissions.usersBlock);
    return _adminService.blockUser(session, userId, blocked);
  }

  Future<RoleDetails?> getRoleDetails(
      Session session, UuidValue roleId) async {
    return _adminService.getRoleDetails(session, roleId);
  }

  Future<bool> updateUser(
    Session session, {
    required int userId,
    required String userName,
    required String email,
    required UuidValue roleId,
  }) async {
    await _requirePermission(session, Permissions.usersUpdate);
    final authContext = await getAuthenticatedUserContext(session);

    final userToUpdateLink = await CustomerUser.db.findFirstRow(session,
        where: (cu) => cu.userId.equals(userId));
    if (userToUpdateLink == null ||
        userToUpdateLink.customerId != authContext.customerId) {
      throw Exception('Пользователь не найден в вашей организации.');
    }
    
    final role = await Role.db.findById(session, roleId);
    if (role == null) {
      throw Exception('Указанная роль не найдена.');
    }

    return await _adminService.updateUser(
      session,
      userId: userId,
      userName: userName,
      email: email,
      customerId: authContext.customerId,
      roleId: roleId,
    );
  }
}