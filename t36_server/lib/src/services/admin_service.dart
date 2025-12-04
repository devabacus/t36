// manifest: startProject

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

import '../generated/protocol.dart';

/// Сервисный слой для инкапсуляции бизнес-логики администрирования.
/// Не содержит проверок прав доступа.
class AdminService {
  /// Получает список всех пользователей в системе.
  /// Используется суперадмином.
  Future<List<SuperUserDetails>> listAllUsers(Session session, {int? limit, int? offset}) async {
    final customerUsersQuery = await CustomerUser.db.find(
      session,
      limit: limit ?? 100,
      offset: offset ?? 0,
    );

    final userDetailsList = <SuperUserDetails>[];
    for (var cu in customerUsersQuery) {
      final userInfo = await UserInfo.db.findById(session, cu.userId);
      if (userInfo == null) continue;

      final customer = await Customer.db.findById(session, cu.customerId);
      final role = await Role.db.findById(session, cu.roleId);

      userDetailsList.add(SuperUserDetails(
        userInfo: userInfo,
        customer: customer,
        role: role,
        customerUser: cu,
      ));
    }
    return userDetailsList;
  }

  /// Получает список пользователей для конкретной организации.
  /// Используется обычным админом.
  Future<List<UserDetails>> listUsersForCustomer(Session session, UuidValue customerId) async {
    final customerUsers = await CustomerUser.db.find(
      session,
      where: (cu) => cu.customerId.equals(customerId),
    );

    final userDetailsList = <UserDetails>[];
    for (var customerUser in customerUsers) {
      final userInfo = await UserInfo.db.findById(session, customerUser.userId);
      if (userInfo == null) continue;
      final role = await Role.db.findById(session, customerUser.roleId);
      userDetailsList.add(UserDetails(
        userInfo: userInfo,
        role: role,
      ));
    }
    return userDetailsList;
  }

  /// Создает нового пользователя в системе.
  Future<UserInfo?> createUser(Session session, {
    required String userName,
    required String email,
    required String password,
    required UuidValue customerId,
    required UuidValue roleId,
  }) async {
    var createdUser = await Emails.createUser(session, userName, email, password);
    if (createdUser == null) {
      throw Exception('Пользователь с таким email уже существует.');
    }
    await CustomerUser.db.insertRow(session, CustomerUser(
      customerId: customerId,
      userId: createdUser.id!,
      roleId: roleId,
    ));
    return createdUser;
  }

  /// Обновляет данные пользователя.
  Future<bool> updateUser(Session session, {
    required int userId,
    required String userName,
    required String email,
    required UuidValue customerId,
    required UuidValue roleId,
  }) async {
    final userInfo = await UserInfo.db.findById(session, userId);
    if (userInfo == null) throw Exception('Пользователь не найден.');

    if (userInfo.email != email) {
      final existingUser = await Users.findUserByEmail(session, email);
      if (existingUser != null && existingUser.id != userId) {
        throw Exception('Пользователь с таким email уже существует.');
      }
    }

    // Проверка, что роль существует, больше не привязана к организации
    final role = await Role.db.findById(session, roleId);
    if (role == null) {
      throw Exception('Роль не найдена.');
    }

    await session.db.transaction((transaction) async {
      userInfo.userName = userName;
      userInfo.email = email;
      userInfo.userIdentifier = email;
      await UserInfo.db.updateRow(session, userInfo, transaction: transaction);

      final customerUser = await CustomerUser.db.findFirstRow(session, where: (cu) => cu.userId.equals(userId));
      if (customerUser != null) {
        customerUser.customerId = customerId;
        customerUser.roleId = roleId;
        await CustomerUser.db.updateRow(session, customerUser, transaction: transaction);
      } else {
        await CustomerUser.db.insertRow(session, CustomerUser(customerId: customerId, userId: userId, roleId: roleId), transaction: transaction);
      }
    });
    return true;
  }

  /// Удаляет пользователя из системы.
  Future<bool> deleteUser(Session session, {required int userId, required List<int> superAdminUserIds}) async {
    if (superAdminUserIds.contains(userId)) {
      throw Exception('Нельзя удалить суперадминистратора.');
    }
    await session.db.transaction((transaction) async {
      await CustomerUser.db.deleteWhere(session, where: (cu) => cu.userId.equals(userId), transaction: transaction);
      await UserInfo.db.deleteWhere(session, where: (u) => u.id.equals(userId), transaction: transaction);
    });
    return true;
  }

  /// Блокирует или разблокирует пользователя.
  Future<bool> blockUser(Session session, int userId, bool blocked) async {
    final userInfo = await UserInfo.db.findById(session, userId);
    if (userInfo == null) throw Exception('Пользователь не найден.');
    userInfo.blocked = blocked;
    await UserInfo.db.updateRow(session, userInfo);
    return true;
  }

  /// Получает детальную информацию о пользователе.
  Future<SuperUserDetails?> getUserDetails(Session session, int userId) async {
    final userInfo = await UserInfo.db.findById(session, userId);
    if (userInfo == null) return null;

    final customerUser = await CustomerUser.db.findFirstRow(session, where: (cu) => cu.userId.equals(userId));
    Customer? customer;
    Role? role;

    if (customerUser != null) {
      customer = await Customer.db.findById(session, customerUser.customerId);
      role = await Role.db.findById(session, customerUser.roleId);
    }
    return SuperUserDetails(userInfo: userInfo, customer: customer, role: role, customerUser: customerUser);
  }

  /// Получает список всех ролей в системе (они теперь глобальные).
  Future<List<Role>> listAllRoles(Session session) async {
    return await Role.db.find(session, orderBy: (r) => r.name);
  }

  /// Получает все существующие разрешения (permissions).
  Future<List<Permission>> listAllPermissions(Session session) async {
    return await Permission.db.find(session, orderBy: (p) => p.key);
  }

  /// Получает детальную информацию о роли, включая связанные с ней разрешения.
  Future<RoleDetails?> getRoleDetails(Session session, UuidValue roleId) async {
    final role = await Role.db.findById(session, roleId);
    if (role == null) {
      return null;
    }
    final rolePermissions = await RolePermission.db.find(session, where: (rp) => rp.roleId.equals(roleId));
    final permissionIds = rolePermissions.map((rp) => rp.permissionId).toList();
    return RoleDetails(role: role, permissionIds: permissionIds);
  }

  /// Создает или обновляет роль и ее связи с разрешениями.
  /// Роль больше не привязана к customerId.
  Future<Role> createOrUpdateRole(Session session, {
    required Role role,
    required List<UuidValue> permissionIds,
  }) async {
    return await session.db.transaction((transaction) async {
      Role updatedRole;
      if (role.id == null) {
        updatedRole = await Role.db.insertRow(session, role, transaction: transaction);
      } else {
        updatedRole = await Role.db.updateRow(session, role, transaction: transaction);
      }

      await RolePermission.db.deleteWhere(
        session,
        where: (rp) => rp.roleId.equals(updatedRole.id!),
        transaction: transaction,
      );

      if (permissionIds.isNotEmpty) {
        final newLinks = permissionIds.map((permId) => RolePermission(roleId: updatedRole.id!, permissionId: permId)).toList();
        await RolePermission.db.insert(session, newLinks, transaction: transaction);
      }
      return updatedRole;
    });
  }

  /// Удаляет роль.
  Future<bool> deleteRole(Session session, UuidValue roleId) async {
    final assignedUsersCount = await CustomerUser.db.count(session, where: (cu) => cu.roleId.equals(roleId));
    if (assignedUsersCount > 0) {
      throw Exception('Нельзя удалить роль, так как она назначена пользователям ($assignedUsersCount).');
    }

    await session.db.transaction((transaction) async {
      await RolePermission.db.deleteWhere(session, where: (rp) => rp.roleId.equals(roleId), transaction: transaction);
      await Role.db.deleteWhere(session, where: (r) => r.id.equals(roleId), transaction: transaction);
    });

    return true;
  }

  /// Возвращает список всех организаций.
  Future<List<Customer>> listCustomers(Session session) async {
    return Customer.db.find(session, orderBy: (t) => t.name);
  }

  /// Сохраняет (создает или обновляет) организацию.
  Future<Customer> saveCustomer(Session session, {
    required Customer customer,
    required int creatorId,
  }) async {
    if (customer.id == null) {
      // ID создателя передается из эндпоинта
      customer.userId = creatorId;
      return Customer.db.insertRow(session, customer);
    } else {
      return Customer.db.updateRow(session, customer);
    }
  }

  /// Возвращает детали одной организации по ID.
  Future<Customer?> getCustomer(Session session, UuidValue customerId) async {
    return await Customer.db.findById(session, customerId);
  }

   /// Удаляет организацию, если к ней не привязаны пользователи.
  Future<bool> deleteCustomer(Session session, UuidValue customerId) async {
    final usersCount = await CustomerUser.db.count(
      session,
      where: (cu) => cu.customerId.equals(customerId),
    );

    if (usersCount > 0) {
      throw Exception(
        'Нельзя удалить клиента с активными пользователями ($usersCount).',
      );
    }
    
    // ИСПРАВЛЕНО: Полностью удален блок, который пытался удалять роли по customerId,
    // так как этой связи больше не существует.

    await session.db.transaction((transaction) async {
      // Удаляем клиента
      await Customer.db.deleteWhere(
        session,
        where: (c) => c.id.equals(customerId),
        transaction: transaction,
      );
    });

    return true;
  }
}