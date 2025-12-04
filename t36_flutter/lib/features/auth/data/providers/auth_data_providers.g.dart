// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRemoteDataSource)
const authRemoteDataSourceProvider = AuthRemoteDataSourceProvider._();

final class AuthRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          IAuthRemoteDataSource,
          IAuthRemoteDataSource,
          IAuthRemoteDataSource
        >
    with $Provider<IAuthRemoteDataSource> {
  const AuthRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<IAuthRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IAuthRemoteDataSource create(Ref ref) {
    return authRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAuthRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAuthRemoteDataSource>(value),
    );
  }
}

String _$authRemoteDataSourceHash() =>
    r'467c9bb530da832bca991f242fc58ef72da544dd';

@ProviderFor(authRepository)
const authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends
        $FunctionalProvider<IAuthRepository, IAuthRepository, IAuthRepository>
    with $Provider<IAuthRepository> {
  const AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<IAuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IAuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'0d6ac520cd5003989de2ba498e9dd871933aa306';
