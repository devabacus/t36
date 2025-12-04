// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_dependencies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Провайдер-"заглушка". Он должен быть переопределен (overridden)
/// в ProviderScope основного приложения для внедрения реальных зависимостей.

@ProviderFor(configurationDependencies)
const configurationDependenciesProvider = ConfigurationDependenciesProvider._();

/// Провайдер-"заглушка". Он должен быть переопределен (overridden)
/// в ProviderScope основного приложения для внедрения реальных зависимостей.

final class ConfigurationDependenciesProvider
    extends
        $FunctionalProvider<
          IConfigurationDependencies,
          IConfigurationDependencies,
          IConfigurationDependencies
        >
    with $Provider<IConfigurationDependencies> {
  /// Провайдер-"заглушка". Он должен быть переопределен (overridden)
  /// в ProviderScope основного приложения для внедрения реальных зависимостей.
  const ConfigurationDependenciesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configurationDependenciesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configurationDependenciesHash();

  @$internal
  @override
  $ProviderElement<IConfigurationDependencies> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IConfigurationDependencies create(Ref ref) {
    return configurationDependencies(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IConfigurationDependencies value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IConfigurationDependencies>(value),
    );
  }
}

String _$configurationDependenciesHash() =>
    r'5f3ffc9d58ebda70be46a8f1dfa1e94c593f5dca';
