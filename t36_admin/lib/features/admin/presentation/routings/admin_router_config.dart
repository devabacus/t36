// manifest: startProject

import 'package:go_router/go_router.dart';
import '../pages/admin_page.dart';
import 'admin_routes_constants.dart';
import 'organizations_router_config.dart';
import 'roles_router_config.dart';
import 'user_router_config.dart';

List<RouteBase> getAdminRoutes() {
  return [
    GoRoute(
      name: AdminRoutes.admin,
      path: AdminRoutes.adminPath,
      builder: (context, state) => const AdminPage(),
    ),
    ...getUsersRoutes(),
    ...getRolesRoutes(),
    ...getOrganizationsRoutes(),
  ];
}
