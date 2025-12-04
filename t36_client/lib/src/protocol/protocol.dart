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
import 'category.dart' as _i2;
import 'category_sync_event.dart' as _i3;
import 'configuration.dart' as _i4;
import 'configuration_sync_event.dart' as _i5;
import 'greeting.dart' as _i6;
import 'storage/upload_request.dart' as _i7;
import 'storage/upload_status.dart' as _i8;
import 'storage/uploaded_file.dart' as _i9;
import 'sync_event_type.dart' as _i10;
import 'tag.dart' as _i11;
import 'tag_sync_event.dart' as _i12;
import 'task.dart' as _i13;
import 'task_sync_event.dart' as _i14;
import 'task_tag_map.dart' as _i15;
import 'task_tag_map_sync_event.dart' as _i16;
import 'user/customer.dart' as _i17;
import 'user/customer_user.dart' as _i18;
import 'user/permission.dart' as _i19;
import 'user/role.dart' as _i20;
import 'user/role_details.dart' as _i21;
import 'user/role_permission.dart' as _i22;
import 'user/super_admin_dashboard.dart' as _i23;
import 'user/super_user_details.dart' as _i24;
import 'user/user_details.dart' as _i25;
import 'user/user_session_data.dart' as _i26;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i27;
import 'package:t36_client/src/protocol/user/user_details.dart' as _i28;
import 'package:t36_client/src/protocol/user/role.dart' as _i29;
import 'package:t36_client/src/protocol/user/permission.dart' as _i30;
import 'package:t36_client/src/protocol/category.dart' as _i31;
import 'package:t36_client/src/protocol/configuration.dart' as _i32;
import 'package:t36_client/src/protocol/storage/uploaded_file.dart' as _i33;
import 'package:t36_client/src/protocol/user/customer.dart' as _i34;
import 'package:t36_client/src/protocol/user/super_user_details.dart' as _i35;
import 'package:t36_client/src/protocol/tag.dart' as _i36;
import 'package:t36_client/src/protocol/task.dart' as _i37;
import 'package:t36_client/src/protocol/task_tag_map.dart' as _i38;
export 'category.dart';
export 'category_sync_event.dart';
export 'configuration.dart';
export 'configuration_sync_event.dart';
export 'greeting.dart';
export 'storage/upload_request.dart';
export 'storage/upload_status.dart';
export 'storage/uploaded_file.dart';
export 'sync_event_type.dart';
export 'tag.dart';
export 'tag_sync_event.dart';
export 'task.dart';
export 'task_sync_event.dart';
export 'task_tag_map.dart';
export 'task_tag_map_sync_event.dart';
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
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

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

    if (t == _i2.Category) {
      return _i2.Category.fromJson(data) as T;
    }
    if (t == _i3.CategorySyncEvent) {
      return _i3.CategorySyncEvent.fromJson(data) as T;
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
    if (t == _i11.Tag) {
      return _i11.Tag.fromJson(data) as T;
    }
    if (t == _i12.TagSyncEvent) {
      return _i12.TagSyncEvent.fromJson(data) as T;
    }
    if (t == _i13.Task) {
      return _i13.Task.fromJson(data) as T;
    }
    if (t == _i14.TaskSyncEvent) {
      return _i14.TaskSyncEvent.fromJson(data) as T;
    }
    if (t == _i15.TaskTagMap) {
      return _i15.TaskTagMap.fromJson(data) as T;
    }
    if (t == _i16.TaskTagMapSyncEvent) {
      return _i16.TaskTagMapSyncEvent.fromJson(data) as T;
    }
    if (t == _i17.Customer) {
      return _i17.Customer.fromJson(data) as T;
    }
    if (t == _i18.CustomerUser) {
      return _i18.CustomerUser.fromJson(data) as T;
    }
    if (t == _i19.Permission) {
      return _i19.Permission.fromJson(data) as T;
    }
    if (t == _i20.Role) {
      return _i20.Role.fromJson(data) as T;
    }
    if (t == _i21.RoleDetails) {
      return _i21.RoleDetails.fromJson(data) as T;
    }
    if (t == _i22.RolePermission) {
      return _i22.RolePermission.fromJson(data) as T;
    }
    if (t == _i23.SuperAdminDashboard) {
      return _i23.SuperAdminDashboard.fromJson(data) as T;
    }
    if (t == _i24.SuperUserDetails) {
      return _i24.SuperUserDetails.fromJson(data) as T;
    }
    if (t == _i25.UserDetails) {
      return _i25.UserDetails.fromJson(data) as T;
    }
    if (t == _i26.UserSessionData) {
      return _i26.UserSessionData.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Category?>()) {
      return (data != null ? _i2.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.CategorySyncEvent?>()) {
      return (data != null ? _i3.CategorySyncEvent.fromJson(data) : null) as T;
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
    if (t == _i1.getType<_i11.Tag?>()) {
      return (data != null ? _i11.Tag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.TagSyncEvent?>()) {
      return (data != null ? _i12.TagSyncEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Task?>()) {
      return (data != null ? _i13.Task.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.TaskSyncEvent?>()) {
      return (data != null ? _i14.TaskSyncEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.TaskTagMap?>()) {
      return (data != null ? _i15.TaskTagMap.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.TaskTagMapSyncEvent?>()) {
      return (data != null ? _i16.TaskTagMapSyncEvent.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i17.Customer?>()) {
      return (data != null ? _i17.Customer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.CustomerUser?>()) {
      return (data != null ? _i18.CustomerUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.Permission?>()) {
      return (data != null ? _i19.Permission.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Role?>()) {
      return (data != null ? _i20.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.RoleDetails?>()) {
      return (data != null ? _i21.RoleDetails.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.RolePermission?>()) {
      return (data != null ? _i22.RolePermission.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.SuperAdminDashboard?>()) {
      return (data != null ? _i23.SuperAdminDashboard.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i24.SuperUserDetails?>()) {
      return (data != null ? _i24.SuperUserDetails.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.UserDetails?>()) {
      return (data != null ? _i25.UserDetails.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.UserSessionData?>()) {
      return (data != null ? _i26.UserSessionData.fromJson(data) : null) as T;
    }
    if (t == List<_i15.TaskTagMap>) {
      return (data as List).map((e) => deserialize<_i15.TaskTagMap>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i15.TaskTagMap>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i15.TaskTagMap>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i1.UuidValue>) {
      return (data as List).map((e) => deserialize<_i1.UuidValue>(e)).toList()
          as T;
    }
    if (t == List<_i27.UserInfo>) {
      return (data as List).map((e) => deserialize<_i27.UserInfo>(e)).toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i28.UserDetails>) {
      return (data as List)
              .map((e) => deserialize<_i28.UserDetails>(e))
              .toList()
          as T;
    }
    if (t == List<_i29.Role>) {
      return (data as List).map((e) => deserialize<_i29.Role>(e)).toList() as T;
    }
    if (t == List<_i30.Permission>) {
      return (data as List).map((e) => deserialize<_i30.Permission>(e)).toList()
          as T;
    }
    if (t == List<_i1.UuidValue>) {
      return (data as List).map((e) => deserialize<_i1.UuidValue>(e)).toList()
          as T;
    }
    if (t == List<_i31.Category>) {
      return (data as List).map((e) => deserialize<_i31.Category>(e)).toList()
          as T;
    }
    if (t == List<_i32.Configuration>) {
      return (data as List)
              .map((e) => deserialize<_i32.Configuration>(e))
              .toList()
          as T;
    }
    if (t == List<_i33.UploadedFile>) {
      return (data as List)
              .map((e) => deserialize<_i33.UploadedFile>(e))
              .toList()
          as T;
    }
    if (t == List<_i34.Customer>) {
      return (data as List).map((e) => deserialize<_i34.Customer>(e)).toList()
          as T;
    }
    if (t == List<_i35.SuperUserDetails>) {
      return (data as List)
              .map((e) => deserialize<_i35.SuperUserDetails>(e))
              .toList()
          as T;
    }
    if (t == List<_i36.Tag>) {
      return (data as List).map((e) => deserialize<_i36.Tag>(e)).toList() as T;
    }
    if (t == List<_i37.Task>) {
      return (data as List).map((e) => deserialize<_i37.Task>(e)).toList() as T;
    }
    if (t == List<_i38.TaskTagMap>) {
      return (data as List).map((e) => deserialize<_i38.TaskTagMap>(e)).toList()
          as T;
    }
    try {
      return _i27.Protocol().deserialize<T>(data, t);
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
      case _i2.Category():
        return 'Category';
      case _i3.CategorySyncEvent():
        return 'CategorySyncEvent';
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
      case _i11.Tag():
        return 'Tag';
      case _i12.TagSyncEvent():
        return 'TagSyncEvent';
      case _i13.Task():
        return 'Task';
      case _i14.TaskSyncEvent():
        return 'TaskSyncEvent';
      case _i15.TaskTagMap():
        return 'TaskTagMap';
      case _i16.TaskTagMapSyncEvent():
        return 'TaskTagMapSyncEvent';
      case _i17.Customer():
        return 'Customer';
      case _i18.CustomerUser():
        return 'CustomerUser';
      case _i19.Permission():
        return 'Permission';
      case _i20.Role():
        return 'Role';
      case _i21.RoleDetails():
        return 'RoleDetails';
      case _i22.RolePermission():
        return 'RolePermission';
      case _i23.SuperAdminDashboard():
        return 'SuperAdminDashboard';
      case _i24.SuperUserDetails():
        return 'SuperUserDetails';
      case _i25.UserDetails():
        return 'UserDetails';
      case _i26.UserSessionData():
        return 'UserSessionData';
    }
    className = _i27.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'Category') {
      return deserialize<_i2.Category>(data['data']);
    }
    if (dataClassName == 'CategorySyncEvent') {
      return deserialize<_i3.CategorySyncEvent>(data['data']);
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
    if (dataClassName == 'Tag') {
      return deserialize<_i11.Tag>(data['data']);
    }
    if (dataClassName == 'TagSyncEvent') {
      return deserialize<_i12.TagSyncEvent>(data['data']);
    }
    if (dataClassName == 'Task') {
      return deserialize<_i13.Task>(data['data']);
    }
    if (dataClassName == 'TaskSyncEvent') {
      return deserialize<_i14.TaskSyncEvent>(data['data']);
    }
    if (dataClassName == 'TaskTagMap') {
      return deserialize<_i15.TaskTagMap>(data['data']);
    }
    if (dataClassName == 'TaskTagMapSyncEvent') {
      return deserialize<_i16.TaskTagMapSyncEvent>(data['data']);
    }
    if (dataClassName == 'Customer') {
      return deserialize<_i17.Customer>(data['data']);
    }
    if (dataClassName == 'CustomerUser') {
      return deserialize<_i18.CustomerUser>(data['data']);
    }
    if (dataClassName == 'Permission') {
      return deserialize<_i19.Permission>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i20.Role>(data['data']);
    }
    if (dataClassName == 'RoleDetails') {
      return deserialize<_i21.RoleDetails>(data['data']);
    }
    if (dataClassName == 'RolePermission') {
      return deserialize<_i22.RolePermission>(data['data']);
    }
    if (dataClassName == 'SuperAdminDashboard') {
      return deserialize<_i23.SuperAdminDashboard>(data['data']);
    }
    if (dataClassName == 'SuperUserDetails') {
      return deserialize<_i24.SuperUserDetails>(data['data']);
    }
    if (dataClassName == 'UserDetails') {
      return deserialize<_i25.UserDetails>(data['data']);
    }
    if (dataClassName == 'UserSessionData') {
      return deserialize<_i26.UserSessionData>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i27.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
