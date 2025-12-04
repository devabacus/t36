// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_registry.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Провайдер для единственного экземпляра реестра на все приложение.

@ProviderFor(syncRegistry)
const syncRegistryProvider = SyncRegistryProvider._();

/// Провайдер для единственного экземпляра реестра на все приложение.

final class SyncRegistryProvider
    extends $FunctionalProvider<SyncRegistry, SyncRegistry, SyncRegistry>
    with $Provider<SyncRegistry> {
  /// Провайдер для единственного экземпляра реестра на все приложение.
  const SyncRegistryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncRegistryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncRegistryHash();

  @$internal
  @override
  $ProviderElement<SyncRegistry> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SyncRegistry create(Ref ref) {
    return syncRegistry(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncRegistry value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncRegistry>(value),
    );
  }
}

String _$syncRegistryHash() => r'b3b2114250703aebd7a6e0d48202021cee662ced';
