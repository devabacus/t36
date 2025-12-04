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
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'configuration.dart' as _i4;
import 'configuration_sync_event.dart' as _i5;
import 'greeting.dart' as _i6;
import 'storage/upload_request.dart' as _i7;
import 'storage/upload_status.dart' as _i8;
import 'storage/uploaded_file.dart' as _i9;
import 'sync_event_type.dart' as _i10;
import 'user/customer.dart' as _i11;
import 'user/customer_user.dart' as _i12;
import 'user/permission.dart' as _i13;
import 'user/role.dart' as _i14;
import 'user/role_details.dart' as _i15;
import 'user/role_permission.dart' as _i16;
import 'user/super_admin_dashboard.dart' as _i17;
import 'user/super_user_details.dart' as _i18;
import 'user/user_details.dart' as _i19;
import 'user/user_session_data.dart' as _i20;
import 'package:t36_server/src/generated/user/user_details.dart' as _i21;
import 'package:t36_server/src/generated/user/role.dart' as _i22;
import 'package:t36_server/src/generated/user/permission.dart' as _i23;
import 'package:t36_server/src/generated/configuration.dart' as _i24;
import 'package:t36_server/src/generated/storage/uploaded_file.dart' as _i25;
import 'package:t36_server/src/generated/user/customer.dart' as _i26;
import 'package:t36_server/src/generated/user/super_user_details.dart' as _i27;
export 'configuration.dart';
export 'configuration_sync_event.dart';
export 'greeting.dart';
export 'storage/upload_request.dart';
export 'storage/upload_status.dart';
export 'storage/uploaded_file.dart';
export 'sync_event_type.dart';
export 'user/customer.dart';
export 'user/customer_user.dart';
export 'user/permission.dart';
export 'user/role.dart';
export 'user/role_details.dart';
export 'user/role_permission.dart';
export 'user/super_admin_dashboard.dart';
export 'user/super_user_details.dart';
export 'user/user_details.dart';
export 'user/user_session_data.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'configuration',
      dartName: 'Configuration',
      schema: 'public',
      module: 't36',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'lastModified',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'group',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'key',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'value',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'configuration_fk_0',
          columns: ['customerId'],
          referenceTable: 'customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'configuration_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'customer',
      dartName: 'Customer',
      schema: 'public',
      module: 't36',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'lastModified',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isDeleted',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'info',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'subscriptionStatus',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'customer_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'customer_user',
      dartName: 'CustomerUser',
      schema: 'public',
      module: 't36',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'roleId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'customer_user_fk_0',
          columns: ['customerId'],
          referenceTable: 'customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'customer_user_fk_1',
          columns: ['roleId'],
          referenceTable: 'role',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'customer_user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'permission',
      dartName: 'Permission',
      schema: 'public',
      module: 't36',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'key',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'permission_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'role',
      dartName: 'Role',
      schema: 'public',
      module: 't36',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'role_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'role_permission',
      dartName: 'RolePermission',
      schema: 'public',
      module: 't36',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'roleId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'permissionId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'role_permission_fk_0',
          columns: ['roleId'],
          referenceTable: 'role',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'role_permission_fk_1',
          columns: ['permissionId'],
          referenceTable: 'permission',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'role_permission_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'uploaded_files',
      dartName: 'UploadedFile',
      schema: 'public',
      module: 't36',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'bucketName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'objectKey',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'originalFilename',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'mimeType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'size',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:UploadStatus',
        ),
        _i2.ColumnDefinition(
          name: 'uploadedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'metadata',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'publicUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'uploaded_files_fk_0',
          columns: ['customerId'],
          referenceTable: 'customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'uploaded_files_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != t.toString()) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i4.Configuration) {
      return _i4.Configuration.fromJson(data) as T;
    }
    if (t == _i5.ConfigurationSyncEvent) {
      return _i5.ConfigurationSyncEvent.fromJson(data) as T;
    }
    if (t == _i6.Greeting) {
      return _i6.Greeting.fromJson(data) as T;
    }
    if (t == _i7.UploadRequest) {
      return _i7.UploadRequest.fromJson(data) as T;
    }
    if (t == _i8.UploadStatus) {
      return _i8.UploadStatus.fromJson(data) as T;
    }
    if (t == _i9.UploadedFile) {
      return _i9.UploadedFile.fromJson(data) as T;
    }
    if (t == _i10.SyncEventType) {
      return _i10.SyncEventType.fromJson(data) as T;
    }
    if (t == _i11.Customer) {
      return _i11.Customer.fromJson(data) as T;
    }
    if (t == _i12.CustomerUser) {
      return _i12.CustomerUser.fromJson(data) as T;
    }
    if (t == _i13.Permission) {
      return _i13.Permission.fromJson(data) as T;
    }
    if (t == _i14.Role) {
      return _i14.Role.fromJson(data) as T;
    }
    if (t == _i15.RoleDetails) {
      return _i15.RoleDetails.fromJson(data) as T;
    }
    if (t == _i16.RolePermission) {
      return _i16.RolePermission.fromJson(data) as T;
    }
    if (t == _i17.SuperAdminDashboard) {
      return _i17.SuperAdminDashboard.fromJson(data) as T;
    }
    if (t == _i18.SuperUserDetails) {
      return _i18.SuperUserDetails.fromJson(data) as T;
    }
    if (t == _i19.UserDetails) {
      return _i19.UserDetails.fromJson(data) as T;
    }
    if (t == _i20.UserSessionData) {
      return _i20.UserSessionData.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Configuration?>()) {
      return (data != null ? _i4.Configuration.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ConfigurationSyncEvent?>()) {
      return (data != null ? _i5.ConfigurationSyncEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.Greeting?>()) {
      return (data != null ? _i6.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.UploadRequest?>()) {
      return (data != null ? _i7.UploadRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.UploadStatus?>()) {
      return (data != null ? _i8.UploadStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.UploadedFile?>()) {
      return (data != null ? _i9.UploadedFile.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.SyncEventType?>()) {
      return (data != null ? _i10.SyncEventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Customer?>()) {
      return (data != null ? _i11.Customer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.CustomerUser?>()) {
      return (data != null ? _i12.CustomerUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Permission?>()) {
      return (data != null ? _i13.Permission.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Role?>()) {
      return (data != null ? _i14.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.RoleDetails?>()) {
      return (data != null ? _i15.RoleDetails.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.RolePermission?>()) {
      return (data != null ? _i16.RolePermission.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.SuperAdminDashboard?>()) {
      return (data != null ? _i17.SuperAdminDashboard.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i18.SuperUserDetails?>()) {
      return (data != null ? _i18.SuperUserDetails.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.UserDetails?>()) {
      return (data != null ? _i19.UserDetails.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.UserSessionData?>()) {
      return (data != null ? _i20.UserSessionData.fromJson(data) : null) as T;
    }
    if (t == List<_i1.UuidValue>) {
      return (data as List).map((e) => deserialize<_i1.UuidValue>(e)).toList()
          as T;
    }
    if (t == List<_i3.UserInfo>) {
      return (data as List).map((e) => deserialize<_i3.UserInfo>(e)).toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i21.UserDetails>) {
      return (data as List)
              .map((e) => deserialize<_i21.UserDetails>(e))
              .toList()
          as T;
    }
    if (t == List<_i22.Role>) {
      return (data as List).map((e) => deserialize<_i22.Role>(e)).toList() as T;
    }
    if (t == List<_i23.Permission>) {
      return (data as List).map((e) => deserialize<_i23.Permission>(e)).toList()
          as T;
    }
    if (t == List<_i1.UuidValue>) {
      return (data as List).map((e) => deserialize<_i1.UuidValue>(e)).toList()
          as T;
    }
    if (t == List<_i24.Configuration>) {
      return (data as List)
              .map((e) => deserialize<_i24.Configuration>(e))
              .toList()
          as T;
    }
    if (t == List<_i25.UploadedFile>) {
      return (data as List)
              .map((e) => deserialize<_i25.UploadedFile>(e))
              .toList()
          as T;
    }
    if (t == List<_i26.Customer>) {
      return (data as List).map((e) => deserialize<_i26.Customer>(e)).toList()
          as T;
    }
    if (t == List<_i27.SuperUserDetails>) {
      return (data as List)
              .map((e) => deserialize<_i27.SuperUserDetails>(e))
              .toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('t36.', '');
    }

    switch (data) {
      case _i4.Configuration():
        return 'Configuration';
      case _i5.ConfigurationSyncEvent():
        return 'ConfigurationSyncEvent';
      case _i6.Greeting():
        return 'Greeting';
      case _i7.UploadRequest():
        return 'UploadRequest';
      case _i8.UploadStatus():
        return 'UploadStatus';
      case _i9.UploadedFile():
        return 'UploadedFile';
      case _i10.SyncEventType():
        return 'SyncEventType';
      case _i11.Customer():
        return 'Customer';
      case _i12.CustomerUser():
        return 'CustomerUser';
      case _i13.Permission():
        return 'Permission';
      case _i14.Role():
        return 'Role';
      case _i15.RoleDetails():
        return 'RoleDetails';
      case _i16.RolePermission():
        return 'RolePermission';
      case _i17.SuperAdminDashboard():
        return 'SuperAdminDashboard';
      case _i18.SuperUserDetails():
        return 'SuperUserDetails';
      case _i19.UserDetails():
        return 'UserDetails';
      case _i20.UserSessionData():
        return 'UserSessionData';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Configuration') {
      return deserialize<_i4.Configuration>(data['data']);
    }
    if (dataClassName == 'ConfigurationSyncEvent') {
      return deserialize<_i5.ConfigurationSyncEvent>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i6.Greeting>(data['data']);
    }
    if (dataClassName == 'UploadRequest') {
      return deserialize<_i7.UploadRequest>(data['data']);
    }
    if (dataClassName == 'UploadStatus') {
      return deserialize<_i8.UploadStatus>(data['data']);
    }
    if (dataClassName == 'UploadedFile') {
      return deserialize<_i9.UploadedFile>(data['data']);
    }
    if (dataClassName == 'SyncEventType') {
      return deserialize<_i10.SyncEventType>(data['data']);
    }
    if (dataClassName == 'Customer') {
      return deserialize<_i11.Customer>(data['data']);
    }
    if (dataClassName == 'CustomerUser') {
      return deserialize<_i12.CustomerUser>(data['data']);
    }
    if (dataClassName == 'Permission') {
      return deserialize<_i13.Permission>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i14.Role>(data['data']);
    }
    if (dataClassName == 'RoleDetails') {
      return deserialize<_i15.RoleDetails>(data['data']);
    }
    if (dataClassName == 'RolePermission') {
      return deserialize<_i16.RolePermission>(data['data']);
    }
    if (dataClassName == 'SuperAdminDashboard') {
      return deserialize<_i17.SuperAdminDashboard>(data['data']);
    }
    if (dataClassName == 'SuperUserDetails') {
      return deserialize<_i18.SuperUserDetails>(data['data']);
    }
    if (dataClassName == 'UserDetails') {
      return deserialize<_i19.UserDetails>(data['data']);
    }
    if (dataClassName == 'UserSessionData') {
      return deserialize<_i20.UserSessionData>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.Configuration:
        return _i4.Configuration.t;
      case _i9.UploadedFile:
        return _i9.UploadedFile.t;
      case _i11.Customer:
        return _i11.Customer.t;
      case _i12.CustomerUser:
        return _i12.CustomerUser.t;
      case _i13.Permission:
        return _i13.Permission.t;
      case _i14.Role:
        return _i14.Role.t;
      case _i16.RolePermission:
        return _i16.RolePermission.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 't36';
}
