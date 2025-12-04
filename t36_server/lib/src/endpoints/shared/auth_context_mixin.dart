// manifest: startProject
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

import '../../generated/protocol.dart';

mixin AuthContextMixin on Endpoint {
  Future<({int userId, UuidValue customerId})> getAuthenticatedUserContext(
    Session session,
  ) async {
    final authInfo = await session.authenticated;
    final userId = authInfo?.userId;

    if (userId == null) {
      throw Exception('Пользователь не авторизован.');
    }

    final customerUser = await CustomerUser.db.findFirstRow(
      session,
      where: (cu) => cu.userId.equals(userId),
    );

    // Теперь это настоящая ошибка, а не повод для заглушки
    if (customerUser == null) {
      throw Exception('Пользователь $userId не привязан ни к одному клиенту (customer).');
    }

    return (
      userId: userId,
      customerId: customerUser.customerId,
    );
  }
}