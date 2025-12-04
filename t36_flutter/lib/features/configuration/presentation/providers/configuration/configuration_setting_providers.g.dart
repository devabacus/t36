// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_setting_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(themeModeSetting)
const themeModeSettingProvider = ThemeModeSettingProvider._();

final class ThemeModeSettingProvider
    extends
        $FunctionalProvider<
          AsyncValue<ConfigurationEntity?>,
          ConfigurationEntity?,
          FutureOr<ConfigurationEntity?>
        >
    with
        $FutureModifier<ConfigurationEntity?>,
        $FutureProvider<ConfigurationEntity?> {
  const ThemeModeSettingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModeSettingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModeSettingHash();

  @$internal
  @override
  $FutureProviderElement<ConfigurationEntity?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ConfigurationEntity?> create(Ref ref) {
    return themeModeSetting(ref);
  }
}

String _$themeModeSettingHash() => r'5730d2abb51e2b743851aa34981370f04f67dfbc';
