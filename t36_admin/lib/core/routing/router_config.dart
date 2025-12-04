// manifest: startProject

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:t36_admin/features/admin/presentation/routings/admin_router_config.dart';
import 'package:t36_admin/features/admin/presentation/routings/admin_routes_constants.dart';
import 'package:t36_admin/features/admin/presentation/routings/roles_routes_constants.dart';
import 'package:t36_admin/features/admin/presentation/routings/user_routes_constants.dart';
import 'package:t36_admin/features/auth/presentation/providers/auth_state_providers.dart';

import '../../features/admin/presentation/routings/organizations_routes_constants.dart';
import '../../features/auth/presentation/routing/auth_router_config.dart';
import '../../features/auth/presentation/routing/auth_routes_constants.dart';
import '../permissions.dart';
import '../providers/session_manager_provider.dart';

part 'router_config.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final routePermissions = {
    OrganizationsRoutes.organizationsPath: Permissions.organizationsRead,
    UsersRoutes.usersPath: Permissions.usersRead,
    RolesRoutes.rolesPath: Permissions.rolesRead,
  };

  final authState = ref.watch(authStateChangesProvider);
  final userPermissions = ref.watch(currentUserPermissionsProvider);

  return GoRouter(
    initialLocation: AuthRoutes.authWrapperPath,
    routes: [...getAuthRoutes(), ...getAdminRoutes()],
    redirect: (BuildContext context, GoRouterState state) {
      final loggingIn = state.matchedLocation == AuthRoutes.authWrapperPath;
      final isLoggedIn = authState.value != null;

      if (!isLoggedIn && !loggingIn) {
        return AuthRoutes.authWrapperPath;
      }

      // ИЗМЕНЕНИЕ ЗДЕСЬ
      if (isLoggedIn && loggingIn) {
        // Явное перенаправление на главный экран администратора
        return AdminRoutes.adminPath;
      }

      final requestedPath = state.matchedLocation;

      String? requiredPermission;
      for (final route in routePermissions.keys) {
        if (requestedPath.startsWith(route)) {
          requiredPermission = routePermissions[route];
          break;
        }
      }

      if (requiredPermission != null &&
          !userPermissions.contains(requiredPermission)) {
        // Если нет прав, перенаправляем на главный экран админа, где он увидит доступные ему разделы
        return AdminRoutes.adminPath;
      }

      return null;
    },
  );
}
