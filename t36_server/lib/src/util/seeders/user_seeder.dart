// manifest: startProject

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart' as auth;
import '../../generated/protocol.dart';

class UserSeeder {
  /// Главный метод для создания пользователей.
  static Future<void> seed(Session session, Customer defaultCustomer, Map<String, Role> roles) async {
    // 1. Создаем Супер Администратора
    final superAdmin = await _createOrUpdateUser(
      session,
      userName: 'SuperAdmin',
      email: 'admin@example.com',
      password: '123qweasd',
      fullName: 'Главный Администратор',
      customer: defaultCustomer,
      role: roles['superAdmin']!,
    );

    // Обновляем ID создателя у организации по-умолчанию
    if (defaultCustomer.userId != superAdmin.id) {
      defaultCustomer.userId = superAdmin.id!;
      await Customer.db.updateRow(session, defaultCustomer);
    }

    // 2. Создаем Демо-пользователя
    await _createOrUpdateUser(
      session,
      userName: 'DemoUser',
      email: 'demo@example.com',
      password: '123qweasd',
      fullName: 'Демонстрационный Пользователь',
      customer: defaultCustomer,
      role: roles['demo']!,
    );
  }

  /// Создает или находит организацию по умолчанию.
  static Future<Customer> seedDefaultCustomer(Session session) async {
    var customer = await Customer.db.findFirstRow(session, where: (c) => c.name.equals('Default Corp'));
    if (customer == null) {
      customer = Customer(
        name: 'Default Corp',
        userId: 0, // Временно, будет обновлен после создания админа
        createdAt: DateTime.now().toUtc(),
        lastModified: DateTime.now().toUtc(),
        isDeleted: false,
      );
      customer = await Customer.db.insertRow(session, customer);
    }
    return customer;
  }

  /// Вспомогательный метод для создания/обновления одного пользователя.
  static Future<auth.UserInfo> _createOrUpdateUser(
    Session session, {
    required String userName,
    required String email,
    required String password,
    String? fullName,
    required Customer customer,
    required Role role,
  }) async {
    var userInfo = await auth.Users.findUserByEmail(session, email);

    if (userInfo == null) {
      // 1. Создаем запись UserInfo
      final newUserInfo = auth.UserInfo(
        userName: userName,
        email: email,
        fullName: fullName,
        created: DateTime.now().toUtc(),
        scopeNames: [],
        blocked: false,
        userIdentifier: email,
      );
      userInfo = await auth.Users.createUser(session, newUserInfo, password);

      if (userInfo == null) {
        throw Exception('Failed to create user $userName');
      }
      
      var emailAuth = await auth.EmailAuth.db.findFirstRow(session, where: (e) => e.email.equals(email));
      if (emailAuth == null) {
        final passwordHash = await auth.AuthConfig.current.passwordHashGenerator(password);
        await auth.EmailAuth.db.insertRow(
            session,
            auth.EmailAuth(
                userId: userInfo.id!, email: email, hash: passwordHash));
        session.log('Created EmailAuth for user: $userName', level: LogLevel.debug);
      }
      
      session.log('Created user: $userName', level: LogLevel.debug);
    }

    // 3. Убеждаемся, что пользователь привязан к организации и роли
    await _ensureCustomerUserLink(session, userInfo, customer, role);
    return userInfo;
  }

  /// Гарантирует, что у пользователя есть связь с организацией и ролью.
  static Future<void> _ensureCustomerUserLink(
      Session session, auth.UserInfo userInfo, Customer customer, Role role) async {
    var link = await CustomerUser.db.findFirstRow(session, where: (cu) => cu.userId.equals(userInfo.id!));

    if (link == null) {
      link = CustomerUser(
        customerId: customer.id!,
        userId: userInfo.id!,
        roleId: role.id!,
      );
      await CustomerUser.db.insertRow(session, link);
      session.log('Linked user "${userInfo.userName}" to customer "${customer.name}".', level: LogLevel.debug);
    } else {
      bool needsUpdate = false;
      if (link.customerId != customer.id) {
        link.customerId = customer.id!;
        needsUpdate = true;
      }
      if (link.roleId != role.id) {
        link.roleId = role.id!;
        needsUpdate = true;
      }
      if (needsUpdate) {
        await CustomerUser.db.updateRow(session, link);
        session.log('Updated link for user "${userInfo.userName}".', level: LogLevel.debug);
      }
    }
  }
}