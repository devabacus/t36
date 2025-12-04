// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConfigurationModel _$ConfigurationModelFromJson(Map<String, dynamic> json) =>
    _ConfigurationModel(
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

Map<String, dynamic> _$ConfigurationModelToJson(_ConfigurationModel instance) =>
    <String, dynamic>{
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
