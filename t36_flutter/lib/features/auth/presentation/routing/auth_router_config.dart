// manifest: startProject
import 'package:go_router/go_router.dart';
import '../pages/auth_wrapper_page.dart';
import 'auth_routes_constants.dart';

List<RouteBase> getAuthRoutes() {
  return [
    GoRoute(
      name: AuthRoutes.authWrapper,
      path: AuthRoutes.authWrapperPath,
      builder: (context, state) => const AuthWrapperPage(),
    ),
  ];
}