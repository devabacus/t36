// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(SyncController)
const syncControllerProvider = SyncControllerProvider._();

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
final class SyncControllerProvider
    extends $NotifierProvider<SyncController, void> {
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
  const SyncControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncControllerHash();

  @$internal
  @override
  SyncController create() => SyncController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$syncControllerHash() => r'a5b3f242cf0cb3a77f2a5fa181352c7d93cb3845';

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

abstract class _$SyncController extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
