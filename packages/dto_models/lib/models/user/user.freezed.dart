// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserResponce {

@UuidValueConverter() UuidValue get id; String get googleId; String get name; String get photo;@UuidValueConverter() UuidValue get userGroup;
/// Create a copy of UserResponce
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserResponceCopyWith<UserResponce> get copyWith => _$UserResponceCopyWithImpl<UserResponce>(this as UserResponce, _$identity);

  /// Serializes this UserResponce to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserResponce&&(identical(other.id, id) || other.id == id)&&(identical(other.googleId, googleId) || other.googleId == googleId)&&(identical(other.name, name) || other.name == name)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.userGroup, userGroup) || other.userGroup == userGroup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,googleId,name,photo,userGroup);

@override
String toString() {
  return 'UserResponce(id: $id, googleId: $googleId, name: $name, photo: $photo, userGroup: $userGroup)';
}


}

/// @nodoc
abstract mixin class $UserResponceCopyWith<$Res>  {
  factory $UserResponceCopyWith(UserResponce value, $Res Function(UserResponce) _then) = _$UserResponceCopyWithImpl;
@useResult
$Res call({
@UuidValueConverter() UuidValue id, String googleId, String name, String photo,@UuidValueConverter() UuidValue userGroup
});




}
/// @nodoc
class _$UserResponceCopyWithImpl<$Res>
    implements $UserResponceCopyWith<$Res> {
  _$UserResponceCopyWithImpl(this._self, this._then);

  final UserResponce _self;
  final $Res Function(UserResponce) _then;

/// Create a copy of UserResponce
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? googleId = null,Object? name = null,Object? photo = null,Object? userGroup = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,googleId: null == googleId ? _self.googleId : googleId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,userGroup: null == userGroup ? _self.userGroup : userGroup // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}

}


/// Adds pattern-matching-related methods to [UserResponce].
extension UserResponcePatterns on UserResponce {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserResponce value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserResponce() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserResponce value)  $default,){
final _that = this;
switch (_that) {
case _UserResponce():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserResponce value)?  $default,){
final _that = this;
switch (_that) {
case _UserResponce() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@UuidValueConverter()  UuidValue id,  String googleId,  String name,  String photo, @UuidValueConverter()  UuidValue userGroup)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserResponce() when $default != null:
return $default(_that.id,_that.googleId,_that.name,_that.photo,_that.userGroup);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@UuidValueConverter()  UuidValue id,  String googleId,  String name,  String photo, @UuidValueConverter()  UuidValue userGroup)  $default,) {final _that = this;
switch (_that) {
case _UserResponce():
return $default(_that.id,_that.googleId,_that.name,_that.photo,_that.userGroup);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@UuidValueConverter()  UuidValue id,  String googleId,  String name,  String photo, @UuidValueConverter()  UuidValue userGroup)?  $default,) {final _that = this;
switch (_that) {
case _UserResponce() when $default != null:
return $default(_that.id,_that.googleId,_that.name,_that.photo,_that.userGroup);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserResponce implements UserResponce {
  const _UserResponce({@UuidValueConverter() required this.id, required this.googleId, required this.name, required this.photo, @UuidValueConverter() required this.userGroup});
  factory _UserResponce.fromJson(Map<String, dynamic> json) => _$UserResponceFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override final  String googleId;
@override final  String name;
@override final  String photo;
@override@UuidValueConverter() final  UuidValue userGroup;

/// Create a copy of UserResponce
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserResponceCopyWith<_UserResponce> get copyWith => __$UserResponceCopyWithImpl<_UserResponce>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserResponceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserResponce&&(identical(other.id, id) || other.id == id)&&(identical(other.googleId, googleId) || other.googleId == googleId)&&(identical(other.name, name) || other.name == name)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.userGroup, userGroup) || other.userGroup == userGroup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,googleId,name,photo,userGroup);

@override
String toString() {
  return 'UserResponce(id: $id, googleId: $googleId, name: $name, photo: $photo, userGroup: $userGroup)';
}


}

/// @nodoc
abstract mixin class _$UserResponceCopyWith<$Res> implements $UserResponceCopyWith<$Res> {
  factory _$UserResponceCopyWith(_UserResponce value, $Res Function(_UserResponce) _then) = __$UserResponceCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, String googleId, String name, String photo,@UuidValueConverter() UuidValue userGroup
});




}
/// @nodoc
class __$UserResponceCopyWithImpl<$Res>
    implements _$UserResponceCopyWith<$Res> {
  __$UserResponceCopyWithImpl(this._self, this._then);

  final _UserResponce _self;
  final $Res Function(_UserResponce) _then;

/// Create a copy of UserResponce
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? googleId = null,Object? name = null,Object? photo = null,Object? userGroup = null,}) {
  return _then(_UserResponce(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,googleId: null == googleId ? _self.googleId : googleId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,userGroup: null == userGroup ? _self.userGroup : userGroup // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

// dart format on
