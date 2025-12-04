// manifest: startProject

import 'package:go_router/go_router.dart';
import '../pages/create_user_page.dart';
import '../pages/edit_user_page.dart';
import '../pages/user_page.dart';
import 'user_routes_constants.dart';

List<RouteBase> getUsersRoutes() {
  return [
    GoRoute(
      name: UsersRoutes.users,
      path: UsersRoutes.usersPath,
      builder: (context, state) => const UsersPage(),
    ),
    GoRoute(
      name: UsersRoutes.createUser,
      path: UsersRoutes.createUserPath,
      builder: (context, state) => const CreateUserPage(),
    ),
    GoRoute(
      name: UsersRoutes.editUser,
      path: '${UsersRoutes.editUserPath}/:userId',
      builder: (context, state) {
        final userId = state.pathParameters['userId']!;
        return EditUserPage(itemId: userId);
      },
    ),
  ];
}