// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(rolesList)
const rolesListProvider = RolesListProvider._();

final class RolesListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Role>>,
          List<Role>,
          FutureOr<List<Role>>
        >
    with $FutureModifier<List<Role>>, $FutureProvider<List<Role>> {
  const RolesListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rolesListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rolesListHash();

  @$internal
  @override
  $FutureProviderElement<List<Role>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Role>> create(Ref ref) {
    return rolesList(ref);
  }
}

String _$rolesListHash() => r'9c16389f143f1c09e438937cd1c1b48db92c5370';

@ProviderFor(permissionsList)
const permissionsListProvider = PermissionsListProvider._();

final class PermissionsListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Permission>>,
          List<Permission>,
          FutureOr<List<Permission>>
        >
    with $FutureModifier<List<Permission>>, $FutureProvider<List<Permission>> {
  const PermissionsListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'permissionsListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$permissionsListHash();

  @$internal
  @override
  $FutureProviderElement<List<Permission>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Permission>> create(Ref ref) {
    return permissionsList(ref);
  }
}

String _$permissionsListHash() => r'9af39233d26fbc88599effcd63a896da3ba48836';

@ProviderFor(createRole)
const createRoleProvider = CreateRoleFamily._();

final class CreateRoleProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const CreateRoleProvider._({
    required CreateRoleFamily super.from,
    required ({
      String roleName,
      String? roleDescription,
      List<String> permissionIds,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'createRoleProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$createRoleHash();

  @override
  String toString() {
    return r'createRoleProvider'
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
              String roleName,
              String? roleDescription,
              List<String> permissionIds,
            });
    return createRole(
      ref,
      roleName: argument.roleName,
      roleDescription: argument.roleDescription,
      permissionIds: argument.permissionIds,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CreateRoleProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createRoleHash() => r'f37460f952cb0db61261fecae8ae8cb1bd39b194';

final class CreateRoleFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({
            String roleName,
            String? roleDescription,
            List<String> permissionIds,
          })
        > {
  const CreateRoleFamily._()
    : super(
        retry: null,
        name: r'createRoleProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CreateRoleProvider call({
    required String roleName,
    required String? roleDescription,
    required List<String> permissionIds,
  }) => CreateRoleProvider._(
    argument: (
      roleName: roleName,
      roleDescription: roleDescription,
      permissionIds: permissionIds,
    ),
    from: this,
  );

  @override
  String toString() => r'createRoleProvider';
}

@ProviderFor(deleteRole)
const deleteRoleProvider = DeleteRoleFamily._();

final class DeleteRoleProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const DeleteRoleProvider._({
    required DeleteRoleFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'deleteRoleProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteRoleHash();

  @override
  String toString() {
    return r'deleteRoleProvider'
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
    return deleteRole(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteRoleProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteRoleHash() => r'3f542972fef940b2189a7d58f42f2e31437b1af5';

final class DeleteRoleFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, String> {
  const DeleteRoleFamily._()
    : super(
        retry: null,
        name: r'deleteRoleProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DeleteRoleProvider call(String roleId) =>
      DeleteRoleProvider._(argument: roleId, from: this);

  @override
  String toString() => r'deleteRoleProvider';
}

@ProviderFor(roleDetails)
const roleDetailsProvider = RoleDetailsFamily._();

final class RoleDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<RoleDetails?>,
          RoleDetails?,
          FutureOr<RoleDetails?>
        >
    with $FutureModifier<RoleDetails?>, $FutureProvider<RoleDetails?> {
  const RoleDetailsProvider._({
    required RoleDetailsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'roleDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$roleDetailsHash();

  @override
  String toString() {
    return r'roleDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<RoleDetails?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RoleDetails?> create(Ref ref) {
    final argument = this.argument as String;
    return roleDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RoleDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$roleDetailsHash() => r'95eb0fb67ad746dd968375b500f1244bc0d1ca2e';

final class RoleDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<RoleDetails?>, String> {
  const RoleDetailsFamily._()
    : super(
        retry: null,
        name: r'roleDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RoleDetailsProvider call(String roleId) =>
      RoleDetailsProvider._(argument: roleId, from: this);

  @override
  String toString() => r'roleDetailsProvider';
}

@ProviderFor(updateRole)
const updateRoleProvider = UpdateRoleFamily._();

final class UpdateRoleProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const UpdateRoleProvider._({
    required UpdateRoleFamily super.from,
    required ({Role role, List<String> permissionIds}) super.argument,
  }) : super(
         retry: null,
         name: r'updateRoleProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateRoleHash();

  @override
  String toString() {
    return r'updateRoleProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as ({Role role, List<String> permissionIds});
    return updateRole(
      ref,
      role: argument.role,
      permissionIds: argument.permissionIds,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateRoleProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateRoleHash() => r'8afa94017e9daeed62338718f18286809e9be8a0';

final class UpdateRoleFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({Role role, List<String> permissionIds})
        > {
  const UpdateRoleFamily._()
    : super(
        retry: null,
        name: r'updateRoleProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UpdateRoleProvider call({
    required Role role,
    required List<String> permissionIds,
  }) => UpdateRoleProvider._(
    argument: (role: role, permissionIds: permissionIds),
    from: this,
  );

  @override
  String toString() => r'updateRoleProvider';
}
