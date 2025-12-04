// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(usersList)
const usersListProvider = UsersListProvider._();

final class UsersListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserDetails>>,
          List<UserDetails>,
          FutureOr<List<UserDetails>>
        >
    with
        $FutureModifier<List<UserDetails>>,
        $FutureProvider<List<UserDetails>> {
  const UsersListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usersListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usersListHash();

  @$internal
  @override
  $FutureProviderElement<List<UserDetails>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserDetails>> create(Ref ref) {
    return usersList(ref);
  }
}

String _$usersListHash() => r'8b4383c8887f421e6ea7e22c498ee7ee34b3e8d3';

@ProviderFor(customersList)
const customersListProvider = CustomersListProvider._();

final class CustomersListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Customer>>,
          List<Customer>,
          FutureOr<List<Customer>>
        >
    with $FutureModifier<List<Customer>>, $FutureProvider<List<Customer>> {
  const CustomersListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customersListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customersListHash();

  @$internal
  @override
  $FutureProviderElement<List<Customer>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Customer>> create(Ref ref) {
    return customersList(ref);
  }
}

String _$customersListHash() => r'1b53ccf37743d35e9bbc18c990872498d812df38';

@ProviderFor(createUser)
const createUserProvider = CreateUserFamily._();

final class CreateUserProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const CreateUserProvider._({
    required CreateUserFamily super.from,
    required ({
      String userName,
      String email,
      String password,
      String customerId,
      String roleId,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'createUserProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$createUserHash();

  @override
  String toString() {
    return r'createUserProvider'
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
              String userName,
              String email,
              String password,
              String customerId,
              String roleId,
            });
    return createUser(
      ref,
      userName: argument.userName,
      email: argument.email,
      password: argument.password,
      customerId: argument.customerId,
      roleId: argument.roleId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CreateUserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createUserHash() => r'3444ceee6ab17afed228e6e3fd82a3348db5ded7';

final class CreateUserFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({
            String userName,
            String email,
            String password,
            String customerId,
            String roleId,
          })
        > {
  const CreateUserFamily._()
    : super(
        retry: null,
        name: r'createUserProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CreateUserProvider call({
    required String userName,
    required String email,
    required String password,
    required String customerId,
    required String roleId,
  }) => CreateUserProvider._(
    argument: (
      userName: userName,
      email: email,
      password: password,
      customerId: customerId,
      roleId: roleId,
    ),
    from: this,
  );

  @override
  String toString() => r'createUserProvider';
}

@ProviderFor(userDetails)
const userDetailsProvider = UserDetailsFamily._();

final class UserDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<SuperUserDetails?>,
          SuperUserDetails?,
          FutureOr<SuperUserDetails?>
        >
    with
        $FutureModifier<SuperUserDetails?>,
        $FutureProvider<SuperUserDetails?> {
  const UserDetailsProvider._({
    required UserDetailsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'userDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userDetailsHash();

  @override
  String toString() {
    return r'userDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SuperUserDetails?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SuperUserDetails?> create(Ref ref) {
    final argument = this.argument as int;
    return userDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userDetailsHash() => r'1a4532260fbf5d8e52d6a5c16602d6cc32961e55';

final class UserDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<SuperUserDetails?>, int> {
  const UserDetailsFamily._()
    : super(
        retry: null,
        name: r'userDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserDetailsProvider call(int userId) =>
      UserDetailsProvider._(argument: userId, from: this);

  @override
  String toString() => r'userDetailsProvider';
}

@ProviderFor(updateUser)
const updateUserProvider = UpdateUserFamily._();

final class UpdateUserProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const UpdateUserProvider._({
    required UpdateUserFamily super.from,
    required ({
      int userId,
      String userName,
      String email,
      String customerId,
      String roleId,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'updateUserProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateUserHash();

  @override
  String toString() {
    return r'updateUserProvider'
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
              int userId,
              String userName,
              String email,
              String customerId,
              String roleId,
            });
    return updateUser(
      ref,
      userId: argument.userId,
      userName: argument.userName,
      email: argument.email,
      customerId: argument.customerId,
      roleId: argument.roleId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateUserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateUserHash() => r'e346232c858b163dbb507f6568a1669a18d67778';

final class UpdateUserFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({
            int userId,
            String userName,
            String email,
            String customerId,
            String roleId,
          })
        > {
  const UpdateUserFamily._()
    : super(
        retry: null,
        name: r'updateUserProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UpdateUserProvider call({
    required int userId,
    required String userName,
    required String email,
    required String customerId,
    required String roleId,
  }) => UpdateUserProvider._(
    argument: (
      userId: userId,
      userName: userName,
      email: email,
      customerId: customerId,
      roleId: roleId,
    ),
    from: this,
  );

  @override
  String toString() => r'updateUserProvider';
}

@ProviderFor(deleteUser)
const deleteUserProvider = DeleteUserFamily._();

final class DeleteUserProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const DeleteUserProvider._({
    required DeleteUserFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'deleteUserProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteUserHash();

  @override
  String toString() {
    return r'deleteUserProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as int;
    return deleteUser(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteUserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteUserHash() => r'2c6e539f0db06ea032067a648e0ba857925d2037';

final class DeleteUserFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, int> {
  const DeleteUserFamily._()
    : super(
        retry: null,
        name: r'deleteUserProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DeleteUserProvider call(int userId) =>
      DeleteUserProvider._(argument: userId, from: this);

  @override
  String toString() => r'deleteUserProvider';
}

@ProviderFor(blockUser)
const blockUserProvider = BlockUserFamily._();

final class BlockUserProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const BlockUserProvider._({
    required BlockUserFamily super.from,
    required (int, bool) super.argument,
  }) : super(
         retry: null,
         name: r'blockUserProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$blockUserHash();

  @override
  String toString() {
    return r'blockUserProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (int, bool);
    return blockUser(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is BlockUserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$blockUserHash() => r'52c84b51f2361ff3c2b8e08ff6c0cc3c4f046c58';

final class BlockUserFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, (int, bool)> {
  const BlockUserFamily._()
    : super(
        retry: null,
        name: r'blockUserProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BlockUserProvider call(int userId, bool blocked) =>
      BlockUserProvider._(argument: (userId, blocked), from: this);

  @override
  String toString() => r'blockUserProvider';
}
