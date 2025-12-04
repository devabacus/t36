// manifest: startProject

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/session_manager_provider.dart';

extension PermissionExtension on WidgetRef {
  /// Проверяет, есть ли у текущего пользователя указанное право.
  bool hasPermission(String permission) {
    return watch(currentUserPermissionsProvider).contains(permission);
  }

  /// Проверяет, есть ли у пользователя хотя бы одно из перечисленных прав.
  bool hasAnyPermission(List<String> permissions) {
    final userPermissions = watch(currentUserPermissionsProvider);
    return permissions.any((p) => userPermissions.contains(p));
  }

  /// Проверяет, есть ли у пользователя все перечисленные права.
  bool hasAllPermissions(List<String> permissions) {
    final userPermissions = watch(currentUserPermissionsProvider);
    return permissions.every((p) => userPermissions.contains(p));
  }
}