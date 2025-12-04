// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_tag_map_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskTagMapModel {

 String get id; int get userId; String get customerId; DateTime get createdAt; DateTime get lastModified; bool get isDeleted; String get taskId; String get tagId;
/// Create a copy of TaskTagMapModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskTagMapModelCopyWith<TaskTagMapModel> get copyWith => _$TaskTagMapModelCopyWithImpl<TaskTagMapModel>(this as TaskTagMapModel, _$identity);

  /// Serializes this TaskTagMapModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskTagMapModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.tagId, tagId) || other.tagId == tagId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,customerId,createdAt,lastModified,isDeleted,taskId,tagId);

@override
String toString() {
  return 'TaskTagMapModel(id: $id, userId: $userId, customerId: $customerId, createdAt: $createdAt, lastModified: $lastModified, isDeleted: $isDeleted, taskId: $taskId, tagId: $tagId)';
}


}

/// @nodoc
abstract mixin class $TaskTagMapModelCopyWith<$Res>  {
  factory $TaskTagMapModelCopyWith(TaskTagMapModel value, $Res Function(TaskTagMapModel) _then) = _$TaskTagMapModelCopyWithImpl;
@useResult
$Res call({
 String id, int userId, String customerId, DateTime createdAt, DateTime lastModified, bool isDeleted, String taskId, String tagId
});




}
/// @nodoc
class _$TaskTagMapModelCopyWithImpl<$Res>
    implements $TaskTagMapModelCopyWith<$Res> {
  _$TaskTagMapModelCopyWithImpl(this._self, this._then);

  final TaskTagMapModel _self;
  final $Res Function(TaskTagMapModel) _then;

/// Create a copy of TaskTagMapModel
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


/// Adds pattern-matching-related methods to [TaskTagMapModel].
extension TaskTagMapModelPatterns on TaskTagMapModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskTagMapModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskTagMapModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskTagMapModel value)  $default,){
final _that = this;
switch (_that) {
case _TaskTagMapModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskTagMapModel value)?  $default,){
final _that = this;
switch (_that) {
case _TaskTagMapModel() when $default != null:
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
case _TaskTagMapModel() when $default != null:
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
case _TaskTagMapModel():
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
case _TaskTagMapModel() when $default != null:
return $default(_that.id,_that.userId,_that.customerId,_that.createdAt,_that.lastModified,_that.isDeleted,_that.taskId,_that.tagId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskTagMapModel implements TaskTagMapModel {
  const _TaskTagMapModel({required this.id, required this.userId, required this.customerId, required this.createdAt, required this.lastModified, this.isDeleted = false, required this.taskId, required this.tagId});
  factory _TaskTagMapModel.fromJson(Map<String, dynamic> json) => _$TaskTagMapModelFromJson(json);

@override final  String id;
@override final  int userId;
@override final  String customerId;
@override final  DateTime createdAt;
@override final  DateTime lastModified;
@override@JsonKey() final  bool isDeleted;
@override final  String taskId;
@override final  String tagId;

/// Create a copy of TaskTagMapModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskTagMapModelCopyWith<_TaskTagMapModel> get copyWith => __$TaskTagMapModelCopyWithImpl<_TaskTagMapModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskTagMapModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskTagMapModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.tagId, tagId) || other.tagId == tagId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,customerId,createdAt,lastModified,isDeleted,taskId,tagId);

@override
String toString() {
  return 'TaskTagMapModel(id: $id, userId: $userId, customerId: $customerId, createdAt: $createdAt, lastModified: $lastModified, isDeleted: $isDeleted, taskId: $taskId, tagId: $tagId)';
}


}

/// @nodoc
abstract mixin class _$TaskTagMapModelCopyWith<$Res> implements $TaskTagMapModelCopyWith<$Res> {
  factory _$TaskTagMapModelCopyWith(_TaskTagMapModel value, $Res Function(_TaskTagMapModel) _then) = __$TaskTagMapModelCopyWithImpl;
@override @useResult
$Res call({
 String id, int userId, String customerId, DateTime createdAt, DateTime lastModified, bool isDeleted, String taskId, String tagId
});




}
/// @nodoc
class __$TaskTagMapModelCopyWithImpl<$Res>
    implements _$TaskTagMapModelCopyWith<$Res> {
  __$TaskTagMapModelCopyWithImpl(this._self, this._then);

  final _TaskTagMapModel _self;
  final $Res Function(_TaskTagMapModel) _then;

/// Create a copy of TaskTagMapModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? customerId = null,Object? createdAt = null,Object? lastModified = null,Object? isDeleted = null,Object? taskId = null,Object? tagId = null,}) {
  return _then(_TaskTagMapModel(
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
