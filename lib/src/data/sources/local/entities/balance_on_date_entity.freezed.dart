// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_on_date_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BalanceOnDate {

 DateTime get date; int get sum;
/// Create a copy of BalanceOnDate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BalanceOnDateCopyWith<BalanceOnDate> get copyWith => _$BalanceOnDateCopyWithImpl<BalanceOnDate>(this as BalanceOnDate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BalanceOnDate&&(identical(other.date, date) || other.date == date)&&(identical(other.sum, sum) || other.sum == sum));
}


@override
int get hashCode => Object.hash(runtimeType,date,sum);

@override
String toString() {
  return 'BalanceOnDate(date: $date, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $BalanceOnDateCopyWith<$Res>  {
  factory $BalanceOnDateCopyWith(BalanceOnDate value, $Res Function(BalanceOnDate) _then) = _$BalanceOnDateCopyWithImpl;
@useResult
$Res call({
 DateTime date, int sum
});




}
/// @nodoc
class _$BalanceOnDateCopyWithImpl<$Res>
    implements $BalanceOnDateCopyWith<$Res> {
  _$BalanceOnDateCopyWithImpl(this._self, this._then);

  final BalanceOnDate _self;
  final $Res Function(BalanceOnDate) _then;

/// Create a copy of BalanceOnDate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? sum = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BalanceOnDate].
extension BalanceOnDatePatterns on BalanceOnDate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BalanceOnDate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BalanceOnDate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BalanceOnDate value)  $default,){
final _that = this;
switch (_that) {
case _BalanceOnDate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BalanceOnDate value)?  $default,){
final _that = this;
switch (_that) {
case _BalanceOnDate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  int sum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BalanceOnDate() when $default != null:
return $default(_that.date,_that.sum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  int sum)  $default,) {final _that = this;
switch (_that) {
case _BalanceOnDate():
return $default(_that.date,_that.sum);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  int sum)?  $default,) {final _that = this;
switch (_that) {
case _BalanceOnDate() when $default != null:
return $default(_that.date,_that.sum);case _:
  return null;

}
}

}

/// @nodoc


class _BalanceOnDate implements BalanceOnDate {
  const _BalanceOnDate({required this.date, required this.sum});
  

@override final  DateTime date;
@override final  int sum;

/// Create a copy of BalanceOnDate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BalanceOnDateCopyWith<_BalanceOnDate> get copyWith => __$BalanceOnDateCopyWithImpl<_BalanceOnDate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BalanceOnDate&&(identical(other.date, date) || other.date == date)&&(identical(other.sum, sum) || other.sum == sum));
}


@override
int get hashCode => Object.hash(runtimeType,date,sum);

@override
String toString() {
  return 'BalanceOnDate(date: $date, sum: $sum)';
}


}

/// @nodoc
abstract mixin class _$BalanceOnDateCopyWith<$Res> implements $BalanceOnDateCopyWith<$Res> {
  factory _$BalanceOnDateCopyWith(_BalanceOnDate value, $Res Function(_BalanceOnDate) _then) = __$BalanceOnDateCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, int sum
});




}
/// @nodoc
class __$BalanceOnDateCopyWithImpl<$Res>
    implements _$BalanceOnDateCopyWith<$Res> {
  __$BalanceOnDateCopyWithImpl(this._self, this._then);

  final _BalanceOnDate _self;
  final $Res Function(_BalanceOnDate) _then;

/// Create a copy of BalanceOnDate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? sum = null,}) {
  return _then(_BalanceOnDate(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
