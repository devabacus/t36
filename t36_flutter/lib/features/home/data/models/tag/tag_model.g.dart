// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TagModel _$TagModelFromJson(Map<String, dynamic> json) => _TagModel(
  id: json['id'] as String,
  userId: (json['userId'] as num).toInt(),
  customerId: json['customerId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lastModified: DateTime.parse(json['lastModified'] as String),
  isDeleted: json['isDeleted'] as bool? ?? false,
  title: json['title'] as String,
);

Map<String, dynamic> _$TagModelToJson(_TagModel instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'customerId': instance.customerId,
  'createdAt': instance.createdAt.toIso8601String(),
  'lastModified': instance.lastModified.toIso8601String(),
  'isDeleted': instance.isDeleted,
  'title': instance.title,
};
