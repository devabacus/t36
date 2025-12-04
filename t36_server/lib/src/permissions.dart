//  manifest: startProject
/// Централизованный класс для хранения всех ключей разрешений в системе.
/// Использование этого класса вместо "магических строк" обеспечивает
/// типобезопасность, автодополнение в IDE и упрощает рефакторинг.
abstract class Permissions {
  // Организации
  static const String organizationsRead = 'organizations.read';
  static const String organizationsCreate = 'organizations.create';
  static const String organizationsUpdate = 'organizations.update';
  static const String organizationsDelete = 'organizations.delete';

  // Пользователи
  static const String usersRead = 'users.read';
  static const String usersCreate = 'users.create';
  static const String usersUpdate = 'users.update';
  static const String usersDelete = 'users.delete';
  static const String usersBlock = 'users.block';

  // Роли
  static const String rolesRead = 'roles.read';
  static const String rolesCreate = 'roles.create';
  static const String rolesUpdate = 'roles.update';
  static const String rolesDelete = 'roles.delete';
  
  // Дополнительное право, которое может пригодиться
  static const String superAdmin = 'super_admin';
}