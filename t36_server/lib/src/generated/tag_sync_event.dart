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
import 'sync_event_type.dart' as _i2;
import 'tag.dart' as _i3;
import 'package:t36_server/src/generated/protocol.dart' as _i4;

abstract class TagSyncEvent
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TagSyncEvent._({
    this.id,
    required this.type,
    this.tag,
  });

  factory TagSyncEvent({
    _i1.UuidValue? id,
    required _i2.SyncEventType type,
    _i3.Tag? tag,
  }) = _TagSyncEventImpl;

  factory TagSyncEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return TagSyncEvent(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      type: _i2.SyncEventType.fromJson((jsonSerialization['type'] as String)),
      tag: jsonSerialization['tag'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Tag>(jsonSerialization['tag']),
    );
  }

  _i2.SyncEventType type;

  _i3.Tag? tag;

  _i1.UuidValue? id;

  /// Returns a shallow copy of this [TagSyncEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TagSyncEvent copyWith({
    _i1.UuidValue? id,
    _i2.SyncEventType? type,
    _i3.Tag? tag,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TagSyncEvent',
      if (id != null) 'id': id?.toJson(),
      'type': type.toJson(),
      if (tag != null) 'tag': tag?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TagSyncEvent',
      if (id != null) 'id': id?.toJson(),
      'type': type.toJson(),
      if (tag != null) 'tag': tag?.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TagSyncEventImpl extends TagSyncEvent {
  _TagSyncEventImpl({
    _i1.UuidValue? id,
    required _i2.SyncEventType type,
    _i3.Tag? tag,
  }) : super._(
         id: id,
         type: type,
         tag: tag,
       );

  /// Returns a shallow copy of this [TagSyncEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TagSyncEvent copyWith({
    Object? id = _Undefined,
    _i2.SyncEventType? type,
    Object? tag = _Undefined,
  }) {
    return TagSyncEvent(
      id: id is _i1.UuidValue? ? id : this.id,
      type: type ?? this.type,
      tag: tag is _i3.Tag? ? tag : this.tag?.copyWith(),
    );
  }
}
