// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OperationListItem {

 Operation get operation; String get accountTitle; String get analyticTitle; User? get user;
/// Create a copy of OperationListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationListItemCopyWith<OperationListItem> get copyWith => _$OperationListItemCopyWithImpl<OperationListItem>(this as OperationListItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationListItem&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.accountTitle, accountTitle) || other.accountTitle == accountTitle)&&(identical(other.analyticTitle, analyticTitle) || other.analyticTitle == analyticTitle)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,operation,accountTitle,analyticTitle,user);

@override
String toString() {
  return 'OperationListItem(operation: $operation, accountTitle: $accountTitle, analyticTitle: $analyticTitle, user: $user)';
}


}

/// @nodoc
abstract mixin class $OperationListItemCopyWith<$Res>  {
  factory $OperationListItemCopyWith(OperationListItem value, $Res Function(OperationListItem) _then) = _$OperationListItemCopyWithImpl;
@useResult
$Res call({
 Operation operation, String accountTitle, String analyticTitle, User? user
});


$OperationCopyWith<$Res> get operation;$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$OperationListItemCopyWithImpl<$Res>
    implements $OperationListItemCopyWith<$Res> {
  _$OperationListItemCopyWithImpl(this._self, this._then);

  final OperationListItem _self;
  final $Res Function(OperationListItem) _then;

/// Create a copy of OperationListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? operation = null,Object? accountTitle = null,Object? analyticTitle = null,Object? user = freezed,}) {
  return _then(_self.copyWith(
operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as Operation,accountTitle: null == accountTitle ? _self.accountTitle : accountTitle // ignore: cast_nullable_to_non_nullable
as String,analyticTitle: null == analyticTitle ? _self.analyticTitle : analyticTitle // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}
/// Create a copy of OperationListItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OperationCopyWith<$Res> get operation {
  
  return $OperationCopyWith<$Res>(_self.operation, (value) {
    return _then(_self.copyWith(operation: value));
  });
}/// Create a copy of OperationListItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [OperationListItem].
extension OperationListItemPatterns on OperationListItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OperationListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OperationListItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OperationListItem value)  $default,){
final _that = this;
switch (_that) {
case _OperationListItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OperationListItem value)?  $default,){
final _that = this;
switch (_that) {
case _OperationListItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Operation operation,  String accountTitle,  String analyticTitle,  User? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OperationListItem() when $default != null:
return $default(_that.operation,_that.accountTitle,_that.analyticTitle,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Operation operation,  String accountTitle,  String analyticTitle,  User? user)  $default,) {final _that = this;
switch (_that) {
case _OperationListItem():
return $default(_that.operation,_that.accountTitle,_that.analyticTitle,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Operation operation,  String accountTitle,  String analyticTitle,  User? user)?  $default,) {final _that = this;
switch (_that) {
case _OperationListItem() when $default != null:
return $default(_that.operation,_that.accountTitle,_that.analyticTitle,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _OperationListItem implements OperationListItem {
  const _OperationListItem({required this.operation, required this.accountTitle, required this.analyticTitle, required this.user});
  

@override final  Operation operation;
@override final  String accountTitle;
@override final  String analyticTitle;
@override final  User? user;

/// Create a copy of OperationListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationListItemCopyWith<_OperationListItem> get copyWith => __$OperationListItemCopyWithImpl<_OperationListItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationListItem&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.accountTitle, accountTitle) || other.accountTitle == accountTitle)&&(identical(other.analyticTitle, analyticTitle) || other.analyticTitle == analyticTitle)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,operation,accountTitle,analyticTitle,user);

@override
String toString() {
  return 'OperationListItem(operation: $operation, accountTitle: $accountTitle, analyticTitle: $analyticTitle, user: $user)';
}


}

/// @nodoc
abstract mixin class _$OperationListItemCopyWith<$Res> implements $OperationListItemCopyWith<$Res> {
  factory _$OperationListItemCopyWith(_OperationListItem value, $Res Function(_OperationListItem) _then) = __$OperationListItemCopyWithImpl;
@override @useResult
$Res call({
 Operation operation, String accountTitle, String analyticTitle, User? user
});


@override $OperationCopyWith<$Res> get operation;@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$OperationListItemCopyWithImpl<$Res>
    implements _$OperationListItemCopyWith<$Res> {
  __$OperationListItemCopyWithImpl(this._self, this._then);

  final _OperationListItem _self;
  final $Res Function(_OperationListItem) _then;

/// Create a copy of OperationListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? operation = null,Object? accountTitle = null,Object? analyticTitle = null,Object? user = freezed,}) {
  return _then(_OperationListItem(
operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as Operation,accountTitle: null == accountTitle ? _self.accountTitle : accountTitle // ignore: cast_nullable_to_non_nullable
as String,analyticTitle: null == analyticTitle ? _self.analyticTitle : analyticTitle // ignore: cast_nullable_to_non_nullable
as String,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of OperationListItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OperationCopyWith<$Res> get operation {
  
  return $OperationCopyWith<$Res>(_self.operation, (value) {
    return _then(_self.copyWith(operation: value));
  });
}/// Create a copy of OperationListItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
