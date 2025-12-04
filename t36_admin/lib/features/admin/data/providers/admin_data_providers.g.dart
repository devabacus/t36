// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Провайдер-переключатель.
/// В зависимости от ID пользователя, предоставляет либо [SuperAdminRepository],
/// либо [AdminRepository].

@ProviderFor(adminRepository)
const adminRepositoryProvider = AdminRepositoryProvider._();

/// Провайдер-переключатель.
/// В зависимости от ID пользователя, предоставляет либо [SuperAdminRepository],
/// либо [AdminRepository].

final class AdminRepositoryProvider
    extends
        $FunctionalProvider<
          IAdminRepository,
          IAdminRepository,
          IAdminRepository
        >
    with $Provider<IAdminRepository> {
  /// Провайдер-переключатель.
  /// В зависимости от ID пользователя, предоставляет либо [SuperAdminRepository],
  /// либо [AdminRepository].
  const AdminRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'adminRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$adminRepositoryHash();

  @$internal
  @override
  $ProviderElement<IAdminRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IAdminRepository create(Ref ref) {
    return adminRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IAdminRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IAdminRepository>(value),
    );
  }
}

String _$adminRepositoryHash() => r'e76b1ace4bcf1340e075211d8f0db506cee8aed7';
