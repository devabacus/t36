// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Провайдер, предоставляющий экземпляр сервиса конфигурации [IConfigurationService].
///
/// Он следит за текущим пользователем и автоматически предоставляет сервис,
/// настроенный для этого пользователя. Выбрасывает исключение, если
/// пользователь не аутентифицирован, так как работа с настройками без
/// пользователя не имеет смысла.

@ProviderFor(configurationService)
const configurationServiceProvider = ConfigurationServiceProvider._();

/// Провайдер, предоставляющий экземпляр сервиса конфигурации [IConfigurationService].
///
/// Он следит за текущим пользователем и автоматически предоставляет сервис,
/// настроенный для этого пользователя. Выбрасывает исключение, если
/// пользователь не аутентифицирован, так как работа с настройками без
/// пользователя не имеет смысла.

final class ConfigurationServiceProvider
    extends
        $FunctionalProvider<
          IConfigurationService,
          IConfigurationService,
          IConfigurationService
        >
    with $Provider<IConfigurationService> {
  /// Провайдер, предоставляющий экземпляр сервиса конфигурации [IConfigurationService].
  ///
  /// Он следит за текущим пользователем и автоматически предоставляет сервис,
  /// настроенный для этого пользователя. Выбрасывает исключение, если
  /// пользователь не аутентифицирован, так как работа с настройками без
  /// пользователя не имеет смысла.
  const ConfigurationServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configurationServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configurationServiceHash();

  @$internal
  @override
  $ProviderElement<IConfigurationService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IConfigurationService create(Ref ref) {
    return configurationService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IConfigurationService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IConfigurationService>(value),
    );
  }
}

String _$configurationServiceHash() =>
    r'a6e1388414b3323d0a3d4b833db2e0b2bcb98abb';
