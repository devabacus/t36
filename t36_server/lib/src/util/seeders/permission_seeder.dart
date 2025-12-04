// manifest: startProject

import 'package:serverpod/serverpod.dart';
import '../../generated/protocol.dart';
import '../../permissions.dart';

class PermissionSeeder {
  // Теперь определения хранятся здесь, а не в виде карты
  static const Map<String, String> _definitions = {
    // Организации
    Permissions.organizationsRead: 'Просмотр списка организаций',
    Permissions.organizationsCreate: 'Создание новых организаций',
    Permissions.organizationsUpdate: 'Редактирование организаций',
    Permissions.organizationsDelete: 'Удаление организаций',
    // Пользователи
    Permissions.usersRead: 'Просмотр списка пользователей',
    Permissions.usersCreate: 'Создание новых пользователей',
    Permissions.usersUpdate: 'Редактирование пользователей',
    Permissions.usersDelete: 'Удаление пользователей',
    Permissions.usersBlock: 'Блокировка и разблокировка пользователей',
    // Роли
    Permissions.rolesRead: 'Просмотр ролей и разрешений',
    Permissions.rolesCreate: 'Создание новых ролей',
    Permissions.rolesUpdate: 'Редактирование ролей и их разрешений',
    Permissions.rolesDelete: 'Удаление ролей',
  };
   
  /// Создает или находит все определенные права доступа.
  static Future<Map<String, Permission>> seed(Session session) async {
    final seededPermissions = <String, Permission>{};

    for (final entry in _definitions.entries) {
      final key = entry.key;
      final description = entry.value;

      var permission = await Permission.db.findFirstRow(session, where: (p) => p.key.equals(key));

      if (permission == null) {
        permission = Permission(
          key: key,
          description: description,
          createdAt: DateTime.now().toUtc(),
        );
        permission = await Permission.db.insertRow(session, permission);
        session.log('Created permission: $key', level: LogLevel.debug);
      }
      seededPermissions[key] = permission;
    }

    return seededPermissions;
  }
}