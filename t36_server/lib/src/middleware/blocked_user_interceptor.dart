// manifest: startProject
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

/// Базовый класс для эндпоинтов с проверкой блокировки пользователя.
/// Все эндпоинты, требующие аутентификации, должны наследоваться от этого класса.
abstract class BlockedUserProtectedEndpoint extends Endpoint {
  
  /// Проверяет, не заблокирован ли аутентифицированный пользователь.
  /// Должен вызываться в начале каждого метода эндпоинта.
  Future<void> checkUserNotBlocked(Session session) async {
    final authInfo = await session.authenticated;
    
    if (authInfo == null) {
      // Пользователь не аутентифицирован - это нормально для некоторых эндпоинтов
      return;
    }

    try {
      // Получаем информацию о пользователе
      final userInfo = await auth.UserInfo.db.findById(session, authInfo.userId);
      
      if (userInfo == null) {
        session.log(
          'Пользователь с ID ${authInfo.userId} не найден в базе данных',
          level: LogLevel.warning,
        );
        throw Exception('Пользователь не найден');
      }

      // Проверяем, заблокирован ли пользователь
      if (userInfo.blocked) {
        session.log(
          'Заблокированный пользователь ${userInfo.userName} (ID: ${userInfo.id}) пытается получить доступ',
          level: LogLevel.warning,
        );
        
        // Завершаем сессию используя правильный метод
        await auth.UserAuthentication.signOutUser(session);
        
        throw Exception('Ваш аккаунт заблокирован. Обратитесь к администратору.');
      }
    } catch (e) {
      session.log(
        'Ошибка при проверке статуса блокировки пользователя: $e',
        level: LogLevel.error,
      );
      rethrow;
    }
  }
}

/// Миксин для добавления проверки блокировки в существующие эндпоинты
mixin BlockedUserCheckMixin on Endpoint {
  
  /// Проверяет, не заблокирован ли аутентифицированный пользователь.
  Future<void> checkUserNotBlocked(Session session) async {
    final authInfo = await session.authenticated;
    
    if (authInfo == null) {
      return;
    }

    try {
      final userInfo = await auth.UserInfo.db.findById(session, authInfo.userId);
      
      if (userInfo == null) {
        session.log(
          'Пользователь с ID ${authInfo.userId} не найден в базе данных',
          level: LogLevel.warning,
        );
        throw Exception('Пользователь не найден');
      }

      if (userInfo.blocked) {
        session.log(
          'Заблокированный пользователь ${userInfo.userName} (ID: ${userInfo.id}) пытается получить доступ',
          level: LogLevel.warning,
        );
        
        // Завершаем сессию используя правильный метод
        await auth.UserAuthentication.signOutUser(session);
        
        throw Exception('Ваш аккаунт заблокирован. Обратитесь к администратору.');
      }
    } catch (e) {
      session.log(
        'Ошибка при проверке статуса блокировки пользователя: $e',
        level: LogLevel.error,
      );
      rethrow;
    }
  }
}