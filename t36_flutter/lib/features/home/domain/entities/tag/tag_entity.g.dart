// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TagEntity _$TagEntityFromJson(Map<String, dynamic> json) => _TagEntity(
  id: json['id'] as String,
  userId: (json['userId'] as num).toInt(),
  customerId: json['customerId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lastModified: DateTime.parse(json['lastModified'] as String),
  isDeleted: json['isDeleted'] as bool? ?? false,
  title: json['title'] as String,
);

Map<String, dynamic> _$TagEntityToJson(_TagEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'customerId': instance.customerId,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastModified': instance.lastModified.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'title': instance.title,
    };
