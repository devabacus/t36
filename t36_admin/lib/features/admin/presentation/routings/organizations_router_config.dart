// manifest: startProject

import 'package:go_router/go_router.dart';
import '../pages/edit_organization_page.dart';
import '../pages/organizations_page.dart';
import '../pages/create_organization_page.dart';
import 'organizations_routes_constants.dart';

List<RouteBase> getOrganizationsRoutes() {
  return [
    GoRoute(
      name: OrganizationsRoutes.organizations,
      path: OrganizationsRoutes.organizationsPath,
      builder: (context, state) => const OrganizationsPage(),
    ),
    GoRoute(
      name: OrganizationsRoutes.createOrganization,
      path: OrganizationsRoutes.createOrganizationPath,
      builder: (context, state) => const CreateOrganizationPage(),
    ),

    GoRoute(
      name: OrganizationsRoutes.editOrganization,
      path: '${OrganizationsRoutes.editOrganizationPath}/:organizationId',
      builder: (context, state) {
        final organizationId = state.pathParameters['organizationId']!;
        return EditOrganizationPage(itemId: organizationId);
      },
    ),
  ];
}
