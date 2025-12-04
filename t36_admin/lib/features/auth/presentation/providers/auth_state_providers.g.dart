// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authStateChanges)
const authStateChangesProvider = AuthStateChangesProvider._();

final class AuthStateChangesProvider
    extends
        $FunctionalProvider<AsyncValue<UserInfo?>, UserInfo?, Stream<UserInfo?>>
    with $FutureModifier<UserInfo?>, $StreamProvider<UserInfo?> {
  const AuthStateChangesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStateChangesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStateChangesHash();

  @$internal
  @override
  $StreamProviderElement<UserInfo?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<UserInfo?> create(Ref ref) {
    return authStateChanges(ref);
  }
}

String _$authStateChangesHash() => r'0a9e61bfc5d89a013fee47b9e0312d38e551a7d7';
