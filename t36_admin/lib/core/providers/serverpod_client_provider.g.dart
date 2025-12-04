// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serverpod_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(serverpodConfig)
const serverpodConfigProvider = ServerpodConfigProvider._();

final class ServerpodConfigProvider
    extends
        $FunctionalProvider<ServerpodConfig, ServerpodConfig, ServerpodConfig>
    with $Provider<ServerpodConfig> {
  const ServerpodConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverpodConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverpodConfigHash();

  @$internal
  @override
  $ProviderElement<ServerpodConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ServerpodConfig create(Ref ref) {
    return serverpodConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ServerpodConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ServerpodConfig>(value),
    );
  }
}

String _$serverpodConfigHash() => r'580969447b1b4cb014b8c45c4478996b167171fc';

@ProviderFor(serverpodClient)
const serverpodClientProvider = ServerpodClientProvider._();

final class ServerpodClientProvider
    extends $FunctionalProvider<Client, Client, Client>
    with $Provider<Client> {
  const ServerpodClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverpodClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverpodClientHash();

  @$internal
  @override
  $ProviderElement<Client> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Client create(Ref ref) {
    return serverpodClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Client value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Client>(value),
    );
  }
}

String _$serverpodClientHash() => r'381a89e2cc01b29de8fc77555f84c3d2d2d600d3';

@ProviderFor(serverpodConnectionCheck)
const serverpodConnectionCheckProvider = ServerpodConnectionCheckProvider._();

final class ServerpodConnectionCheckProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const ServerpodConnectionCheckProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'serverpodConnectionCheckProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$serverpodConnectionCheckHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return serverpodConnectionCheck(ref);
  }
}

String _$serverpodConnectionCheckHash() =>
    r'fbe5f5c7cc984b06f1225f367abf108b3dffea29';
