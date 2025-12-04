/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:t36_client/src/protocol/user/user_details.dart' as _i3;
import 'package:t36_client/src/protocol/user/role.dart' as _i4;
import 'package:t36_client/src/protocol/user/permission.dart' as _i5;
import 'package:t36_client/src/protocol/user/customer.dart' as _i6;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i7;
import 'package:t36_client/src/protocol/user/role_details.dart' as _i8;
import 'package:t36_client/src/protocol/configuration.dart' as _i9;
import 'package:t36_client/src/protocol/configuration_sync_event.dart' as _i10;
import 'package:t36_client/src/protocol/storage/upload_request.dart' as _i11;
import 'package:t36_client/src/protocol/storage/uploaded_file.dart' as _i12;
import 'package:t36_client/src/protocol/user/super_user_details.dart' as _i13;
import 'package:t36_client/src/protocol/user/super_admin_dashboard.dart'
    as _i14;
import 'package:t36_client/src/protocol/user/user_session_data.dart' as _i15;
import 'package:t36_client/src/protocol/greeting.dart' as _i16;
import 'protocol.dart' as _i17;

/// {@category Endpoint}
class EndpointAdmin extends _i1.EndpointRef {
  EndpointAdmin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'admin';

  _i2.Future<List<_i3.UserDetails>> listUsers() =>
      caller.callServerEndpoint<List<_i3.UserDetails>>(
        'admin',
        'listUsers',
        {},
      );

  _i2.Future<bool> updateUserRole({
    required int userId,
    required _i1.UuidValue roleId,
  }) => caller.callServerEndpoint<bool>(
    'admin',
    'updateUserRole',
    {
      'userId': userId,
      'roleId': roleId,
    },
  );

  _i2.Future<List<_i4.Role>> listRoles() =>
      caller.callServerEndpoint<List<_i4.Role>>(
        'admin',
        'listRoles',
        {},
      );

  _i2.Future<List<_i5.Permission>> listPermissions() =>
      caller.callServerEndpoint<List<_i5.Permission>>(
        'admin',
        'listPermissions',
        {},
      );

  _i2.Future<_i4.Role> createOrUpdateRole(
    _i4.Role role,
    List<_i1.UuidValue> permissionIds,
  ) => caller.callServerEndpoint<_i4.Role>(
    'admin',
    'createOrUpdateRole',
    {
      'role': role,
      'permissionIds': permissionIds,
    },
  );

  _i2.Future<bool> deleteRole(_i1.UuidValue roleId) =>
      caller.callServerEndpoint<bool>(
        'admin',
        'deleteRole',
        {'roleId': roleId},
      );

  _i2.Future<_i6.Customer?> getMyCustomer() =>
      caller.callServerEndpoint<_i6.Customer?>(
        'admin',
        'getMyCustomer',
        {},
      );

  _i2.Future<_i7.UserInfo?> createUser({
    required String userName,
    required String email,
    required String password,
    required _i1.UuidValue roleId,
  }) => caller.callServerEndpoint<_i7.UserInfo?>(
    'admin',
    'createUser',
    {
      'userName': userName,
      'email': email,
      'password': password,
      'roleId': roleId,
    },
  );

  _i2.Future<_i3.UserDetails?> getUserDetails(int userId) =>
      caller.callServerEndpoint<_i3.UserDetails?>(
        'admin',
        'getUserDetails',
        {'userId': userId},
      );

  _i2.Future<bool> blockUser(
    int userId,
    bool blocked,
  ) => caller.callServerEndpoint<bool>(
    'admin',
    'blockUser',
    {
      'userId': userId,
      'blocked': blocked,
    },
  );

  _i2.Future<_i8.RoleDetails?> getRoleDetails(_i1.UuidValue roleId) =>
      caller.callServerEndpoint<_i8.RoleDetails?>(
        'admin',
        'getRoleDetails',
        {'roleId': roleId},
      );

  _i2.Future<bool> updateUser({
    required int userId,
    required String userName,
    required String email,
    required _i1.UuidValue roleId,
  }) => caller.callServerEndpoint<bool>(
    'admin',
    'updateUser',
    {
      'userId': userId,
      'userName': userName,
      'email': email,
      'roleId': roleId,
    },
  );
}

/// {@category Endpoint}
class EndpointConfiguration extends _i1.EndpointRef {
  EndpointConfiguration(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'configuration';

  _i2.Future<_i9.Configuration> createConfiguration(
    _i9.Configuration configuration,
  ) => caller.callServerEndpoint<_i9.Configuration>(
    'configuration',
    'createConfiguration',
    {'configuration': configuration},
  );

  _i2.Future<List<_i9.Configuration>> getConfigurations({int? limit}) =>
      caller.callServerEndpoint<List<_i9.Configuration>>(
        'configuration',
        'getConfigurations',
        {'limit': limit},
      );

  _i2.Future<_i9.Configuration?> getConfigurationById(_i1.UuidValue id) =>
      caller.callServerEndpoint<_i9.Configuration?>(
        'configuration',
        'getConfigurationById',
        {'id': id},
      );

  _i2.Future<List<_i9.Configuration>> getConfigurationsSince(DateTime? since) =>
      caller.callServerEndpoint<List<_i9.Configuration>>(
        'configuration',
        'getConfigurationsSince',
        {'since': since},
      );

  _i2.Future<bool> updateConfiguration(_i9.Configuration configuration) =>
      caller.callServerEndpoint<bool>(
        'configuration',
        'updateConfiguration',
        {'configuration': configuration},
      );

  _i2.Stream<_i10.ConfigurationSyncEvent> watchEvents() =>
      caller.callStreamingServerEndpoint<
        _i2.Stream<_i10.ConfigurationSyncEvent>,
        _i10.ConfigurationSyncEvent
      >(
        'configuration',
        'watchEvents',
        {},
        {},
      );
}

/// {@category Endpoint}
class EndpointStorage extends _i1.EndpointRef {
  EndpointStorage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'storage';

  /// Запрос разрешения на загрузку файла
  _i2.Future<_i11.UploadRequest> requestUpload(
    String filename,
    String mimeType,
    int size,
  ) => caller.callServerEndpoint<_i11.UploadRequest>(
    'storage',
    'requestUpload',
    {
      'filename': filename,
      'mimeType': mimeType,
      'size': size,
    },
  );

  /// Подтверждение успешной загрузки
  _i2.Future<bool> confirmUpload(_i1.UuidValue fileId) =>
      caller.callServerEndpoint<bool>(
        'storage',
        'confirmUpload',
        {'fileId': fileId},
      );

  /// Получение списка файлов пользователя
  _i2.Future<List<_i12.UploadedFile>> getUserFiles({
    int? limit,
    int? offset,
  }) => caller.callServerEndpoint<List<_i12.UploadedFile>>(
    'storage',
    'getUserFiles',
    {
      'limit': limit,
      'offset': offset,
    },
  );

  /// Получение URL для скачивания
  _i2.Future<String?> getDownloadUrl(_i1.UuidValue fileId) =>
      caller.callServerEndpoint<String?>(
        'storage',
        'getDownloadUrl',
        {'fileId': fileId},
      );

  /// Удаление файла
  _i2.Future<bool> deleteFile(_i1.UuidValue fileId) =>
      caller.callServerEndpoint<bool>(
        'storage',
        'deleteFile',
        {'fileId': fileId},
      );
}

/// {@category Endpoint}
class EndpointSuperAdmin extends _i1.EndpointRef {
  EndpointSuperAdmin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'superAdmin';

  _i2.Future<List<_i6.Customer>> saListCustomers() =>
      caller.callServerEndpoint<List<_i6.Customer>>(
        'superAdmin',
        'saListCustomers',
        {},
      );

  _i2.Future<_i6.Customer> saSaveCustomer(_i6.Customer customer) =>
      caller.callServerEndpoint<_i6.Customer>(
        'superAdmin',
        'saSaveCustomer',
        {'customer': customer},
      );

  _i2.Future<_i7.UserInfo?> saCreateUser({
    required String userName,
    required String email,
    required String password,
    required _i1.UuidValue customerId,
    required _i1.UuidValue roleId,
  }) => caller.callServerEndpoint<_i7.UserInfo?>(
    'superAdmin',
    'saCreateUser',
    {
      'userName': userName,
      'email': email,
      'password': password,
      'customerId': customerId,
      'roleId': roleId,
    },
  );

  _i2.Future<List<_i13.SuperUserDetails>> saListAllUsers({
    _i1.UuidValue? customerId,
    int? limit,
    int? offset,
  }) => caller.callServerEndpoint<List<_i13.SuperUserDetails>>(
    'superAdmin',
    'saListAllUsers',
    {
      'customerId': customerId,
      'limit': limit,
      'offset': offset,
    },
  );

  _i2.Future<bool> saBlockUser(
    int userId,
    bool blocked,
  ) => caller.callServerEndpoint<bool>(
    'superAdmin',
    'saBlockUser',
    {
      'userId': userId,
      'blocked': blocked,
    },
  );

  _i2.Future<bool> saDeleteCustomer(_i1.UuidValue customerId) =>
      caller.callServerEndpoint<bool>(
        'superAdmin',
        'saDeleteCustomer',
        {'customerId': customerId},
      );

  _i2.Future<_i14.SuperAdminDashboard> saGetDashboard() =>
      caller.callServerEndpoint<_i14.SuperAdminDashboard>(
        'superAdmin',
        'saGetDashboard',
        {},
      );

  _i2.Future<List<_i4.Role>> saListAllRoles({_i1.UuidValue? customerId}) =>
      caller.callServerEndpoint<List<_i4.Role>>(
        'superAdmin',
        'saListAllRoles',
        {'customerId': customerId},
      );

  _i2.Future<bool> saMoveUserToCustomer({
    required int userId,
    required _i1.UuidValue newCustomerId,
    required _i1.UuidValue newRoleId,
  }) => caller.callServerEndpoint<bool>(
    'superAdmin',
    'saMoveUserToCustomer',
    {
      'userId': userId,
      'newCustomerId': newCustomerId,
      'newRoleId': newRoleId,
    },
  );

  _i2.Future<List<_i5.Permission>> saListAllPermissions() =>
      caller.callServerEndpoint<List<_i5.Permission>>(
        'superAdmin',
        'saListAllPermissions',
        {},
      );

  _i2.Future<_i4.Role> saCreateOrUpdateRole({
    required _i4.Role role,
    required List<_i1.UuidValue> permissionIds,
  }) => caller.callServerEndpoint<_i4.Role>(
    'superAdmin',
    'saCreateOrUpdateRole',
    {
      'role': role,
      'permissionIds': permissionIds,
    },
  );

  _i2.Future<bool> saDeleteRole(_i1.UuidValue roleId) =>
      caller.callServerEndpoint<bool>(
        'superAdmin',
        'saDeleteRole',
        {'roleId': roleId},
      );

  _i2.Future<_i8.RoleDetails?> saGetRoleDetails(_i1.UuidValue roleId) =>
      caller.callServerEndpoint<_i8.RoleDetails?>(
        'superAdmin',
        'saGetRoleDetails',
        {'roleId': roleId},
      );

  _i2.Future<bool> saUpdateUser({
    required int userId,
    required String userName,
    required String email,
    required _i1.UuidValue customerId,
    required _i1.UuidValue roleId,
  }) => caller.callServerEndpoint<bool>(
    'superAdmin',
    'saUpdateUser',
    {
      'userId': userId,
      'userName': userName,
      'email': email,
      'customerId': customerId,
      'roleId': roleId,
    },
  );

  _i2.Future<bool> saDeleteUser(int userId) => caller.callServerEndpoint<bool>(
    'superAdmin',
    'saDeleteUser',
    {'userId': userId},
  );

  _i2.Future<_i13.SuperUserDetails?> saGetUserDetails(int userId) =>
      caller.callServerEndpoint<_i13.SuperUserDetails?>(
        'superAdmin',
        'saGetUserDetails',
        {'userId': userId},
      );

  _i2.Future<_i6.Customer?> saGetCustomer(_i1.UuidValue customerId) =>
      caller.callServerEndpoint<_i6.Customer?>(
        'superAdmin',
        'saGetCustomer',
        {'customerId': customerId},
      );
}

/// {@category Endpoint}
class EndpointUserManagement extends _i1.EndpointRef {
  EndpointUserManagement(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userManagement';

  _i2.Future<_i15.UserSessionData?> getMyUserContext() =>
      caller.callServerEndpoint<_i15.UserSessionData?>(
        'userManagement',
        'getMyUserContext',
        {},
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i16.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i16.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

/// Базовый класс для эндпоинтов с проверкой блокировки пользователя.
/// Все эндпоинты, требующие аутентификации, должны наследоваться от этого класса.
/// {@category Endpoint}
abstract class EndpointBlockedUserProtected extends _i1.EndpointRef {
  EndpointBlockedUserProtected(_i1.EndpointCaller caller) : super(caller);

  /// Проверяет, не заблокирован ли аутентифицированный пользователь.
  /// Должен вызываться в начале каждого метода эндпоинта.
  _i2.Future<void> checkUserNotBlocked();
}

class Modules {
  Modules(Client client) {
    auth = _i7.Caller(client);
  }

  late final _i7.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i17.Protocol(),
         securityContext: securityContext,
         authenticationKeyManager: authenticationKeyManager,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    admin = EndpointAdmin(this);
    configuration = EndpointConfiguration(this);
    storage = EndpointStorage(this);
    superAdmin = EndpointSuperAdmin(this);
    userManagement = EndpointUserManagement(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointAdmin admin;

  late final EndpointConfiguration configuration;

  late final EndpointStorage storage;

  late final EndpointSuperAdmin superAdmin;

  late final EndpointUserManagement userManagement;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'admin': admin,
    'configuration': configuration,
    'storage': storage,
    'superAdmin': superAdmin,
    'userManagement': userManagement,
    'greeting': greeting,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
    'auth': modules.auth,
  };
}
