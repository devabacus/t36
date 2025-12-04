// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizations_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(organizationsList)
const organizationsListProvider = OrganizationsListProvider._();

final class OrganizationsListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Customer>>,
          List<Customer>,
          FutureOr<List<Customer>>
        >
    with $FutureModifier<List<Customer>>, $FutureProvider<List<Customer>> {
  const OrganizationsListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'organizationsListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$organizationsListHash();

  @$internal
  @override
  $FutureProviderElement<List<Customer>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Customer>> create(Ref ref) {
    return organizationsList(ref);
  }
}

String _$organizationsListHash() => r'c7d927f0915af2bb7c984f32b7791dcf3f6c23c6';

@ProviderFor(createOrganization)
const createOrganizationProvider = CreateOrganizationFamily._();

final class CreateOrganizationProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const CreateOrganizationProvider._({
    required CreateOrganizationFamily super.from,
    required ({
      String organizationName,
      String? organizationEmail,
      String? organizationInfo,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'createOrganizationProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$createOrganizationHash();

  @override
  String toString() {
    return r'createOrganizationProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument =
        this.argument
            as ({
              String organizationName,
              String? organizationEmail,
              String? organizationInfo,
            });
    return createOrganization(
      ref,
      organizationName: argument.organizationName,
      organizationEmail: argument.organizationEmail,
      organizationInfo: argument.organizationInfo,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CreateOrganizationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createOrganizationHash() =>
    r'8d87b38531d93d7a3a3c790dbe8ae6550e00d769';

final class CreateOrganizationFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({
            String organizationName,
            String? organizationEmail,
            String? organizationInfo,
          })
        > {
  const CreateOrganizationFamily._()
    : super(
        retry: null,
        name: r'createOrganizationProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CreateOrganizationProvider call({
    required String organizationName,
    required String? organizationEmail,
    required String? organizationInfo,
  }) => CreateOrganizationProvider._(
    argument: (
      organizationName: organizationName,
      organizationEmail: organizationEmail,
      organizationInfo: organizationInfo,
    ),
    from: this,
  );

  @override
  String toString() => r'createOrganizationProvider';
}

@ProviderFor(deleteOrganization)
const deleteOrganizationProvider = DeleteOrganizationFamily._();

final class DeleteOrganizationProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const DeleteOrganizationProvider._({
    required DeleteOrganizationFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'deleteOrganizationProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteOrganizationHash();

  @override
  String toString() {
    return r'deleteOrganizationProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as String;
    return deleteOrganization(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteOrganizationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteOrganizationHash() =>
    r'd00974c0a7f830fed2f0d6f36b1fa5670ff78ece';

final class DeleteOrganizationFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, String> {
  const DeleteOrganizationFamily._()
    : super(
        retry: null,
        name: r'deleteOrganizationProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DeleteOrganizationProvider call(String organizationId) =>
      DeleteOrganizationProvider._(argument: organizationId, from: this);

  @override
  String toString() => r'deleteOrganizationProvider';
}

@ProviderFor(organizationDetails)
const organizationDetailsProvider = OrganizationDetailsFamily._();

final class OrganizationDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Customer?>,
          Customer?,
          FutureOr<Customer?>
        >
    with $FutureModifier<Customer?>, $FutureProvider<Customer?> {
  const OrganizationDetailsProvider._({
    required OrganizationDetailsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'organizationDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$organizationDetailsHash();

  @override
  String toString() {
    return r'organizationDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Customer?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Customer?> create(Ref ref) {
    final argument = this.argument as String;
    return organizationDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is OrganizationDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$organizationDetailsHash() =>
    r'2b8329c6c4805864d06cbaebf3776dfd36eb9704';

final class OrganizationDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Customer?>, String> {
  const OrganizationDetailsFamily._()
    : super(
        retry: null,
        name: r'organizationDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OrganizationDetailsProvider call(String organizationId) =>
      OrganizationDetailsProvider._(argument: organizationId, from: this);

  @override
  String toString() => r'organizationDetailsProvider';
}

@ProviderFor(updateOrganization)
const updateOrganizationProvider = UpdateOrganizationFamily._();

final class UpdateOrganizationProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const UpdateOrganizationProvider._({
    required UpdateOrganizationFamily super.from,
    required Customer super.argument,
  }) : super(
         retry: null,
         name: r'updateOrganizationProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateOrganizationHash();

  @override
  String toString() {
    return r'updateOrganizationProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as Customer;
    return updateOrganization(ref, customer: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateOrganizationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateOrganizationHash() =>
    r'2be8d964cbde0c1857fe366b0782b69f59fd7320';

final class UpdateOrganizationFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, Customer> {
  const UpdateOrganizationFamily._()
    : super(
        retry: null,
        name: r'updateOrganizationProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UpdateOrganizationProvider call({required Customer customer}) =>
      UpdateOrganizationProvider._(argument: customer, from: this);

  @override
  String toString() => r'updateOrganizationProvider';
}
