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
import 'category.dart' as _i3;
import 'package:t36_server/src/generated/protocol.dart' as _i4;

abstract class CategorySyncEvent
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CategorySyncEvent._({
    this.id,
    required this.type,
    this.category,
  });

  factory CategorySyncEvent({
    _i1.UuidValue? id,
    required _i2.SyncEventType type,
    _i3.Category? category,
  }) = _CategorySyncEventImpl;

  factory CategorySyncEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return CategorySyncEvent(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      type: _i2.SyncEventType.fromJson((jsonSerialization['type'] as String)),
      category: jsonSerialization['category'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Category>(
              jsonSerialization['category'],
            ),
    );
  }

  _i2.SyncEventType type;

  _i3.Category? category;

  _i1.UuidValue? id;

  /// Returns a shallow copy of this [CategorySyncEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CategorySyncEvent copyWith({
    _i1.UuidValue? id,
    _i2.SyncEventType? type,
    _i3.Category? category,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CategorySyncEvent',
      if (id != null) 'id': id?.toJson(),
      'type': type.toJson(),
      if (category != null) 'category': category?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CategorySyncEvent',
      if (id != null) 'id': id?.toJson(),
      'type': type.toJson(),
      if (category != null) 'category': category?.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CategorySyncEventImpl extends CategorySyncEvent {
  _CategorySyncEventImpl({
    _i1.UuidValue? id,
    required _i2.SyncEventType type,
    _i3.Category? category,
  }) : super._(
         id: id,
         type: type,
         category: category,
       );

  /// Returns a shallow copy of this [CategorySyncEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CategorySyncEvent copyWith({
    Object? id = _Undefined,
    _i2.SyncEventType? type,
    Object? category = _Undefined,
  }) {
    return CategorySyncEvent(
      id: id is _i1.UuidValue? ? id : this.id,
      type: type ?? this.type,
      category: category is _i3.Category?
          ? category
          : this.category?.copyWith(),
    );
  }
}
