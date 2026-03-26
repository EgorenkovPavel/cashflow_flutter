// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Sum {

 int get sum; Currency get currency;
/// Create a copy of Sum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SumCopyWith<Sum> get copyWith => _$SumCopyWithImpl<Sum>(this as Sum, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sum&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,sum,currency);

@override
String toString() {
  return 'Sum(sum: $sum, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $SumCopyWith<$Res>  {
  factory $SumCopyWith(Sum value, $Res Function(Sum) _then) = _$SumCopyWithImpl;
@useResult
$Res call({
 int sum, Currency currency
});




}
/// @nodoc
class _$SumCopyWithImpl<$Res>
    implements $SumCopyWith<$Res> {
  _$SumCopyWithImpl(this._self, this._then);

  final Sum _self;
  final $Res Function(Sum) _then;

/// Create a copy of Sum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sum = null,Object? currency = null,}) {
  return _then(_self.copyWith(
sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,
  ));
}

}


/// Adds pattern-matching-related methods to [Sum].
extension SumPatterns on Sum {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sum value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sum() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sum value)  $default,){
final _that = this;
switch (_that) {
case _Sum():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sum value)?  $default,){
final _that = this;
switch (_that) {
case _Sum() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sum,  Currency currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sum() when $default != null:
return $default(_that.sum,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sum,  Currency currency)  $default,) {final _that = this;
switch (_that) {
case _Sum():
return $default(_that.sum,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sum,  Currency currency)?  $default,) {final _that = this;
switch (_that) {
case _Sum() when $default != null:
return $default(_that.sum,_that.currency);case _:
  return null;

}
}

}

/// @nodoc


class _Sum extends Sum {
  const _Sum(this.sum, this.currency): super._();
  

@override final  int sum;
@override final  Currency currency;

/// Create a copy of Sum
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SumCopyWith<_Sum> get copyWith => __$SumCopyWithImpl<_Sum>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sum&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.currency, currency) || other.currency == currency));
}


@override
int get hashCode => Object.hash(runtimeType,sum,currency);

@override
String toString() {
  return 'Sum(sum: $sum, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$SumCopyWith<$Res> implements $SumCopyWith<$Res> {
  factory _$SumCopyWith(_Sum value, $Res Function(_Sum) _then) = __$SumCopyWithImpl;
@override @useResult
$Res call({
 int sum, Currency currency
});




}
/// @nodoc
class __$SumCopyWithImpl<$Res>
    implements _$SumCopyWith<$Res> {
  __$SumCopyWithImpl(this._self, this._then);

  final _Sum _self;
  final $Res Function(_Sum) _then;

/// Create a copy of Sum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sum = null,Object? currency = null,}) {
  return _then(_Sum(
null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as int,null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as Currency,
  ));
}


}

// dart format on
