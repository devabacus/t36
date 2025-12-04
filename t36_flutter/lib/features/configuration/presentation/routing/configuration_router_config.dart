// manifest: startProject
import 'package:go_router/go_router.dart';
import '../pages/configuration_page.dart';
import 'configuration_routes_constants.dart';

List<RouteBase> getConfigurationRoutes() {
  return [
    GoRoute(
      name: ConfigurationRoutes.configuration,
      path: ConfigurationRoutes.configurationPath,
      builder: (context, state) => const ConfigurationPage(),
    ),
  ];
}
