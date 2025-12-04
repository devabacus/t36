// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => _TaskModel(
  id: json['id'] as String,
  userId: (json['userId'] as num).toInt(),
  customerId: json['customerId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lastModified: DateTime.parse(json['lastModified'] as String),
  isDeleted: json['isDeleted'] as bool? ?? false,
  title: json['title'] as String,
  categoryId: json['categoryId'] as String?,
);

Map<String, dynamic> _$TaskModelToJson(_TaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'customerId': instance.customerId,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastModified': instance.lastModified.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'title': instance.title,
      'categoryId': instance.categoryId,
    };
