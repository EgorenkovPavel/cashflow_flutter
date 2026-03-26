// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Balance {

 List<Sum> get sums;
/// Create a copy of Balance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BalanceCopyWith<Balance> get copyWith => _$BalanceCopyWithImpl<Balance>(this as Balance, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Balance&&const DeepCollectionEquality().equals(other.sums, sums));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sums));

@override
String toString() {
  return 'Balance(sums: $sums)';
}


}

/// @nodoc
abstract mixin class $BalanceCopyWith<$Res>  {
  factory $BalanceCopyWith(Balance value, $Res Function(Balance) _then) = _$BalanceCopyWithImpl;
@useResult
$Res call({
 List<Sum> sums
});




}
/// @nodoc
class _$BalanceCopyWithImpl<$Res>
    implements $BalanceCopyWith<$Res> {
  _$BalanceCopyWithImpl(this._self, this._then);

  final Balance _self;
  final $Res Function(Balance) _then;

/// Create a copy of Balance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sums = null,}) {
  return _then(_self.copyWith(
sums: null == sums ? _self.sums : sums // ignore: cast_nullable_to_non_nullable
as List<Sum>,
  ));
}

}


/// Adds pattern-matching-related methods to [Balance].
extension BalancePatterns on Balance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Balance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Balance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Balance value)  $default,){
final _that = this;
switch (_that) {
case _Balance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Balance value)?  $default,){
final _that = this;
switch (_that) {
case _Balance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Sum> sums)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Balance() when $default != null:
return $default(_that.sums);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Sum> sums)  $default,) {final _that = this;
switch (_that) {
case _Balance():
return $default(_that.sums);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Sum> sums)?  $default,) {final _that = this;
switch (_that) {
case _Balance() when $default != null:
return $default(_that.sums);case _:
  return null;

}
}

}

/// @nodoc


class _Balance extends Balance {
  const _Balance([final  List<Sum> sums = const []]): _sums = sums,super._();
  

 final  List<Sum> _sums;
@override@JsonKey() List<Sum> get sums {
  if (_sums is EqualUnmodifiableListView) return _sums;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sums);
}


/// Create a copy of Balance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BalanceCopyWith<_Balance> get copyWith => __$BalanceCopyWithImpl<_Balance>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Balance&&const DeepCollectionEquality().equals(other._sums, _sums));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sums));

@override
String toString() {
  return 'Balance(sums: $sums)';
}


}

/// @nodoc
abstract mixin class _$BalanceCopyWith<$Res> implements $BalanceCopyWith<$Res> {
  factory _$BalanceCopyWith(_Balance value, $Res Function(_Balance) _then) = __$BalanceCopyWithImpl;
@override @useResult
$Res call({
 List<Sum> sums
});




}
/// @nodoc
class __$BalanceCopyWithImpl<$Res>
    implements _$BalanceCopyWith<$Res> {
  __$BalanceCopyWithImpl(this._self, this._then);

  final _Balance _self;
  final $Res Function(_Balance) _then;

/// Create a copy of Balance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sums = null,}) {
  return _then(_Balance(
null == sums ? _self._sums : sums // ignore: cast_nullable_to_non_nullable
as List<Sum>,
  ));
}


}

// dart format on
