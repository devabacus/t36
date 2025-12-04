// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_metadata_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(syncMetadataDao)
const syncMetadataDaoProvider = SyncMetadataDaoProvider._();

final class SyncMetadataDaoProvider
    extends
        $FunctionalProvider<SyncMetadataDao, SyncMetadataDao, SyncMetadataDao>
    with $Provider<SyncMetadataDao> {
  const SyncMetadataDaoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncMetadataDaoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncMetadataDaoHash();

  @$internal
  @override
  $ProviderElement<SyncMetadataDao> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SyncMetadataDao create(Ref ref) {
    return syncMetadataDao(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncMetadataDao value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncMetadataDao>(value),
    );
  }
}

String _$syncMetadataDaoHash() => r'4875e7284109092e2c7f00057f7329e847c5dce2';

@ProviderFor(syncMetadataLocalDataSource)
const syncMetadataLocalDataSourceProvider =
    SyncMetadataLocalDataSourceProvider._();

final class SyncMetadataLocalDataSourceProvider
    extends
        $FunctionalProvider<
          ISyncMetadataLocalDataSource,
          ISyncMetadataLocalDataSource,
          ISyncMetadataLocalDataSource
        >
    with $Provider<ISyncMetadataLocalDataSource> {
  const SyncMetadataLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncMetadataLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncMetadataLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<ISyncMetadataLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ISyncMetadataLocalDataSource create(Ref ref) {
    return syncMetadataLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ISyncMetadataLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ISyncMetadataLocalDataSource>(value),
    );
  }
}

String _$syncMetadataLocalDataSourceHash() =>
    r'8fe23dd3a0392e40a49b10c234daf3add7018260';
