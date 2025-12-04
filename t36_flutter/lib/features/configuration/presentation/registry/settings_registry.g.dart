// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_registry.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingsRegistry)
const settingsRegistryProvider = SettingsRegistryProvider._();

final class SettingsRegistryProvider
    extends
        $FunctionalProvider<
          SettingsRegistry,
          SettingsRegistry,
          SettingsRegistry
        >
    with $Provider<SettingsRegistry> {
  const SettingsRegistryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRegistryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRegistryHash();

  @$internal
  @override
  $ProviderElement<SettingsRegistry> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsRegistry create(Ref ref) {
    return settingsRegistry(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRegistry value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsRegistry>(value),
    );
  }
}

String _$settingsRegistryHash() => r'880934c2bd5ed537562506820bb68a703fc4b588';
