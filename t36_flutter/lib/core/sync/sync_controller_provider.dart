// manifest: startProject
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

import '../../features/auth/presentation/providers/auth_state_providers.dart';
import '../services/logger/ref_logger_extensions.dart';
import 'sync_registry.dart';

part 'sync_controller_provider.g.dart';

/// Контроллер, управляющий процессом автоматической синхронизации данных.
///
/// Этот контроллер централизованно отслеживает ключевые события в приложении:
/// 1. Изменение статуса подключения к сети ([ConnectivityResult]).
/// 2. Вход нового пользователя ([authStateChangesProvider]).
///
/// При наступлении этих событий он инициирует полную синхронизацию данных
/// для всех репозиториев, зарегистрированных в [SyncRegistry].
///
/// Также предоставляет публичный метод [triggerSync] для ручного запуска.
@riverpod
class SyncController extends _$SyncController {
  // Подписка на события изменения статуса сети.
  StreamSubscription? _connectivitySubscription;
  // Подписка на события изменения статуса аутентификации пользователя.
  ProviderSubscription? _authSubscription;

  /// Инициализация контроллера.
  ///
  /// Здесь мы подписываемся на глобальные стримы событий, которые должны
  /// запускать синхронизацию. Все подписки будут автоматически отменены
  /// при уничтожении провайдера благодаря `ref.onDispose`.
  @override
  void build() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      _handleConnectivityChange,
    );

    _listenToAuthChanges();

    // Отменяем подписки при уничтожении контроллера, чтобы избежать утечек памяти.
    ref.onDispose(() {
      _connectivitySubscription?.cancel();
      _authSubscription?.close();
    });
  }

  /// Отслеживает изменения в статусе аутентификации пользователя.
  ///
  /// Если пользователь успешно вошел в систему (переход из состояния "не залогинен"
  /// в "залогинен"), запускается полная синхронизация данных.
  void _listenToAuthChanges() {
    _authSubscription = ref.listen<AsyncValue<UserInfo?>>(
      authStateChangesProvider,
      (previous, next) {
        final wasLoggedIn = previous?.value != null;
        final isLoggedIn = next.value != null;
        // Запускаем синхронизацию только в момент входа пользователя.
        if (!wasLoggedIn && isLoggedIn) {
          ref.logInfo(
            'Обнаружен вход пользователя. Запускаем синхронизацию...',
          );
          _triggerSync();
        }
      },
    );
  }

  /// Обрабатывает события изменения статуса подключения к сети.
  ///
  /// Если устройство снова подключается к сети (становится `online`),
  /// запускается полная синхронизация.
  Future<void> _handleConnectivityChange(
    List<ConnectivityResult> results,
  ) async {
    final isOnline = results.any((result) => result != ConnectivityResult.none);

    if (isOnline) {
      ref.logInfo('Обнаружено подключение к сети. Запускаем синхронизацию...');
      _triggerSync();
    }
  }

  /// Внутренний метод, который выполняет основную логику синхронизации.
  ///
  /// Он получает [SyncRegistry] и вызывает у него метод `syncAll`, который,
  /// в свою очередь, запускает `syncWithServer()` для каждого репозитория.
  Future<void> _triggerSync() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      final registry = ref.read(syncRegistryProvider);
      await registry.syncAll();

      ref.logInfo('Синхронизация всех сущностей завершена');
    } catch (e, stackTrace) {
      ref.logError('Ошибка автоматической синхронизации', e, stackTrace);
    }
  }

  /// Публичный метод для принудительного запуска синхронизации из любой части приложения.
  ///
  /// Может быть полезен для реализации кнопки "Обновить" в UI.
  Future<void> triggerSync() async {
    ref.logInfo('Запуск ручной синхронизации...');
    await _triggerSync();
  }
}
