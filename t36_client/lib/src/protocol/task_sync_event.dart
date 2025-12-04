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
import 'task.dart' as _i3;
import 'package:t36_client/src/protocol/protocol.dart' as _i4;

abstract class TaskSyncEvent implements _i1.SerializableModel {
  TaskSyncEvent._({
    this.id,
    required this.type,
    this.task,
  });

  factory TaskSyncEvent({
    _i1.UuidValue? id,
    required _i2.SyncEventType type,
    _i3.Task? task,
  }) = _TaskSyncEventImpl;

  factory TaskSyncEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return TaskSyncEvent(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      type: _i2.SyncEventType.fromJson((jsonSerialization['type'] as String)),
      task: jsonSerialization['task'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Task>(jsonSerialization['task']),
    );
  }

  _i2.SyncEventType type;

  _i3.Task? task;

  _i1.UuidValue? id;

  /// Returns a shallow copy of this [TaskSyncEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TaskSyncEvent copyWith({
    _i1.UuidValue? id,
    _i2.SyncEventType? type,
    _i3.Task? task,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TaskSyncEvent',
      if (id != null) 'id': id?.toJson(),
      'type': type.toJson(),
      if (task != null) 'task': task?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TaskSyncEventImpl extends TaskSyncEvent {
  _TaskSyncEventImpl({
    _i1.UuidValue? id,
    required _i2.SyncEventType type,
    _i3.Task? task,
  }) : super._(
         id: id,
         type: type,
         task: task,
       );

  /// Returns a shallow copy of this [TaskSyncEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TaskSyncEvent copyWith({
    Object? id = _Undefined,
    _i2.SyncEventType? type,
    Object? task = _Undefined,
  }) {
    return TaskSyncEvent(
      id: id is _i1.UuidValue? ? id : this.id,
      type: type ?? this.type,
      task: task is _i3.Task? ? task : this.task?.copyWith(),
    );
  }
}
