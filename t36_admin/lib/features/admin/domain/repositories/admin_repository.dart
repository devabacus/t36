// manifest: startProject

import 'package:t36_client/t36_client.dart';
import '../../domain/repositories/i_admin_repository.dart';

/// Реализация репозитория для обычного администратора.
/// Вызывает эндпоинты `client.admin.*`.
class AdminRepository implements IAdminRepository {
  final Client _client;
  AdminRepository(this._client);

  @override
  Future<List<UserDetails>> getUsers() => _client.admin.listUsers();

  @override
  Future<void> createUser({
    required String userName,
    required String email,
    required String password,
    required String roleId,
    String? customerId, // Не используется, но нужен для соответствия интерфейсу
  }) async {
    await _client.admin.createUser(
      userName: userName,
      email: email,
      password: password,
      roleId: UuidValue.fromString(roleId),
    );
  }
  
  // Методы, которые не должны быть доступны обычному админу,
  // выбрасывают исключение или возвращают пустые данные.
  @override
  Future<List<Customer>> getCustomers() async {
     final myCustomer = await _client.admin.getMyCustomer();
     return myCustomer != null ? [myCustomer] : [];
  }

  @override
  Future<void> deleteUser(int userId) async {
    // Реализация на сервере для админа может быть добавлена в будущем
    throw UnimplementedError('Администраторы не могут удалять пользователей.');
  }

  @override
  Future<List<Role>> getRoles() => _client.admin.listRoles();

  @override
  Future<List<Permission>> getPermissions() => _client.admin.listPermissions();
  
  // Остальные методы можно реализовать по аналогии или оставить как "заглушки",
  // если они не должны быть доступны обычному админу.
  
  @override
  Future<SuperUserDetails?> getUserDetails(int userId) async {
    // Вызываем новый безопасный эндпоинт, который вернет UserDetails
    final userDetails = await _client.admin.getUserDetails(userId);
    if (userDetails == null) return null;

    // Страница редактирования ожидает SuperUserDetails, поэтому мы "обогащаем"
    // полученные данные информацией об организации текущего админа.
    final customer = await _client.admin.getMyCustomer();

    return SuperUserDetails(
      userInfo: userDetails.userInfo,
      role: userDetails.role,
      customer: customer,
      // customerUser не используется на странице редактирования, поэтому может быть null
      customerUser: null, 
    );
  }

 @override
  Future<void> updateUser({
    required int userId,
    required String userName,
    required String email,
    required String customerId, // Этот параметр игнорируется, т.к. сервер знает организацию админа
    required String roleId,
  }) async {
    await _client.admin.updateUser(
        userId: userId,
        userName: userName,
        email: email,
        roleId: UuidValue.fromString(roleId),
    );
  }

  @override
  Future<void> blockUser(int userId, bool blocked) {
     return _client.admin.blockUser(userId, blocked);
  }

@override
Future<RoleDetails?> getRoleDetails(String roleId) async {
  return _client.admin.getRoleDetails(UuidValue.fromString(roleId));
}

  @override
  Future<void> createRole({
    required String roleName,
    required String? roleDescription,
    required List<String> permissionIds,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateRole({required Role role, required List<String> permissionIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteRole(String roleId) {
    throw UnimplementedError();
  }

  @override
  Future<Customer?> getOrganizationDetails(String organizationId) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> createOrganization({
    required String organizationName,
    required String? organizationEmail,
    required String? organizationInfo,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateOrganization({required Customer customer}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteOrganization(String organizationId) {
    throw UnimplementedError();
  }
  
  @override
  Future<SuperAdminDashboard> getDashboardData() async {
    // Возвращаем пустые данные, т.к. дашборд для админа ограничен
    return SuperAdminDashboard(
        totalUsers: 0,
        totalCustomers: 0,
        blockedUsers: 0,
        activeUsers: 0,
        recentUsers: []);
  }
}