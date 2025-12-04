// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_tag_map_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskTagMapEntity {

 String get id; int get userId; String get customerId; DateTime get createdAt; DateTime get lastModified; bool get isDeleted; String get taskId; String get tagId;
/// Create a copy of TaskTagMapEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskTagMapEntityCopyWith<TaskTagMapEntity> get copyWith => _$TaskTagMapEntityCopyWithImpl<TaskTagMapEntity>(this as TaskTagMapEntity, _$identity);

  /// Serializes this TaskTagMapEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskTagMapEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.tagId, tagId) || other.tagId == tagId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,customerId,createdAt,lastModified,isDeleted,taskId,tagId);

@override
String toString() {
  return 'TaskTagMapEntity(id: $id, userId: $userId, customerId: $customerId, createdAt: $createdAt, lastModified: $lastModified, isDeleted: $isDeleted, taskId: $taskId, tagId: $tagId)';
}


}

/// @nodoc
abstract mixin class $TaskTagMapEntityCopyWith<$Res>  {
  factory $TaskTagMapEntityCopyWith(TaskTagMapEntity value, $Res Function(TaskTagMapEntity) _then) = _$TaskTagMapEntityCopyWithImpl;
@useResult
$Res call({
 String id, int userId, String customerId, DateTime createdAt, DateTime lastModified, bool isDeleted, String taskId, String tagId
});




}
/// @nodoc
class _$TaskTagMapEntityCopyWithImpl<$Res>
    implements $TaskTagMapEntityCopyWith<$Res> {
  _$TaskTagMapEntityCopyWithImpl(this._self, this._then);

  final TaskTagMapEntity _self;
  final $Res Function(TaskTagMapEntity) _then;

/// Create a copy of TaskTagMapEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? customerId = null,Object? createdAt = null,Object? lastModified = null,Object? isDeleted = null,Object? taskId = null,Object? tagId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastModified: null == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskTagMapEntity].
extension TaskTagMapEntityPatterns on TaskTagMapEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskTagMapEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskTagMapEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskTagMapEntity value)  $default,){
final _that = this;
switch (_that) {
case _TaskTagMapEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskTagMapEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TaskTagMapEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int userId,  String customerId,  DateTime createdAt,  DateTime lastModified,  bool isDeleted,  String taskId,  String tagId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskTagMapEntity() when $default != null:
return $default(_that.id,_that.userId,_that.customerId,_that.createdAt,_that.lastModified,_that.isDeleted,_that.taskId,_that.tagId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int userId,  String customerId,  DateTime createdAt,  DateTime lastModified,  bool isDeleted,  String taskId,  String tagId)  $default,) {final _that = this;
switch (_that) {
case _TaskTagMapEntity():
return $default(_that.id,_that.userId,_that.customerId,_that.createdAt,_that.lastModified,_that.isDeleted,_that.taskId,_that.tagId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int userId,  String customerId,  DateTime createdAt,  DateTime lastModified,  bool isDeleted,  String taskId,  String tagId)?  $default,) {final _that = this;
switch (_that) {
case _TaskTagMapEntity() when $default != null:
return $default(_that.id,_that.userId,_that.customerId,_that.createdAt,_that.lastModified,_that.isDeleted,_that.taskId,_that.tagId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskTagMapEntity implements TaskTagMapEntity {
  const _TaskTagMapEntity({required this.id, required this.userId, required this.customerId, required this.createdAt, required this.lastModified, this.isDeleted = false, required this.taskId, required this.tagId});
  factory _TaskTagMapEntity.fromJson(Map<String, dynamic> json) => _$TaskTagMapEntityFromJson(json);

@override final  String id;
@override final  int userId;
@override final  String customerId;
@override final  DateTime createdAt;
@override final  DateTime lastModified;
@override@JsonKey() final  bool isDeleted;
@override final  String taskId;
@override final  String tagId;

/// Create a copy of TaskTagMapEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskTagMapEntityCopyWith<_TaskTagMapEntity> get copyWith => __$TaskTagMapEntityCopyWithImpl<_TaskTagMapEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskTagMapEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskTagMapEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.tagId, tagId) || other.tagId == tagId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,customerId,createdAt,lastModified,isDeleted,taskId,tagId);

@override
String toString() {
  return 'TaskTagMapEntity(id: $id, userId: $userId, customerId: $customerId, createdAt: $createdAt, lastModified: $lastModified, isDeleted: $isDeleted, taskId: $taskId, tagId: $tagId)';
}


}

/// @nodoc
abstract mixin class _$TaskTagMapEntityCopyWith<$Res> implements $TaskTagMapEntityCopyWith<$Res> {
  factory _$TaskTagMapEntityCopyWith(_TaskTagMapEntity value, $Res Function(_TaskTagMapEntity) _then) = __$TaskTagMapEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, int userId, String customerId, DateTime createdAt, DateTime lastModified, bool isDeleted, String taskId, String tagId
});




}
/// @nodoc
class __$TaskTagMapEntityCopyWithImpl<$Res>
    implements _$TaskTagMapEntityCopyWith<$Res> {
  __$TaskTagMapEntityCopyWithImpl(this._self, this._then);

  final _TaskTagMapEntity _self;
  final $Res Function(_TaskTagMapEntity) _then;

/// Create a copy of TaskTagMapEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? customerId = null,Object? createdAt = null,Object? lastModified = null,Object? isDeleted = null,Object? taskId = null,Object? tagId = null,}) {
  return _then(_TaskTagMapEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastModified: null == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
