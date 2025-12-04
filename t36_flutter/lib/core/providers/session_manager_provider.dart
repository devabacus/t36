// manifest: startProject

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:t36_client/t36_client.dart';

import '../../features/auth/presentation/providers/auth_state_providers.dart'; // <-- Важный импорт
import 'serverpod_client_provider.dart';

part 'session_manager_provider.g.dart';

@riverpod
SessionManager sessionManager(Ref ref) {
  ref.keepAlive();
  final client = ref.watch(serverpodClientProvider);
  final sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  sessionManager.initialize();
  return sessionManager;
}

// ПРОВАЙДЕРЫ userInfoStream, currentUser и isAuthenticated УДАЛЕНЫ

@riverpod
class UserSessionDataNotifier extends _$UserSessionDataNotifier {
  @override
  UserSessionData? build() {
    // Слушаем изменения статуса аутентификации из новой фичи auth
    ref.listen(authStateChangesProvider, (previous, next) async {
      final newUserId = next.value?.id;
      final oldUserId = previous?.value?.id;

      if (newUserId != null && newUserId != oldUserId) {
        await _fetchUserContext();
      } else if (newUserId == null && oldUserId != null) {
        state = null;
      }
    });

    // Немедленно проверяем, есть ли уже пользователь
    final initialUser = ref.read(authStateChangesProvider).value;
    if (initialUser != null) {
      _fetchUserContext();
    }

    return null; // Изначальное состояние
  }

  Future<void> _fetchUserContext() async {
    final client = ref.read(serverpodClientProvider);
    try {
      final userContext = await client.userManagement.getMyUserContext();
      state = userContext;
      print('✅ Получен User Context: $userContext');
    } catch (e, st) {
      print('❌ Ошибка получения User Context: $e\n$st');
      state = null;
    }
  }
}

@riverpod
UserSessionData? currentUserSessionData(Ref ref) {
  return ref.watch(userSessionDataProvider);
}

@riverpod
String? currentCustomerId(Ref ref) {
  return ref.watch(currentUserSessionDataProvider)?.customerId.toString();
}

@riverpod
UuidValue? currentRoleId(Ref ref) {
  return ref.watch(currentUserSessionDataProvider)?.roleId;
}

@riverpod
List<String> currentUserPermissions(Ref ref) {
  return ref.watch(currentUserSessionDataProvider)?.activePermissions ?? [];
}
