// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'configuration_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConfigurationEntity {

 String get id; int get userId; String get customerId; DateTime get createdAt; DateTime get lastModified; bool get isDeleted;// === generated_start:freezedConstructor ===
 String get group; String get key; String get value;
/// Create a copy of ConfigurationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfigurationEntityCopyWith<ConfigurationEntity> get copyWith => _$ConfigurationEntityCopyWithImpl<ConfigurationEntity>(this as ConfigurationEntity, _$identity);

  /// Serializes this ConfigurationEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfigurationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.group, group) || other.group == group)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,customerId,createdAt,lastModified,isDeleted,group,key,value);

@override
String toString() {
  return 'ConfigurationEntity(id: $id, userId: $userId, customerId: $customerId, createdAt: $createdAt, lastModified: $lastModified, isDeleted: $isDeleted, group: $group, key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $ConfigurationEntityCopyWith<$Res>  {
  factory $ConfigurationEntityCopyWith(ConfigurationEntity value, $Res Function(ConfigurationEntity) _then) = _$ConfigurationEntityCopyWithImpl;
@useResult
$Res call({
 String id, int userId, String customerId, DateTime createdAt, DateTime lastModified, bool isDeleted, String group, String key, String value
});




}
/// @nodoc
class _$ConfigurationEntityCopyWithImpl<$Res>
    implements $ConfigurationEntityCopyWith<$Res> {
  _$ConfigurationEntityCopyWithImpl(this._self, this._then);

  final ConfigurationEntity _self;
  final $Res Function(ConfigurationEntity) _then;

/// Create a copy of ConfigurationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? customerId = null,Object? createdAt = null,Object? lastModified = null,Object? isDeleted = null,Object? group = null,Object? key = null,Object? value = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastModified: null == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfigurationEntity].
extension ConfigurationEntityPatterns on ConfigurationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfigurationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfigurationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfigurationEntity value)  $default,){
final _that = this;
switch (_that) {
case _ConfigurationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfigurationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ConfigurationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int userId,  String customerId,  DateTime createdAt,  DateTime lastModified,  bool isDeleted,  String group,  String key,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfigurationEntity() when $default != null:
return $default(_that.id,_that.userId,_that.customerId,_that.createdAt,_that.lastModified,_that.isDeleted,_that.group,_that.key,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int userId,  String customerId,  DateTime createdAt,  DateTime lastModified,  bool isDeleted,  String group,  String key,  String value)  $default,) {final _that = this;
switch (_that) {
case _ConfigurationEntity():
return $default(_that.id,_that.userId,_that.customerId,_that.createdAt,_that.lastModified,_that.isDeleted,_that.group,_that.key,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int userId,  String customerId,  DateTime createdAt,  DateTime lastModified,  bool isDeleted,  String group,  String key,  String value)?  $default,) {final _that = this;
switch (_that) {
case _ConfigurationEntity() when $default != null:
return $default(_that.id,_that.userId,_that.customerId,_that.createdAt,_that.lastModified,_that.isDeleted,_that.group,_that.key,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConfigurationEntity implements ConfigurationEntity {
  const _ConfigurationEntity({required this.id, required this.userId, required this.customerId, required this.createdAt, required this.lastModified, this.isDeleted = false, required this.group, required this.key, required this.value});
  factory _ConfigurationEntity.fromJson(Map<String, dynamic> json) => _$ConfigurationEntityFromJson(json);

@override final  String id;
@override final  int userId;
@override final  String customerId;
@override final  DateTime createdAt;
@override final  DateTime lastModified;
@override@JsonKey() final  bool isDeleted;
// === generated_start:freezedConstructor ===
@override final  String group;
@override final  String key;
@override final  String value;

/// Create a copy of ConfigurationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfigurationEntityCopyWith<_ConfigurationEntity> get copyWith => __$ConfigurationEntityCopyWithImpl<_ConfigurationEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfigurationEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfigurationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastModified, lastModified) || other.lastModified == lastModified)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.group, group) || other.group == group)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,customerId,createdAt,lastModified,isDeleted,group,key,value);

@override
String toString() {
  return 'ConfigurationEntity(id: $id, userId: $userId, customerId: $customerId, createdAt: $createdAt, lastModified: $lastModified, isDeleted: $isDeleted, group: $group, key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class _$ConfigurationEntityCopyWith<$Res> implements $ConfigurationEntityCopyWith<$Res> {
  factory _$ConfigurationEntityCopyWith(_ConfigurationEntity value, $Res Function(_ConfigurationEntity) _then) = __$ConfigurationEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, int userId, String customerId, DateTime createdAt, DateTime lastModified, bool isDeleted, String group, String key, String value
});




}
/// @nodoc
class __$ConfigurationEntityCopyWithImpl<$Res>
    implements _$ConfigurationEntityCopyWith<$Res> {
  __$ConfigurationEntityCopyWithImpl(this._self, this._then);

  final _ConfigurationEntity _self;
  final $Res Function(_ConfigurationEntity) _then;

/// Create a copy of ConfigurationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? customerId = null,Object? createdAt = null,Object? lastModified = null,Object? isDeleted = null,Object? group = null,Object? key = null,Object? value = null,}) {
  return _then(_ConfigurationEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastModified: null == lastModified ? _self.lastModified : lastModified // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
