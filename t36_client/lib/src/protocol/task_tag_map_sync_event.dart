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
import 'sync_event_type.dart' as _i2;
import 'task_tag_map.dart' as _i3;
import 'package:t36_client/src/protocol/protocol.dart' as _i4;

abstract class TaskTagMapSyncEvent implements _i1.SerializableModel {
  TaskTagMapSyncEvent._({
    this.id,
    required this.type,
    this.taskTagMap,
  });

  factory TaskTagMapSyncEvent({
    _i1.UuidValue? id,
    required _i2.SyncEventType type,
    _i3.TaskTagMap? taskTagMap,
  }) = _TaskTagMapSyncEventImpl;

  factory TaskTagMapSyncEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return TaskTagMapSyncEvent(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      type: _i2.SyncEventType.fromJson((jsonSerialization['type'] as String)),
      taskTagMap: jsonSerialization['taskTagMap'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.TaskTagMap>(
              jsonSerialization['taskTagMap'],
            ),
    );
  }

  _i2.SyncEventType type;

  _i3.TaskTagMap? taskTagMap;

  _i1.UuidValue? id;

  /// Returns a shallow copy of this [TaskTagMapSyncEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TaskTagMapSyncEvent copyWith({
    _i1.UuidValue? id,
    _i2.SyncEventType? type,
    _i3.TaskTagMap? taskTagMap,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TaskTagMapSyncEvent',
      if (id != null) 'id': id?.toJson(),
      'type': type.toJson(),
      if (taskTagMap != null) 'taskTagMap': taskTagMap?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskTagMapSyncEventImpl extends TaskTagMapSyncEvent {
  _TaskTagMapSyncEventImpl({
    _i1.UuidValue? id,
    required _i2.SyncEventType type,
    _i3.TaskTagMap? taskTagMap,
  }) : super._(
         id: id,
         type: type,
         taskTagMap: taskTagMap,
       );

  /// Returns a shallow copy of this [TaskTagMapSyncEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TaskTagMapSyncEvent copyWith({
    Object? id = _Undefined,
    _i2.SyncEventType? type,
    Object? taskTagMap = _Undefined,
  }) {
    return TaskTagMapSyncEvent(
      id: id is _i1.UuidValue? ? id : this.id,
      type: type ?? this.type,
      taskTagMap: taskTagMap is _i3.TaskTagMap?
          ? taskTagMap
          : this.taskTagMap?.copyWith(),
    );
  }
}
