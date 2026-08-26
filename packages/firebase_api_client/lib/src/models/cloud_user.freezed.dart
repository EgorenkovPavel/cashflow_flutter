// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CloudUser {

 String get googleId; String get name; String get photo;
/// Create a copy of CloudUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudUserCopyWith<CloudUser> get copyWith => _$CloudUserCopyWithImpl<CloudUser>(this as CloudUser, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudUser&&(identical(other.googleId, googleId) || other.googleId == googleId)&&(identical(other.name, name) || other.name == name)&&(identical(other.photo, photo) || other.photo == photo));
}


@override
int get hashCode => Object.hash(runtimeType,googleId,name,photo);

@override
String toString() {
  return 'CloudUser(googleId: $googleId, name: $name, photo: $photo)';
}


}

/// @nodoc
abstract mixin class $CloudUserCopyWith<$Res>  {
  factory $CloudUserCopyWith(CloudUser value, $Res Function(CloudUser) _then) = _$CloudUserCopyWithImpl;
@useResult
$Res call({
 String googleId, String name, String photo
});




}
/// @nodoc
class _$CloudUserCopyWithImpl<$Res>
    implements $CloudUserCopyWith<$Res> {
  _$CloudUserCopyWithImpl(this._self, this._then);

  final CloudUser _self;
  final $Res Function(CloudUser) _then;

/// Create a copy of CloudUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? googleId = null,Object? name = null,Object? photo = null,}) {
  return _then(_self.copyWith(
googleId: null == googleId ? _self.googleId : googleId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudUser].
extension CloudUserPatterns on CloudUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudUser value)  $default,){
final _that = this;
switch (_that) {
case _CloudUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudUser value)?  $default,){
final _that = this;
switch (_that) {
case _CloudUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String googleId,  String name,  String photo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudUser() when $default != null:
return $default(_that.googleId,_that.name,_that.photo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String googleId,  String name,  String photo)  $default,) {final _that = this;
switch (_that) {
case _CloudUser():
return $default(_that.googleId,_that.name,_that.photo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String googleId,  String name,  String photo)?  $default,) {final _that = this;
switch (_that) {
case _CloudUser() when $default != null:
return $default(_that.googleId,_that.name,_that.photo);case _:
  return null;

}
}

}

/// @nodoc


class _CloudUser implements CloudUser {
  const _CloudUser({required this.googleId, required this.name, required this.photo});
  

@override final  String googleId;
@override final  String name;
@override final  String photo;

/// Create a copy of CloudUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudUserCopyWith<_CloudUser> get copyWith => __$CloudUserCopyWithImpl<_CloudUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudUser&&(identical(other.googleId, googleId) || other.googleId == googleId)&&(identical(other.name, name) || other.name == name)&&(identical(other.photo, photo) || other.photo == photo));
}


@override
int get hashCode => Object.hash(runtimeType,googleId,name,photo);

@override
String toString() {
  return 'CloudUser(googleId: $googleId, name: $name, photo: $photo)';
}


}

/// @nodoc
abstract mixin class _$CloudUserCopyWith<$Res> implements $CloudUserCopyWith<$Res> {
  factory _$CloudUserCopyWith(_CloudUser value, $Res Function(_CloudUser) _then) = __$CloudUserCopyWithImpl;
@override @useResult
$Res call({
 String googleId, String name, String photo
});




}
/// @nodoc
class __$CloudUserCopyWithImpl<$Res>
    implements _$CloudUserCopyWith<$Res> {
  __$CloudUserCopyWithImpl(this._self, this._then);

  final _CloudUser _self;
  final $Res Function(_CloudUser) _then;

/// Create a copy of CloudUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? googleId = null,Object? name = null,Object? photo = null,}) {
  return _then(_CloudUser(
googleId: null == googleId ? _self.googleId : googleId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
