// manifest: startProject

import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';

class RoleSeeder {
  /// Создает или обновляет системные роли и их права.
  static Future<Map<String, Role>> seed(Session session, Map<String, Permission> permissions) async {
    final seededRoles = <String, Role>{};

    // 1. Роль Супер Администратора
    final superAdminRole = await _createOrUpdateRole(
      session,
      name: 'Super Admin',
      description: 'Имеет доступ ко всем функциям системы.',
      permissionsToAssign: permissions.values.toList(),
    );
    seededRoles['superAdmin'] = superAdminRole;

    // 2. Роль Демо-пользователя (только чтение)
    final readPermissions = permissions.values.where((p) => p.key.endsWith('.read')).toList();
    final demoRole = await _createOrUpdateRole(
      session,
      name: 'Demo User',
      description: 'Имеет права только на чтение.',
      permissionsToAssign: readPermissions,
    );
    seededRoles['demo'] = demoRole;

    return seededRoles;
  }

  /// Вспомогательный метод для создания/обновления одной роли и её прав.
  static Future<Role> _createOrUpdateRole(
    Session session, {
    required String name,
    required String description,
    required List<Permission> permissionsToAssign,
  }) async {
    var role = await Role.db.findFirstRow(session, where: (r) => r.name.equals(name));

    if (role == null) {
      role = Role(
        name: name,
        description: description,
        createdAt: DateTime.now().toUtc(),
        updatedAt: DateTime.now().toUtc(),
      );
      role = await Role.db.insertRow(session, role);
      session.log('Created role: ${role.name}', level: LogLevel.debug);
    }

    // Привязываем права, проверяя только недостающие
    await _ensurePermissionsForRole(session, role, permissionsToAssign);
    return role;
  }

  /// Гарантирует, что у роли есть все необходимые права.
  static Future<void> _ensurePermissionsForRole(
    Session session,
    Role role,
    List<Permission> requiredPermissions,
  ) async {
    final existingLinks = await RolePermission.db.find(
      session,
      where: (rp) => rp.roleId.equals(role.id!),
    );
    final existingPermissionIds = existingLinks.map((link) => link.permissionId).toSet();

    final missingPermissions = requiredPermissions
        .where((p) => p.id != null && !existingPermissionIds.contains(p.id!))
        .toList();

    if (missingPermissions.isNotEmpty) {
      final newLinks = missingPermissions.map((p) => RolePermission(
            roleId: role.id!,
            permissionId: p.id!,
          )).toList();
      await RolePermission.db.insert(session, newLinks);
      session.log(
        'Assigned ${newLinks.length} new permissions to role "${role.name}".',
        level: LogLevel.debug,
      );
    }
  }
}