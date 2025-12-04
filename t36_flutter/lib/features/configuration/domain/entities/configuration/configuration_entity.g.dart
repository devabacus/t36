// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConfigurationEntity _$ConfigurationEntityFromJson(Map<String, dynamic> json) =>
    _ConfigurationEntity(
      id: json['id'] as String,
      userId: (json['userId'] as num).toInt(),
      customerId: json['customerId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastModified: DateTime.parse(json['lastModified'] as String),
      isDeleted: json['isDeleted'] as bool? ?? false,
      group: json['group'] as String,
      key: json['key'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$ConfigurationEntityToJson(
  _ConfigurationEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'customerId': instance.customerId,
  'createdAt': instance.createdAt.toIso8601String(),
  'lastModified': instance.lastModified.toIso8601String(),
  'isDeleted': instance.isDeleted,
  'group': instance.group,
  'key': instance.key,
  'value': instance.value,
};
