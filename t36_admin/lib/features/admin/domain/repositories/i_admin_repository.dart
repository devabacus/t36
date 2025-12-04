// manifest: startProject

import 'package:t36_client/t36_client.dart';

/// Абстрактный репозиторий, определяющий контракт для всех административных действий.
abstract class IAdminRepository {
  // --- Пользователи ---
  Future<List<UserDetails>> getUsers();
  Future<SuperUserDetails?> getUserDetails(int userId);
  Future<void> createUser({
    required String userName,
    required String email,
    required String password,
    required String customerId,
    required String roleId,
  });
  Future<void> updateUser({
    required int userId,
    required String userName,
    required String email,
    required String customerId,
    required String roleId,
  });
  Future<void> deleteUser(int userId);
  Future<void> blockUser(int userId, bool blocked);

  // --- Роли ---
  Future<List<Role>> getRoles();
  Future<RoleDetails?> getRoleDetails(String roleId);
  Future<List<Permission>> getPermissions();
  Future<void> createRole({
    required String roleName,
    required String? roleDescription,
    required List<String> permissionIds,
  });
  Future<void> updateRole({
    required Role role,
    required List<String> permissionIds,
  });
  Future<void> deleteRole(String roleId);

  // --- Организации (Customers) ---
  Future<List<Customer>> getCustomers();
  Future<Customer?> getOrganizationDetails(String organizationId);
  Future<void> createOrganization({
    required String organizationName,
    required String? organizationEmail,
    required String? organizationInfo,
  });
  Future<void> updateOrganization({required Customer customer});
  Future<void> deleteOrganization(String organizationId);
  
  // --- Дашборд ---
  Future<SuperAdminDashboard> getDashboardData();
}