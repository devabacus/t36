// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appDatabase)
const appDatabaseProvider = AppDatabaseProvider._();

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  const AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'00556e4826e3fdee0225f7b37f40a8f07003d467';

@ProviderFor(databaseService)
const databaseServiceProvider = DatabaseServiceProvider._();

final class DatabaseServiceProvider
    extends
        $FunctionalProvider<
          IDatabaseService,
          IDatabaseService,
          IDatabaseService
        >
    with $Provider<IDatabaseService> {
  const DatabaseServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'databaseServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$databaseServiceHash();

  @$internal
  @override
  $ProviderElement<IDatabaseService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IDatabaseService create(Ref ref) {
    return databaseService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IDatabaseService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IDatabaseService>(value),
    );
  }
}

String _$databaseServiceHash() => r'48ef219a2ccf0a44bfbec55b02c2f1f3749db646';
