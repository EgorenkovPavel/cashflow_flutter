// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserGroupResponce {

@UuidValueConverter() UuidValue get id; String get name;
/// Create a copy of UserGroupResponce
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserGroupResponceCopyWith<UserGroupResponce> get copyWith => _$UserGroupResponceCopyWithImpl<UserGroupResponce>(this as UserGroupResponce, _$identity);

  /// Serializes this UserGroupResponce to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserGroupResponce&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'UserGroupResponce(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $UserGroupResponceCopyWith<$Res>  {
  factory $UserGroupResponceCopyWith(UserGroupResponce value, $Res Function(UserGroupResponce) _then) = _$UserGroupResponceCopyWithImpl;
@useResult
$Res call({
@UuidValueConverter() UuidValue id, String name
});




}
/// @nodoc
class _$UserGroupResponceCopyWithImpl<$Res>
    implements $UserGroupResponceCopyWith<$Res> {
  _$UserGroupResponceCopyWithImpl(this._self, this._then);

  final UserGroupResponce _self;
  final $Res Function(UserGroupResponce) _then;

/// Create a copy of UserGroupResponce
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserGroupResponce].
extension UserGroupResponcePatterns on UserGroupResponce {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserGroupResponce value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserGroupResponce() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserGroupResponce value)  $default,){
final _that = this;
switch (_that) {
case _UserGroupResponce():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserGroupResponce value)?  $default,){
final _that = this;
switch (_that) {
case _UserGroupResponce() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@UuidValueConverter()  UuidValue id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserGroupResponce() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@UuidValueConverter()  UuidValue id,  String name)  $default,) {final _that = this;
switch (_that) {
case _UserGroupResponce():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@UuidValueConverter()  UuidValue id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _UserGroupResponce() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserGroupResponce implements UserGroupResponce {
  const _UserGroupResponce({@UuidValueConverter() required this.id, required this.name});
  factory _UserGroupResponce.fromJson(Map<String, dynamic> json) => _$UserGroupResponceFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override final  String name;

/// Create a copy of UserGroupResponce
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserGroupResponceCopyWith<_UserGroupResponce> get copyWith => __$UserGroupResponceCopyWithImpl<_UserGroupResponce>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserGroupResponceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserGroupResponce&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'UserGroupResponce(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$UserGroupResponceCopyWith<$Res> implements $UserGroupResponceCopyWith<$Res> {
  factory _$UserGroupResponceCopyWith(_UserGroupResponce value, $Res Function(_UserGroupResponce) _then) = __$UserGroupResponceCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, String name
});




}
/// @nodoc
class __$UserGroupResponceCopyWithImpl<$Res>
    implements _$UserGroupResponceCopyWith<$Res> {
  __$UserGroupResponceCopyWithImpl(this._self, this._then);

  final _UserGroupResponce _self;
  final $Res Function(_UserGroupResponce) _then;

/// Create a copy of UserGroupResponce
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_UserGroupResponce(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
