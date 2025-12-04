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
import 'configuration.dart' as _i3;
import 'package:t36_client/src/protocol/protocol.dart' as _i4;

abstract class ConfigurationSyncEvent implements _i1.SerializableModel {
  ConfigurationSyncEvent._({
    this.id,
    required this.type,
    this.configuration,
  });

  factory ConfigurationSyncEvent({
    _i1.UuidValue? id,
    required _i2.SyncEventType type,
    _i3.Configuration? configuration,
  }) = _ConfigurationSyncEventImpl;

  factory ConfigurationSyncEvent.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ConfigurationSyncEvent(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      type: _i2.SyncEventType.fromJson((jsonSerialization['type'] as String)),
      configuration: jsonSerialization['configuration'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Configuration>(
              jsonSerialization['configuration'],
            ),
    );
  }

  _i2.SyncEventType type;

  _i3.Configuration? configuration;

  _i1.UuidValue? id;

  /// Returns a shallow copy of this [ConfigurationSyncEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ConfigurationSyncEvent copyWith({
    _i1.UuidValue? id,
    _i2.SyncEventType? type,
    _i3.Configuration? configuration,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ConfigurationSyncEvent',
      if (id != null) 'id': id?.toJson(),
      'type': type.toJson(),
      if (configuration != null) 'configuration': configuration?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ConfigurationSyncEventImpl extends ConfigurationSyncEvent {
  _ConfigurationSyncEventImpl({
    _i1.UuidValue? id,
    required _i2.SyncEventType type,
    _i3.Configuration? configuration,
  }) : super._(
         id: id,
         type: type,
         configuration: configuration,
       );

  /// Returns a shallow copy of this [ConfigurationSyncEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ConfigurationSyncEvent copyWith({
    Object? id = _Undefined,
    _i2.SyncEventType? type,
    Object? configuration = _Undefined,
  }) {
    return ConfigurationSyncEvent(
      id: id is _i1.UuidValue? ? id : this.id,
      type: type ?? this.type,
      configuration: configuration is _i3.Configuration?
          ? configuration
          : this.configuration?.copyWith(),
    );
  }
}
