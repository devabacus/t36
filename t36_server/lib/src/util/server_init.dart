// manifest: startProject

import 'package:serverpod/serverpod.dart';

import 'seeders/permission_seeder.dart';
import 'seeders/role_seeder.dart';
import 'seeders/user_seeder.dart';

/// Класс для первоначального заполнения базы данных (seeding).
class ServerInit {
  /// Основной метод для запуска процесса инициализации.
  static Future<void> run(Session session) async {
    session.log('Database initialization process started.', level: LogLevel.info);

    // 1. Создаем или находим все необходимые права в системе.
    final permissions = await PermissionSeeder.seed(session);
    session.log(
      'Permissions seeding completed. ${permissions.length} permissions found or created.',
      level: LogLevel.info,
    );

    // 2. Создаем или находим организацию по умолчанию.
    final defaultCustomer = await UserSeeder.seedDefaultCustomer(session);
    session.log(
      'Default customer seeding completed. Found or created "${defaultCustomer.name}".',
      level: LogLevel.info,
    );

    // 3. Создаем роли и назначаем им права.
    final roles = await RoleSeeder.seed(session, permissions);
    session.log(
      'Roles seeding completed. ${roles.length} roles processed.',
      level: LogLevel.info,
    );

    // 4. Создаем системных пользователей (Админ, Демо и т.д.).
    await UserSeeder.seed(session, defaultCustomer, roles);
    session.log('Users seeding completed.', level: LogLevel.info);

    session.log('Database initialization process finished successfully.', level: LogLevel.info);
  }
}