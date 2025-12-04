// manifest: startProject
import 'dart:async';

import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

import 'i_auth_remote_data_source.dart';

/// Реализация удаленного источника данных аутентификации.
///
/// Использует [SessionManager] из `serverpod_auth_shared_flutter` для управления
/// сессией пользователя и предоставляет реактивный доступ к состоянию аутентификации.
class AuthRemoteDataSource implements IAuthRemoteDataSource {
  final SessionManager _sessionManager;
  late final StreamController<UserInfo?> _userStreamController;

  /// Создает экземпляр [AuthRemoteDataSource].
  ///
  /// [_sessionManager] - менеджер сессий Serverpod.
  AuthRemoteDataSource(this._sessionManager) {
    // Создаем broadcast stream controller, чтобы можно было иметь несколько слушателей.
    // Подписываемся на изменения SessionManager только когда есть активные слушатели.
    _userStreamController = StreamController<UserInfo?>.broadcast(
      onListen: _onListen,
      onCancel: _onCancel,
    );
  }

  /// Вызывается, когда появляется первый слушатель потока.
  void _onListen() {
    _sessionManager.addListener(_onUserChanged);
    // Отправляем текущее состояние сразу при подписке
    _userStreamController.add(_sessionManager.signedInUser);
  }

  /// Вызывается, когда последний слушатель отписывается.
  void _onCancel() {
    _sessionManager.removeListener(_onUserChanged);
  }

  /// Обработчик изменений в SessionManager.
  void _onUserChanged() {
    _userStreamController.add(_sessionManager.signedInUser);
  }

  /// Поток для отслеживания изменений текущего пользователя.
  ///
  /// Эмитит `UserInfo`, если пользователь вошел, или `null`, если вышел.
  @override
  Stream<UserInfo?> get userStream => _userStreamController.stream;

  /// Возвращает текущего залогиненного пользователя или `null`.
  @override
  UserInfo? get currentUser => _sessionManager.signedInUser;

  /// Проверяет, авторизован ли пользователь в данный момент.
  @override
  bool get isSignedIn => currentUser != null;

  /// Выполняет выход из системы.
  ///
  /// Удаляет сессию на устройстве и уведомляет сервер.
  @override
  Future<void> signOut() {
    return _sessionManager.signOutDevice();
  }

  /// Освобождает ресурсы (закрывает контроллер потока).
  void dispose() {
    _userStreamController.close();
  }
}
