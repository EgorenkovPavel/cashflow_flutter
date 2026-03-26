// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sum_on_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SumOnDate {

 DateTime get date; int get sum;
/// Create a copy of SumOnDate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SumOnDateCopyWith<SumOnDate> get copyWith => _$SumOnDateCopyWithImpl<SumOnDate>(this as SumOnDate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SumOnDate&&(identical(other.date, date) || other.date == date)&&(identical(other.sum, sum) || other.sum == sum));
}


@override
int get hashCode => Object.hash(runtimeType,date,sum);

@override
String toString() {
  return 'SumOnDate(date: $date, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $SumOnDateCopyWith<$Res>  {
  factory $SumOnDateCopyWith(SumOnDate value, $Res Function(SumOnDate) _then) = _$SumOnDateCopyWithImpl;
@useResult
$Res call({
 DateTime date, int sum
});




}
/// @nodoc
class _$SumOnDateCopyWithImpl<$Res>
    implements $SumOnDateCopyWith<$Res> {
  _$SumOnDateCopyWithImpl(this._self, this._then);

  final SumOnDate _self;
  final $Res Function(SumOnDate) _then;

/// Create a copy of SumOnDate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? sum = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SumOnDate].
extension SumOnDatePatterns on SumOnDate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SumOnDate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SumOnDate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SumOnDate value)  $default,){
final _that = this;
switch (_that) {
case _SumOnDate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SumOnDate value)?  $default,){
final _that = this;
switch (_that) {
case _SumOnDate() when $default != null:
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
case _SumOnDate() when $default != null:
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
case _SumOnDate():
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
case _SumOnDate() when $default != null:
return $default(_that.date,_that.sum);case _:
  return null;

}
}

}

/// @nodoc


class _SumOnDate implements SumOnDate {
  const _SumOnDate(this.date, this.sum);
  

@override final  DateTime date;
@override final  int sum;

/// Create a copy of SumOnDate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SumOnDateCopyWith<_SumOnDate> get copyWith => __$SumOnDateCopyWithImpl<_SumOnDate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SumOnDate&&(identical(other.date, date) || other.date == date)&&(identical(other.sum, sum) || other.sum == sum));
}


@override
int get hashCode => Object.hash(runtimeType,date,sum);

@override
String toString() {
  return 'SumOnDate(date: $date, sum: $sum)';
}


}

/// @nodoc
abstract mixin class _$SumOnDateCopyWith<$Res> implements $SumOnDateCopyWith<$Res> {
  factory _$SumOnDateCopyWith(_SumOnDate value, $Res Function(_SumOnDate) _then) = __$SumOnDateCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, int sum
});




}
/// @nodoc
class __$SumOnDateCopyWithImpl<$Res>
    implements _$SumOnDateCopyWith<$Res> {
  __$SumOnDateCopyWithImpl(this._self, this._then);

  final _SumOnDate _self;
  final $Res Function(_SumOnDate) _then;

/// Create a copy of SumOnDate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? sum = null,}) {
  return _then(_SumOnDate(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
