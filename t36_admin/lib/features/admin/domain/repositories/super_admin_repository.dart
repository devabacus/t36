// manifest: startProject

import 'package:t36_client/t36_client.dart';
import '../../domain/repositories/i_admin_repository.dart';

/// Реализация репозитория для суперадминистратора.
/// Вызывает эндпоинты `client.superAdmin.*`.
class SuperAdminRepository implements IAdminRepository {
  final Client _client;
  SuperAdminRepository(this._client);

  @override
  Future<List<UserDetails>> getUsers() async {
    final result = await _client.superAdmin.saListAllUsers();
    return result.map((e) => UserDetails(userInfo: e.userInfo, role: e.role)).toList();
  }

  @override
  Future<SuperUserDetails?> getUserDetails(int userId) => _client.superAdmin.saGetUserDetails(userId);

  @override
  Future<void> createUser({
    required String userName,
    required String email,
    required String password,
    required String customerId,
    required String roleId,
  }) async {
    await _client.superAdmin.saCreateUser(
      userName: userName,
      email: email,
      password: password,
      customerId: UuidValue.fromString(customerId),
      roleId: UuidValue.fromString(roleId),
    );
  }

  @override
  Future<void> updateUser({
    required int userId,
    required String userName,
    required String email,
    required String customerId,
    required String roleId,
  }) async {
    await _client.superAdmin.saUpdateUser(
        userId: userId,
        userName: userName,
        email: email,
        customerId: UuidValue.fromString(customerId),
        roleId: UuidValue.fromString(roleId));
  }

  @override
  Future<void> deleteUser(int userId) => _client.superAdmin.saDeleteUser(userId);

  @override
  Future<void> blockUser(int userId, bool blocked) => _client.superAdmin.saBlockUser(userId, blocked);

  @override
  Future<List<Role>> getRoles() => _client.superAdmin.saListAllRoles();

  @override
  Future<RoleDetails?> getRoleDetails(String roleId) => _client.superAdmin.saGetRoleDetails(UuidValue.fromString(roleId));

  @override
  Future<List<Permission>> getPermissions() => _client.superAdmin.saListAllPermissions();

  @override
  Future<void> createRole({
    required String roleName,
    required String? roleDescription,
    required List<String> permissionIds,
  }) async {
    await _client.superAdmin.saCreateOrUpdateRole(
        role: Role(
            name: roleName,
            description: roleDescription,
            createdAt: DateTime.now()),
        permissionIds: permissionIds.map((id) => UuidValue.fromString(id)).toList());
  }

  @override
  Future<void> updateRole({required Role role, required List<String> permissionIds}) async {
    await _client.superAdmin.saCreateOrUpdateRole(
        role: role, permissionIds: permissionIds.map((id) => UuidValue.fromString(id)).toList());
  }

  @override
  Future<void> deleteRole(String roleId) => _client.superAdmin.saDeleteRole(UuidValue.fromString(roleId));

  @override
  Future<List<Customer>> getCustomers() => _client.superAdmin.saListCustomers();

  @override
  Future<Customer?> getOrganizationDetails(String organizationId) => _client.superAdmin.saGetCustomer(UuidValue.fromString(organizationId));

  @override
  Future<void> createOrganization({
    required String organizationName,
    required String? organizationEmail,
    required String? organizationInfo,
  }) async {
    await _client.superAdmin.saSaveCustomer(Customer(
      name: organizationName,
      email: organizationEmail,
      info: organizationInfo,
      userId: 0, // установится на сервере
      createdAt: DateTime.now(),
      lastModified: DateTime.now(),
      isDeleted: false,
    ));
  }

  @override
  Future<void> updateOrganization({required Customer customer}) => _client.superAdmin.saSaveCustomer(customer);

  @override
  Future<void> deleteOrganization(String organizationId) => _client.superAdmin.saDeleteCustomer(UuidValue.fromString(organizationId));

  @override
  Future<SuperAdminDashboard> getDashboardData() => _client.superAdmin.saGetDashboard();
}