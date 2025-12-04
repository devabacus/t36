// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingViewModel {

 String get key; String get displayName; String get group;
/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingViewModelCopyWith<SettingViewModel> get copyWith => _$SettingViewModelCopyWithImpl<SettingViewModel>(this as SettingViewModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingViewModel&&(identical(other.key, key) || other.key == key)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.group, group) || other.group == group));
}


@override
int get hashCode => Object.hash(runtimeType,key,displayName,group);

@override
String toString() {
  return 'SettingViewModel(key: $key, displayName: $displayName, group: $group)';
}


}

/// @nodoc
abstract mixin class $SettingViewModelCopyWith<$Res>  {
  factory $SettingViewModelCopyWith(SettingViewModel value, $Res Function(SettingViewModel) _then) = _$SettingViewModelCopyWithImpl;
@useResult
$Res call({
 String key, String displayName, String group
});




}
/// @nodoc
class _$SettingViewModelCopyWithImpl<$Res>
    implements $SettingViewModelCopyWith<$Res> {
  _$SettingViewModelCopyWithImpl(this._self, this._then);

  final SettingViewModel _self;
  final $Res Function(SettingViewModel) _then;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? displayName = null,Object? group = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SettingViewModel].
extension SettingViewModelPatterns on SettingViewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BooleanSettingViewModel value)?  boolean,TResult Function( OptionsSettingViewModel value)?  options,TResult Function( StringSettingViewModel value)?  string,TResult Function( GroupSettingViewModel value)?  group,TResult Function( MultiSelectSettingViewModel value)?  multiSelect,TResult Function( NumberSettingViewModel value)?  number,TResult Function( SliderSettingViewModel value)?  slider,TResult Function( UnsupportedSettingViewModel value)?  unsupported,TResult Function( InfoSettingViewModel value)?  info,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BooleanSettingViewModel() when boolean != null:
return boolean(_that);case OptionsSettingViewModel() when options != null:
return options(_that);case StringSettingViewModel() when string != null:
return string(_that);case GroupSettingViewModel() when group != null:
return group(_that);case MultiSelectSettingViewModel() when multiSelect != null:
return multiSelect(_that);case NumberSettingViewModel() when number != null:
return number(_that);case SliderSettingViewModel() when slider != null:
return slider(_that);case UnsupportedSettingViewModel() when unsupported != null:
return unsupported(_that);case InfoSettingViewModel() when info != null:
return info(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BooleanSettingViewModel value)  boolean,required TResult Function( OptionsSettingViewModel value)  options,required TResult Function( StringSettingViewModel value)  string,required TResult Function( GroupSettingViewModel value)  group,required TResult Function( MultiSelectSettingViewModel value)  multiSelect,required TResult Function( NumberSettingViewModel value)  number,required TResult Function( SliderSettingViewModel value)  slider,required TResult Function( UnsupportedSettingViewModel value)  unsupported,required TResult Function( InfoSettingViewModel value)  info,}){
final _that = this;
switch (_that) {
case BooleanSettingViewModel():
return boolean(_that);case OptionsSettingViewModel():
return options(_that);case StringSettingViewModel():
return string(_that);case GroupSettingViewModel():
return group(_that);case MultiSelectSettingViewModel():
return multiSelect(_that);case NumberSettingViewModel():
return number(_that);case SliderSettingViewModel():
return slider(_that);case UnsupportedSettingViewModel():
return unsupported(_that);case InfoSettingViewModel():
return info(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BooleanSettingViewModel value)?  boolean,TResult? Function( OptionsSettingViewModel value)?  options,TResult? Function( StringSettingViewModel value)?  string,TResult? Function( GroupSettingViewModel value)?  group,TResult? Function( MultiSelectSettingViewModel value)?  multiSelect,TResult? Function( NumberSettingViewModel value)?  number,TResult? Function( SliderSettingViewModel value)?  slider,TResult? Function( UnsupportedSettingViewModel value)?  unsupported,TResult? Function( InfoSettingViewModel value)?  info,}){
final _that = this;
switch (_that) {
case BooleanSettingViewModel() when boolean != null:
return boolean(_that);case OptionsSettingViewModel() when options != null:
return options(_that);case StringSettingViewModel() when string != null:
return string(_that);case GroupSettingViewModel() when group != null:
return group(_that);case MultiSelectSettingViewModel() when multiSelect != null:
return multiSelect(_that);case NumberSettingViewModel() when number != null:
return number(_that);case SliderSettingViewModel() when slider != null:
return slider(_that);case UnsupportedSettingViewModel() when unsupported != null:
return unsupported(_that);case InfoSettingViewModel() when info != null:
return info(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String key,  String displayName,  String group,  bool value)?  boolean,TResult Function( String key,  String displayName,  String group,  String currentValue,  List<String> options)?  options,TResult Function( String key,  String displayName,  String group,  String value)?  string,TResult Function( String key,  String displayName,  String group)?  group,TResult Function( String key,  String displayName,  String group,  Set<String> currentValues,  List<String> options)?  multiSelect,TResult Function( String key,  String displayName,  String group,  num value)?  number,TResult Function( String key,  String displayName,  String group,  double value,  double min,  double max,  int? divisions)?  slider,TResult Function( String key,  String displayName,  String group)?  unsupported,TResult Function( String key,  String displayName,  String group,  String value)?  info,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BooleanSettingViewModel() when boolean != null:
return boolean(_that.key,_that.displayName,_that.group,_that.value);case OptionsSettingViewModel() when options != null:
return options(_that.key,_that.displayName,_that.group,_that.currentValue,_that.options);case StringSettingViewModel() when string != null:
return string(_that.key,_that.displayName,_that.group,_that.value);case GroupSettingViewModel() when group != null:
return group(_that.key,_that.displayName,_that.group);case MultiSelectSettingViewModel() when multiSelect != null:
return multiSelect(_that.key,_that.displayName,_that.group,_that.currentValues,_that.options);case NumberSettingViewModel() when number != null:
return number(_that.key,_that.displayName,_that.group,_that.value);case SliderSettingViewModel() when slider != null:
return slider(_that.key,_that.displayName,_that.group,_that.value,_that.min,_that.max,_that.divisions);case UnsupportedSettingViewModel() when unsupported != null:
return unsupported(_that.key,_that.displayName,_that.group);case InfoSettingViewModel() when info != null:
return info(_that.key,_that.displayName,_that.group,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String key,  String displayName,  String group,  bool value)  boolean,required TResult Function( String key,  String displayName,  String group,  String currentValue,  List<String> options)  options,required TResult Function( String key,  String displayName,  String group,  String value)  string,required TResult Function( String key,  String displayName,  String group)  group,required TResult Function( String key,  String displayName,  String group,  Set<String> currentValues,  List<String> options)  multiSelect,required TResult Function( String key,  String displayName,  String group,  num value)  number,required TResult Function( String key,  String displayName,  String group,  double value,  double min,  double max,  int? divisions)  slider,required TResult Function( String key,  String displayName,  String group)  unsupported,required TResult Function( String key,  String displayName,  String group,  String value)  info,}) {final _that = this;
switch (_that) {
case BooleanSettingViewModel():
return boolean(_that.key,_that.displayName,_that.group,_that.value);case OptionsSettingViewModel():
return options(_that.key,_that.displayName,_that.group,_that.currentValue,_that.options);case StringSettingViewModel():
return string(_that.key,_that.displayName,_that.group,_that.value);case GroupSettingViewModel():
return group(_that.key,_that.displayName,_that.group);case MultiSelectSettingViewModel():
return multiSelect(_that.key,_that.displayName,_that.group,_that.currentValues,_that.options);case NumberSettingViewModel():
return number(_that.key,_that.displayName,_that.group,_that.value);case SliderSettingViewModel():
return slider(_that.key,_that.displayName,_that.group,_that.value,_that.min,_that.max,_that.divisions);case UnsupportedSettingViewModel():
return unsupported(_that.key,_that.displayName,_that.group);case InfoSettingViewModel():
return info(_that.key,_that.displayName,_that.group,_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String key,  String displayName,  String group,  bool value)?  boolean,TResult? Function( String key,  String displayName,  String group,  String currentValue,  List<String> options)?  options,TResult? Function( String key,  String displayName,  String group,  String value)?  string,TResult? Function( String key,  String displayName,  String group)?  group,TResult? Function( String key,  String displayName,  String group,  Set<String> currentValues,  List<String> options)?  multiSelect,TResult? Function( String key,  String displayName,  String group,  num value)?  number,TResult? Function( String key,  String displayName,  String group,  double value,  double min,  double max,  int? divisions)?  slider,TResult? Function( String key,  String displayName,  String group)?  unsupported,TResult? Function( String key,  String displayName,  String group,  String value)?  info,}) {final _that = this;
switch (_that) {
case BooleanSettingViewModel() when boolean != null:
return boolean(_that.key,_that.displayName,_that.group,_that.value);case OptionsSettingViewModel() when options != null:
return options(_that.key,_that.displayName,_that.group,_that.currentValue,_that.options);case StringSettingViewModel() when string != null:
return string(_that.key,_that.displayName,_that.group,_that.value);case GroupSettingViewModel() when group != null:
return group(_that.key,_that.displayName,_that.group);case MultiSelectSettingViewModel() when multiSelect != null:
return multiSelect(_that.key,_that.displayName,_that.group,_that.currentValues,_that.options);case NumberSettingViewModel() when number != null:
return number(_that.key,_that.displayName,_that.group,_that.value);case SliderSettingViewModel() when slider != null:
return slider(_that.key,_that.displayName,_that.group,_that.value,_that.min,_that.max,_that.divisions);case UnsupportedSettingViewModel() when unsupported != null:
return unsupported(_that.key,_that.displayName,_that.group);case InfoSettingViewModel() when info != null:
return info(_that.key,_that.displayName,_that.group,_that.value);case _:
  return null;

}
}

}

/// @nodoc


class BooleanSettingViewModel implements SettingViewModel {
  const BooleanSettingViewModel({required this.key, required this.displayName, required this.group, required this.value});
  

@override final  String key;
@override final  String displayName;
@override final  String group;
 final  bool value;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BooleanSettingViewModelCopyWith<BooleanSettingViewModel> get copyWith => _$BooleanSettingViewModelCopyWithImpl<BooleanSettingViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BooleanSettingViewModel&&(identical(other.key, key) || other.key == key)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.group, group) || other.group == group)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,key,displayName,group,value);

@override
String toString() {
  return 'SettingViewModel.boolean(key: $key, displayName: $displayName, group: $group, value: $value)';
}


}

/// @nodoc
abstract mixin class $BooleanSettingViewModelCopyWith<$Res> implements $SettingViewModelCopyWith<$Res> {
  factory $BooleanSettingViewModelCopyWith(BooleanSettingViewModel value, $Res Function(BooleanSettingViewModel) _then) = _$BooleanSettingViewModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String displayName, String group, bool value
});




}
/// @nodoc
class _$BooleanSettingViewModelCopyWithImpl<$Res>
    implements $BooleanSettingViewModelCopyWith<$Res> {
  _$BooleanSettingViewModelCopyWithImpl(this._self, this._then);

  final BooleanSettingViewModel _self;
  final $Res Function(BooleanSettingViewModel) _then;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? displayName = null,Object? group = null,Object? value = null,}) {
  return _then(BooleanSettingViewModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class OptionsSettingViewModel implements SettingViewModel {
  const OptionsSettingViewModel({required this.key, required this.displayName, required this.group, required this.currentValue, required final  List<String> options}): _options = options;
  

@override final  String key;
@override final  String displayName;
@override final  String group;
 final  String currentValue;
 final  List<String> _options;
 List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OptionsSettingViewModelCopyWith<OptionsSettingViewModel> get copyWith => _$OptionsSettingViewModelCopyWithImpl<OptionsSettingViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OptionsSettingViewModel&&(identical(other.key, key) || other.key == key)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.group, group) || other.group == group)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&const DeepCollectionEquality().equals(other._options, _options));
}


@override
int get hashCode => Object.hash(runtimeType,key,displayName,group,currentValue,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'SettingViewModel.options(key: $key, displayName: $displayName, group: $group, currentValue: $currentValue, options: $options)';
}


}

/// @nodoc
abstract mixin class $OptionsSettingViewModelCopyWith<$Res> implements $SettingViewModelCopyWith<$Res> {
  factory $OptionsSettingViewModelCopyWith(OptionsSettingViewModel value, $Res Function(OptionsSettingViewModel) _then) = _$OptionsSettingViewModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String displayName, String group, String currentValue, List<String> options
});




}
/// @nodoc
class _$OptionsSettingViewModelCopyWithImpl<$Res>
    implements $OptionsSettingViewModelCopyWith<$Res> {
  _$OptionsSettingViewModelCopyWithImpl(this._self, this._then);

  final OptionsSettingViewModel _self;
  final $Res Function(OptionsSettingViewModel) _then;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? displayName = null,Object? group = null,Object? currentValue = null,Object? options = null,}) {
  return _then(OptionsSettingViewModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class StringSettingViewModel implements SettingViewModel {
  const StringSettingViewModel({required this.key, required this.displayName, required this.group, required this.value});
  

@override final  String key;
@override final  String displayName;
@override final  String group;
 final  String value;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StringSettingViewModelCopyWith<StringSettingViewModel> get copyWith => _$StringSettingViewModelCopyWithImpl<StringSettingViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StringSettingViewModel&&(identical(other.key, key) || other.key == key)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.group, group) || other.group == group)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,key,displayName,group,value);

@override
String toString() {
  return 'SettingViewModel.string(key: $key, displayName: $displayName, group: $group, value: $value)';
}


}

/// @nodoc
abstract mixin class $StringSettingViewModelCopyWith<$Res> implements $SettingViewModelCopyWith<$Res> {
  factory $StringSettingViewModelCopyWith(StringSettingViewModel value, $Res Function(StringSettingViewModel) _then) = _$StringSettingViewModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String displayName, String group, String value
});




}
/// @nodoc
class _$StringSettingViewModelCopyWithImpl<$Res>
    implements $StringSettingViewModelCopyWith<$Res> {
  _$StringSettingViewModelCopyWithImpl(this._self, this._then);

  final StringSettingViewModel _self;
  final $Res Function(StringSettingViewModel) _then;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? displayName = null,Object? group = null,Object? value = null,}) {
  return _then(StringSettingViewModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GroupSettingViewModel implements SettingViewModel {
  const GroupSettingViewModel({required this.key, required this.displayName, required this.group});
  

@override final  String key;
@override final  String displayName;
@override final  String group;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupSettingViewModelCopyWith<GroupSettingViewModel> get copyWith => _$GroupSettingViewModelCopyWithImpl<GroupSettingViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupSettingViewModel&&(identical(other.key, key) || other.key == key)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.group, group) || other.group == group));
}


@override
int get hashCode => Object.hash(runtimeType,key,displayName,group);

@override
String toString() {
  return 'SettingViewModel.group(key: $key, displayName: $displayName, group: $group)';
}


}

/// @nodoc
abstract mixin class $GroupSettingViewModelCopyWith<$Res> implements $SettingViewModelCopyWith<$Res> {
  factory $GroupSettingViewModelCopyWith(GroupSettingViewModel value, $Res Function(GroupSettingViewModel) _then) = _$GroupSettingViewModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String displayName, String group
});




}
/// @nodoc
class _$GroupSettingViewModelCopyWithImpl<$Res>
    implements $GroupSettingViewModelCopyWith<$Res> {
  _$GroupSettingViewModelCopyWithImpl(this._self, this._then);

  final GroupSettingViewModel _self;
  final $Res Function(GroupSettingViewModel) _then;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? displayName = null,Object? group = null,}) {
  return _then(GroupSettingViewModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MultiSelectSettingViewModel implements SettingViewModel {
  const MultiSelectSettingViewModel({required this.key, required this.displayName, required this.group, required final  Set<String> currentValues, required final  List<String> options}): _currentValues = currentValues,_options = options;
  

@override final  String key;
@override final  String displayName;
@override final  String group;
 final  Set<String> _currentValues;
 Set<String> get currentValues {
  if (_currentValues is EqualUnmodifiableSetView) return _currentValues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_currentValues);
}

 final  List<String> _options;
 List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MultiSelectSettingViewModelCopyWith<MultiSelectSettingViewModel> get copyWith => _$MultiSelectSettingViewModelCopyWithImpl<MultiSelectSettingViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MultiSelectSettingViewModel&&(identical(other.key, key) || other.key == key)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.group, group) || other.group == group)&&const DeepCollectionEquality().equals(other._currentValues, _currentValues)&&const DeepCollectionEquality().equals(other._options, _options));
}


@override
int get hashCode => Object.hash(runtimeType,key,displayName,group,const DeepCollectionEquality().hash(_currentValues),const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'SettingViewModel.multiSelect(key: $key, displayName: $displayName, group: $group, currentValues: $currentValues, options: $options)';
}


}

/// @nodoc
abstract mixin class $MultiSelectSettingViewModelCopyWith<$Res> implements $SettingViewModelCopyWith<$Res> {
  factory $MultiSelectSettingViewModelCopyWith(MultiSelectSettingViewModel value, $Res Function(MultiSelectSettingViewModel) _then) = _$MultiSelectSettingViewModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String displayName, String group, Set<String> currentValues, List<String> options
});




}
/// @nodoc
class _$MultiSelectSettingViewModelCopyWithImpl<$Res>
    implements $MultiSelectSettingViewModelCopyWith<$Res> {
  _$MultiSelectSettingViewModelCopyWithImpl(this._self, this._then);

  final MultiSelectSettingViewModel _self;
  final $Res Function(MultiSelectSettingViewModel) _then;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? displayName = null,Object? group = null,Object? currentValues = null,Object? options = null,}) {
  return _then(MultiSelectSettingViewModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,currentValues: null == currentValues ? _self._currentValues : currentValues // ignore: cast_nullable_to_non_nullable
as Set<String>,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class NumberSettingViewModel implements SettingViewModel {
  const NumberSettingViewModel({required this.key, required this.displayName, required this.group, required this.value});
  

@override final  String key;
@override final  String displayName;
@override final  String group;
 final  num value;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NumberSettingViewModelCopyWith<NumberSettingViewModel> get copyWith => _$NumberSettingViewModelCopyWithImpl<NumberSettingViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NumberSettingViewModel&&(identical(other.key, key) || other.key == key)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.group, group) || other.group == group)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,key,displayName,group,value);

@override
String toString() {
  return 'SettingViewModel.number(key: $key, displayName: $displayName, group: $group, value: $value)';
}


}

/// @nodoc
abstract mixin class $NumberSettingViewModelCopyWith<$Res> implements $SettingViewModelCopyWith<$Res> {
  factory $NumberSettingViewModelCopyWith(NumberSettingViewModel value, $Res Function(NumberSettingViewModel) _then) = _$NumberSettingViewModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String displayName, String group, num value
});




}
/// @nodoc
class _$NumberSettingViewModelCopyWithImpl<$Res>
    implements $NumberSettingViewModelCopyWith<$Res> {
  _$NumberSettingViewModelCopyWithImpl(this._self, this._then);

  final NumberSettingViewModel _self;
  final $Res Function(NumberSettingViewModel) _then;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? displayName = null,Object? group = null,Object? value = null,}) {
  return _then(NumberSettingViewModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}

/// @nodoc


class SliderSettingViewModel implements SettingViewModel {
  const SliderSettingViewModel({required this.key, required this.displayName, required this.group, required this.value, required this.min, required this.max, this.divisions});
  

@override final  String key;
@override final  String displayName;
@override final  String group;
 final  double value;
 final  double min;
 final  double max;
 final  int? divisions;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SliderSettingViewModelCopyWith<SliderSettingViewModel> get copyWith => _$SliderSettingViewModelCopyWithImpl<SliderSettingViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SliderSettingViewModel&&(identical(other.key, key) || other.key == key)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.group, group) || other.group == group)&&(identical(other.value, value) || other.value == value)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.divisions, divisions) || other.divisions == divisions));
}


@override
int get hashCode => Object.hash(runtimeType,key,displayName,group,value,min,max,divisions);

@override
String toString() {
  return 'SettingViewModel.slider(key: $key, displayName: $displayName, group: $group, value: $value, min: $min, max: $max, divisions: $divisions)';
}


}

/// @nodoc
abstract mixin class $SliderSettingViewModelCopyWith<$Res> implements $SettingViewModelCopyWith<$Res> {
  factory $SliderSettingViewModelCopyWith(SliderSettingViewModel value, $Res Function(SliderSettingViewModel) _then) = _$SliderSettingViewModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String displayName, String group, double value, double min, double max, int? divisions
});




}
/// @nodoc
class _$SliderSettingViewModelCopyWithImpl<$Res>
    implements $SliderSettingViewModelCopyWith<$Res> {
  _$SliderSettingViewModelCopyWithImpl(this._self, this._then);

  final SliderSettingViewModel _self;
  final $Res Function(SliderSettingViewModel) _then;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? displayName = null,Object? group = null,Object? value = null,Object? min = null,Object? max = null,Object? divisions = freezed,}) {
  return _then(SliderSettingViewModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double,divisions: freezed == divisions ? _self.divisions : divisions // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class UnsupportedSettingViewModel implements SettingViewModel {
  const UnsupportedSettingViewModel({required this.key, required this.displayName, required this.group});
  

@override final  String key;
@override final  String displayName;
@override final  String group;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnsupportedSettingViewModelCopyWith<UnsupportedSettingViewModel> get copyWith => _$UnsupportedSettingViewModelCopyWithImpl<UnsupportedSettingViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnsupportedSettingViewModel&&(identical(other.key, key) || other.key == key)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.group, group) || other.group == group));
}


@override
int get hashCode => Object.hash(runtimeType,key,displayName,group);

@override
String toString() {
  return 'SettingViewModel.unsupported(key: $key, displayName: $displayName, group: $group)';
}


}

/// @nodoc
abstract mixin class $UnsupportedSettingViewModelCopyWith<$Res> implements $SettingViewModelCopyWith<$Res> {
  factory $UnsupportedSettingViewModelCopyWith(UnsupportedSettingViewModel value, $Res Function(UnsupportedSettingViewModel) _then) = _$UnsupportedSettingViewModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String displayName, String group
});




}
/// @nodoc
class _$UnsupportedSettingViewModelCopyWithImpl<$Res>
    implements $UnsupportedSettingViewModelCopyWith<$Res> {
  _$UnsupportedSettingViewModelCopyWithImpl(this._self, this._then);

  final UnsupportedSettingViewModel _self;
  final $Res Function(UnsupportedSettingViewModel) _then;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? displayName = null,Object? group = null,}) {
  return _then(UnsupportedSettingViewModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InfoSettingViewModel implements SettingViewModel {
  const InfoSettingViewModel({required this.key, required this.displayName, required this.group, required this.value});
  

@override final  String key;
@override final  String displayName;
@override final  String group;
 final  String value;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfoSettingViewModelCopyWith<InfoSettingViewModel> get copyWith => _$InfoSettingViewModelCopyWithImpl<InfoSettingViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfoSettingViewModel&&(identical(other.key, key) || other.key == key)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.group, group) || other.group == group)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,key,displayName,group,value);

@override
String toString() {
  return 'SettingViewModel.info(key: $key, displayName: $displayName, group: $group, value: $value)';
}


}

/// @nodoc
abstract mixin class $InfoSettingViewModelCopyWith<$Res> implements $SettingViewModelCopyWith<$Res> {
  factory $InfoSettingViewModelCopyWith(InfoSettingViewModel value, $Res Function(InfoSettingViewModel) _then) = _$InfoSettingViewModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String displayName, String group, String value
});




}
/// @nodoc
class _$InfoSettingViewModelCopyWithImpl<$Res>
    implements $InfoSettingViewModelCopyWith<$Res> {
  _$InfoSettingViewModelCopyWithImpl(this._self, this._then);

  final InfoSettingViewModel _self;
  final $Res Function(InfoSettingViewModel) _then;

/// Create a copy of SettingViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? displayName = null,Object? group = null,Object? value = null,}) {
  return _then(InfoSettingViewModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
