// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsScreenModel {

 String get title; List<SettingsSectionModel> get sections;
/// Create a copy of SettingsScreenModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsScreenModelCopyWith<SettingsScreenModel> get copyWith => _$SettingsScreenModelCopyWithImpl<SettingsScreenModel>(this as SettingsScreenModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsScreenModel&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.sections, sections));
}


@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(sections));

@override
String toString() {
  return 'SettingsScreenModel(title: $title, sections: $sections)';
}


}

/// @nodoc
abstract mixin class $SettingsScreenModelCopyWith<$Res>  {
  factory $SettingsScreenModelCopyWith(SettingsScreenModel value, $Res Function(SettingsScreenModel) _then) = _$SettingsScreenModelCopyWithImpl;
@useResult
$Res call({
 String title, List<SettingsSectionModel> sections
});




}
/// @nodoc
class _$SettingsScreenModelCopyWithImpl<$Res>
    implements $SettingsScreenModelCopyWith<$Res> {
  _$SettingsScreenModelCopyWithImpl(this._self, this._then);

  final SettingsScreenModel _self;
  final $Res Function(SettingsScreenModel) _then;

/// Create a copy of SettingsScreenModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? sections = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<SettingsSectionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingsScreenModel].
extension SettingsScreenModelPatterns on SettingsScreenModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsScreenModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsScreenModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsScreenModel value)  $default,){
final _that = this;
switch (_that) {
case _SettingsScreenModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsScreenModel value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsScreenModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  List<SettingsSectionModel> sections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsScreenModel() when $default != null:
return $default(_that.title,_that.sections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  List<SettingsSectionModel> sections)  $default,) {final _that = this;
switch (_that) {
case _SettingsScreenModel():
return $default(_that.title,_that.sections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  List<SettingsSectionModel> sections)?  $default,) {final _that = this;
switch (_that) {
case _SettingsScreenModel() when $default != null:
return $default(_that.title,_that.sections);case _:
  return null;

}
}

}

/// @nodoc


class _SettingsScreenModel implements SettingsScreenModel {
  const _SettingsScreenModel({required this.title, required final  List<SettingsSectionModel> sections}): _sections = sections;
  

@override final  String title;
 final  List<SettingsSectionModel> _sections;
@override List<SettingsSectionModel> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of SettingsScreenModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsScreenModelCopyWith<_SettingsScreenModel> get copyWith => __$SettingsScreenModelCopyWithImpl<_SettingsScreenModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsScreenModel&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._sections, _sections));
}


@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'SettingsScreenModel(title: $title, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$SettingsScreenModelCopyWith<$Res> implements $SettingsScreenModelCopyWith<$Res> {
  factory _$SettingsScreenModelCopyWith(_SettingsScreenModel value, $Res Function(_SettingsScreenModel) _then) = __$SettingsScreenModelCopyWithImpl;
@override @useResult
$Res call({
 String title, List<SettingsSectionModel> sections
});




}
/// @nodoc
class __$SettingsScreenModelCopyWithImpl<$Res>
    implements _$SettingsScreenModelCopyWith<$Res> {
  __$SettingsScreenModelCopyWithImpl(this._self, this._then);

  final _SettingsScreenModel _self;
  final $Res Function(_SettingsScreenModel) _then;

/// Create a copy of SettingsScreenModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? sections = null,}) {
  return _then(_SettingsScreenModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<SettingsSectionModel>,
  ));
}


}

/// @nodoc
mixin _$SettingsSectionModel {

 String get title; List<SettingViewModel> get settings;
/// Create a copy of SettingsSectionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsSectionModelCopyWith<SettingsSectionModel> get copyWith => _$SettingsSectionModelCopyWithImpl<SettingsSectionModel>(this as SettingsSectionModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsSectionModel&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.settings, settings));
}


@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(settings));

@override
String toString() {
  return 'SettingsSectionModel(title: $title, settings: $settings)';
}


}

/// @nodoc
abstract mixin class $SettingsSectionModelCopyWith<$Res>  {
  factory $SettingsSectionModelCopyWith(SettingsSectionModel value, $Res Function(SettingsSectionModel) _then) = _$SettingsSectionModelCopyWithImpl;
@useResult
$Res call({
 String title, List<SettingViewModel> settings
});




}
/// @nodoc
class _$SettingsSectionModelCopyWithImpl<$Res>
    implements $SettingsSectionModelCopyWith<$Res> {
  _$SettingsSectionModelCopyWithImpl(this._self, this._then);

  final SettingsSectionModel _self;
  final $Res Function(SettingsSectionModel) _then;

/// Create a copy of SettingsSectionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? settings = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as List<SettingViewModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingsSectionModel].
extension SettingsSectionModelPatterns on SettingsSectionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsSectionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsSectionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsSectionModel value)  $default,){
final _that = this;
switch (_that) {
case _SettingsSectionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsSectionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsSectionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  List<SettingViewModel> settings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsSectionModel() when $default != null:
return $default(_that.title,_that.settings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  List<SettingViewModel> settings)  $default,) {final _that = this;
switch (_that) {
case _SettingsSectionModel():
return $default(_that.title,_that.settings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  List<SettingViewModel> settings)?  $default,) {final _that = this;
switch (_that) {
case _SettingsSectionModel() when $default != null:
return $default(_that.title,_that.settings);case _:
  return null;

}
}

}

/// @nodoc


class _SettingsSectionModel implements SettingsSectionModel {
  const _SettingsSectionModel({required this.title, required final  List<SettingViewModel> settings}): _settings = settings;
  

@override final  String title;
 final  List<SettingViewModel> _settings;
@override List<SettingViewModel> get settings {
  if (_settings is EqualUnmodifiableListView) return _settings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_settings);
}


/// Create a copy of SettingsSectionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsSectionModelCopyWith<_SettingsSectionModel> get copyWith => __$SettingsSectionModelCopyWithImpl<_SettingsSectionModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsSectionModel&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._settings, _settings));
}


@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_settings));

@override
String toString() {
  return 'SettingsSectionModel(title: $title, settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$SettingsSectionModelCopyWith<$Res> implements $SettingsSectionModelCopyWith<$Res> {
  factory _$SettingsSectionModelCopyWith(_SettingsSectionModel value, $Res Function(_SettingsSectionModel) _then) = __$SettingsSectionModelCopyWithImpl;
@override @useResult
$Res call({
 String title, List<SettingViewModel> settings
});




}
/// @nodoc
class __$SettingsSectionModelCopyWithImpl<$Res>
    implements _$SettingsSectionModelCopyWith<$Res> {
  __$SettingsSectionModelCopyWithImpl(this._self, this._then);

  final _SettingsSectionModel _self;
  final $Res Function(_SettingsSectionModel) _then;

/// Create a copy of SettingsSectionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? settings = null,}) {
  return _then(_SettingsSectionModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,settings: null == settings ? _self._settings : settings // ignore: cast_nullable_to_non_nullable
as List<SettingViewModel>,
  ));
}


}

// dart format on
