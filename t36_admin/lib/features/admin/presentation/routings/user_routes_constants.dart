// manifest: startProject

class UsersRoutes {
  // Названия роутов
  static const String users = 'users';
  static const String createUser = 'create-user';
  static const String editUser = 'edit-user';
  
  // Пути роутов
  static const String usersPath = '/admin/users';
  static const String createUserPath = '/admin/users/create';
  static const String editUserPath = '/admin/users/edit';
  
  // Полный путь для редактирования с параметром
  static String editUserPathWithId(String userId) => '$editUserPath/$userId';
}