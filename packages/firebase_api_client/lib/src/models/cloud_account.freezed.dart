// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CloudAccount {

 String get id; String get title; bool get isDebt; bool get deleted; String? get userGoogleId;
/// Create a copy of CloudAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CloudAccountCopyWith<CloudAccount> get copyWith => _$CloudAccountCopyWithImpl<CloudAccount>(this as CloudAccount, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CloudAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isDebt, isDebt) || other.isDebt == isDebt)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.userGoogleId, userGoogleId) || other.userGoogleId == userGoogleId));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,isDebt,deleted,userGoogleId);

@override
String toString() {
  return 'CloudAccount(id: $id, title: $title, isDebt: $isDebt, deleted: $deleted, userGoogleId: $userGoogleId)';
}


}

/// @nodoc
abstract mixin class $CloudAccountCopyWith<$Res>  {
  factory $CloudAccountCopyWith(CloudAccount value, $Res Function(CloudAccount) _then) = _$CloudAccountCopyWithImpl;
@useResult
$Res call({
 String id, String title, bool isDebt, bool deleted, String? userGoogleId
});




}
/// @nodoc
class _$CloudAccountCopyWithImpl<$Res>
    implements $CloudAccountCopyWith<$Res> {
  _$CloudAccountCopyWithImpl(this._self, this._then);

  final CloudAccount _self;
  final $Res Function(CloudAccount) _then;

/// Create a copy of CloudAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? isDebt = null,Object? deleted = null,Object? userGoogleId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isDebt: null == isDebt ? _self.isDebt : isDebt // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,userGoogleId: freezed == userGoogleId ? _self.userGoogleId : userGoogleId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CloudAccount].
extension CloudAccountPatterns on CloudAccount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CloudAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CloudAccount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CloudAccount value)  $default,){
final _that = this;
switch (_that) {
case _CloudAccount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CloudAccount value)?  $default,){
final _that = this;
switch (_that) {
case _CloudAccount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  bool isDebt,  bool deleted,  String? userGoogleId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CloudAccount() when $default != null:
return $default(_that.id,_that.title,_that.isDebt,_that.deleted,_that.userGoogleId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  bool isDebt,  bool deleted,  String? userGoogleId)  $default,) {final _that = this;
switch (_that) {
case _CloudAccount():
return $default(_that.id,_that.title,_that.isDebt,_that.deleted,_that.userGoogleId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  bool isDebt,  bool deleted,  String? userGoogleId)?  $default,) {final _that = this;
switch (_that) {
case _CloudAccount() when $default != null:
return $default(_that.id,_that.title,_that.isDebt,_that.deleted,_that.userGoogleId);case _:
  return null;

}
}

}

/// @nodoc


class _CloudAccount implements CloudAccount {
  const _CloudAccount({required this.id, required this.title, required this.isDebt, required this.deleted, required this.userGoogleId});
  

@override final  String id;
@override final  String title;
@override final  bool isDebt;
@override final  bool deleted;
@override final  String? userGoogleId;

/// Create a copy of CloudAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CloudAccountCopyWith<_CloudAccount> get copyWith => __$CloudAccountCopyWithImpl<_CloudAccount>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CloudAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isDebt, isDebt) || other.isDebt == isDebt)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.userGoogleId, userGoogleId) || other.userGoogleId == userGoogleId));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,isDebt,deleted,userGoogleId);

@override
String toString() {
  return 'CloudAccount(id: $id, title: $title, isDebt: $isDebt, deleted: $deleted, userGoogleId: $userGoogleId)';
}


}

/// @nodoc
abstract mixin class _$CloudAccountCopyWith<$Res> implements $CloudAccountCopyWith<$Res> {
  factory _$CloudAccountCopyWith(_CloudAccount value, $Res Function(_CloudAccount) _then) = __$CloudAccountCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, bool isDebt, bool deleted, String? userGoogleId
});




}
/// @nodoc
class __$CloudAccountCopyWithImpl<$Res>
    implements _$CloudAccountCopyWith<$Res> {
  __$CloudAccountCopyWithImpl(this._self, this._then);

  final _CloudAccount _self;
  final $Res Function(_CloudAccount) _then;

/// Create a copy of CloudAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isDebt = null,Object? deleted = null,Object? userGoogleId = freezed,}) {
  return _then(_CloudAccount(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isDebt: null == isDebt ? _self.isDebt : isDebt // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,userGoogleId: freezed == userGoogleId ? _self.userGoogleId : userGoogleId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
