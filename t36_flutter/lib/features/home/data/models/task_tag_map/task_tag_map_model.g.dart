// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_tag_map_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskTagMapModel _$TaskTagMapModelFromJson(Map<String, dynamic> json) =>
    _TaskTagMapModel(
      id: json['id'] as String,
      userId: (json['userId'] as num).toInt(),
      customerId: json['customerId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastModified: DateTime.parse(json['lastModified'] as String),
      isDeleted: json['isDeleted'] as bool? ?? false,
      taskId: json['taskId'] as String,
      tagId: json['tagId'] as String,
    );

Map<String, dynamic> _$TaskTagMapModelToJson(_TaskTagMapModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'customerId': instance.customerId,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastModified': instance.lastModified.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'taskId': instance.taskId,
      'tagId': instance.tagId,
    };
