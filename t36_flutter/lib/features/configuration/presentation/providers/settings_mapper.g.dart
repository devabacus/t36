// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_mapper.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Провайдер Riverpod для доступа к экземпляру SettingsMapper.
/// Он автоматически получает зависимости (реестр настроек и список групп)
/// от других провайдеров.

@ProviderFor(settingsMapper)
const settingsMapperProvider = SettingsMapperProvider._();

/// Провайдер Riverpod для доступа к экземпляру SettingsMapper.
/// Он автоматически получает зависимости (реестр настроек и список групп)
/// от других провайдеров.

final class SettingsMapperProvider
    extends $FunctionalProvider<SettingsMapper, SettingsMapper, SettingsMapper>
    with $Provider<SettingsMapper> {
  /// Провайдер Riverpod для доступа к экземпляру SettingsMapper.
  /// Он автоматически получает зависимости (реестр настроек и список групп)
  /// от других провайдеров.
  const SettingsMapperProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsMapperProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsMapperHash();

  @$internal
  @override
  $ProviderElement<SettingsMapper> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsMapper create(Ref ref) {
    return settingsMapper(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsMapper value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsMapper>(value),
    );
  }
}

String _$settingsMapperHash() => r'1f0dc0c2408af767fd9ecb423fc4204531d754f9';
