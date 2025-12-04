// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_manager_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sessionManager)
const sessionManagerProvider = SessionManagerProvider._();

final class SessionManagerProvider
    extends $FunctionalProvider<SessionManager, SessionManager, SessionManager>
    with $Provider<SessionManager> {
  const SessionManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionManagerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionManagerHash();

  @$internal
  @override
  $ProviderElement<SessionManager> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SessionManager create(Ref ref) {
    return sessionManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionManager>(value),
    );
  }
}

String _$sessionManagerHash() => r'b67e31ddb34c8cfdadb020f29be6df47947f230d';

@ProviderFor(UserSessionDataNotifier)
const userSessionDataProvider = UserSessionDataNotifierProvider._();

final class UserSessionDataNotifierProvider
    extends $NotifierProvider<UserSessionDataNotifier, UserSessionData?> {
  const UserSessionDataNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userSessionDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userSessionDataNotifierHash();

  @$internal
  @override
  UserSessionDataNotifier create() => UserSessionDataNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserSessionData? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserSessionData?>(value),
    );
  }
}

String _$userSessionDataNotifierHash() =>
    r'859040a18b9b3f06cc9d955d1ade6989d0f9caf3';

abstract class _$UserSessionDataNotifier extends $Notifier<UserSessionData?> {
  UserSessionData? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserSessionData?, UserSessionData?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserSessionData?, UserSessionData?>,
              UserSessionData?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(currentUserSessionData)
const currentUserSessionDataProvider = CurrentUserSessionDataProvider._();

final class CurrentUserSessionDataProvider
    extends
        $FunctionalProvider<
          UserSessionData?,
          UserSessionData?,
          UserSessionData?
        >
    with $Provider<UserSessionData?> {
  const CurrentUserSessionDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserSessionDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserSessionDataHash();

  @$internal
  @override
  $ProviderElement<UserSessionData?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserSessionData? create(Ref ref) {
    return currentUserSessionData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserSessionData? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserSessionData?>(value),
    );
  }
}

String _$currentUserSessionDataHash() =>
    r'191443fe3ef9622d03564e980716e155cec365da';

@ProviderFor(currentCustomerId)
const currentCustomerIdProvider = CurrentCustomerIdProvider._();

final class CurrentCustomerIdProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  const CurrentCustomerIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentCustomerIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentCustomerIdHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return currentCustomerId(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$currentCustomerIdHash() => r'cf23458d8b99f8801ba6db3d9136c1d4805549a2';

@ProviderFor(currentRoleId)
const currentRoleIdProvider = CurrentRoleIdProvider._();

final class CurrentRoleIdProvider
    extends $FunctionalProvider<UuidValue?, UuidValue?, UuidValue?>
    with $Provider<UuidValue?> {
  const CurrentRoleIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentRoleIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentRoleIdHash();

  @$internal
  @override
  $ProviderElement<UuidValue?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UuidValue? create(Ref ref) {
    return currentRoleId(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UuidValue? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UuidValue?>(value),
    );
  }
}

String _$currentRoleIdHash() => r'be77b5e33fdfd7e2c63b5b59ae6eeb9165cb66cb';

@ProviderFor(currentUserPermissions)
const currentUserPermissionsProvider = CurrentUserPermissionsProvider._();

final class CurrentUserPermissionsProvider
    extends $FunctionalProvider<List<String>, List<String>, List<String>>
    with $Provider<List<String>> {
  const CurrentUserPermissionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserPermissionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserPermissionsHash();

  @$internal
  @override
  $ProviderElement<List<String>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<String> create(Ref ref) {
    return currentUserPermissions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$currentUserPermissionsHash() =>
    r'ac00626e88f02ad962dea23da2254643ee1477e3';
