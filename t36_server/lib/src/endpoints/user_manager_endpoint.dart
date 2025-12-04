// manifest: startProject
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import '../generated/protocol.dart';
import 'shared/auth_context_mixin.dart';

typedef AuthenticatedUserContext = ({int userId, UuidValue customerId});

class UserManagementEndpoint extends Endpoint with AuthContextMixin {

  Future<UserSessionData?> getMyUserContext(Session session) async {
    final authInfo = await session.authenticated;
    final userId = authInfo?.userId;

    if (userId == null) {
      return null;
    }

    try {
      // Получаем информацию о пользователе для проверки блокировки
      final userInfo = await UserInfo.db.findById(session, userId);
      if (userInfo == null) {
        session.log('UserInfo не найден для userId: $userId', level: LogLevel.error);
        return null;
      }

      // Проверяем, заблокирован ли пользователь
      if (userInfo.blocked) {
        session.log(
          'Заблокированный пользователь ${userInfo.userName} пытается получить контекст',
          level: LogLevel.warning,
        );
        
        // Завершаем сессию используя правильный метод
        await UserAuthentication.signOutUser(session);
        throw Exception('Ваш аккаунт заблокирован. Обратитесь к администратору.');
      }

      // Получаем контекст. Если пользователь не привязан, здесь будет выброшено исключение
      final authContext = await getAuthenticatedUserContext(session);

      final customerUser = await CustomerUser.db.findFirstRow(
        session,
        where: (cu) => cu.userId.equals(authContext.userId) & cu.customerId.equals(authContext.customerId),
      );

      if (customerUser == null) {
        throw Exception('Не удалось найти CustomerUser даже после получения контекста.');
      }

      final permissions = await RolePermission.db.find(
        session,
        where: (rp) => rp.roleId.equals(customerUser.roleId),
      );

      final permissionKeys = <String>{};
      if (permissions.isNotEmpty) {
        final permissionIds = permissions.map((p) => p.permissionId).toSet();
        final permissionRecords = await Permission.db.find(
          session,
          where: (p) => p.id.inSet(permissionIds),
        );
        permissionKeys.addAll(permissionRecords.map((p) => p.key));
      }

      return UserSessionData(
        userId: userId,
        customerId: customerUser.customerId,
        roleId: customerUser.roleId,
        activePermissions: permissionKeys.toList(),
      );

    } catch (e, stackTrace) {
      session.log(
        'Ошибка получения контекста для userId: $userId',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      // Возвращаем null, чтобы клиент мог обработать ошибку
      return null;
    }
  }
}