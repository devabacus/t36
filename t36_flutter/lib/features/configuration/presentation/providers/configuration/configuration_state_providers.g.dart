// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(configurationsStream)
const configurationsStreamProvider = ConfigurationsStreamProvider._();

final class ConfigurationsStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ConfigurationEntity>>,
          List<ConfigurationEntity>,
          Stream<List<ConfigurationEntity>>
        >
    with
        $FutureModifier<List<ConfigurationEntity>>,
        $StreamProvider<List<ConfigurationEntity>> {
  const ConfigurationsStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configurationsStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configurationsStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<ConfigurationEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ConfigurationEntity>> create(Ref ref) {
    return configurationsStream(ref);
  }
}

String _$configurationsStreamHash() =>
    r'1106e50c573ab9a095b4e8392428e46118f84640';
