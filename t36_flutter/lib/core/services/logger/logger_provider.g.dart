// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logger_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Провайдер для экземпляра Talker.
/// Он нужен, чтобы TalkerScreen мог получить к нему доступ.

@ProviderFor(talker)
const talkerProvider = TalkerProvider._();

/// Провайдер для экземпляра Talker.
/// Он нужен, чтобы TalkerScreen мог получить к нему доступ.

final class TalkerProvider extends $FunctionalProvider<Talker, Talker, Talker>
    with $Provider<Talker> {
  /// Провайдер для экземпляра Talker.
  /// Он нужен, чтобы TalkerScreen мог получить к нему доступ.
  const TalkerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'talkerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$talkerHash();

  @$internal
  @override
  $ProviderElement<Talker> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Talker create(Ref ref) {
    return talker(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Talker value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Talker>(value),
    );
  }
}

String _$talkerHash() => r'103c40bb8a36d60f9188f50a717a1c729572df18';

/// Провайдер для нашего абстрактного сервиса логирования.

@ProviderFor(loggerService)
const loggerServiceProvider = LoggerServiceProvider._();

/// Провайдер для нашего абстрактного сервиса логирования.

final class LoggerServiceProvider
    extends $FunctionalProvider<LoggerService, LoggerService, LoggerService>
    with $Provider<LoggerService> {
  /// Провайдер для нашего абстрактного сервиса логирования.
  const LoggerServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loggerServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loggerServiceHash();

  @$internal
  @override
  $ProviderElement<LoggerService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoggerService create(Ref ref) {
    return loggerService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoggerService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoggerService>(value),
    );
  }
}

String _$loggerServiceHash() => r'32fcccf62fe3776b7ca58cd3de23960ad95e929a';
