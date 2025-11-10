// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_month_cashflow_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryMonthCashflowEntity {

 CategoryDB get category; int get month; int get cashflow;
/// Create a copy of CategoryMonthCashflowEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryMonthCashflowEntityCopyWith<CategoryMonthCashflowEntity> get copyWith => _$CategoryMonthCashflowEntityCopyWithImpl<CategoryMonthCashflowEntity>(this as CategoryMonthCashflowEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryMonthCashflowEntity&&(identical(other.category, category) || other.category == category)&&(identical(other.month, month) || other.month == month)&&(identical(other.cashflow, cashflow) || other.cashflow == cashflow));
}


@override
int get hashCode => Object.hash(runtimeType,category,month,cashflow);

@override
String toString() {
  return 'CategoryMonthCashflowEntity(category: $category, month: $month, cashflow: $cashflow)';
}


}

/// @nodoc
abstract mixin class $CategoryMonthCashflowEntityCopyWith<$Res>  {
  factory $CategoryMonthCashflowEntityCopyWith(CategoryMonthCashflowEntity value, $Res Function(CategoryMonthCashflowEntity) _then) = _$CategoryMonthCashflowEntityCopyWithImpl;
@useResult
$Res call({
 CategoryDB category, int month, int cashflow
});




}
/// @nodoc
class _$CategoryMonthCashflowEntityCopyWithImpl<$Res>
    implements $CategoryMonthCashflowEntityCopyWith<$Res> {
  _$CategoryMonthCashflowEntityCopyWithImpl(this._self, this._then);

  final CategoryMonthCashflowEntity _self;
  final $Res Function(CategoryMonthCashflowEntity) _then;

/// Create a copy of CategoryMonthCashflowEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? month = null,Object? cashflow = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryDB,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,cashflow: null == cashflow ? _self.cashflow : cashflow // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryMonthCashflowEntity].
extension CategoryMonthCashflowEntityPatterns on CategoryMonthCashflowEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryMonthCashflowEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryMonthCashflowEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryMonthCashflowEntity value)  $default,){
final _that = this;
switch (_that) {
case _CategoryMonthCashflowEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryMonthCashflowEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryMonthCashflowEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CategoryDB category,  int month,  int cashflow)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryMonthCashflowEntity() when $default != null:
return $default(_that.category,_that.month,_that.cashflow);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CategoryDB category,  int month,  int cashflow)  $default,) {final _that = this;
switch (_that) {
case _CategoryMonthCashflowEntity():
return $default(_that.category,_that.month,_that.cashflow);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CategoryDB category,  int month,  int cashflow)?  $default,) {final _that = this;
switch (_that) {
case _CategoryMonthCashflowEntity() when $default != null:
return $default(_that.category,_that.month,_that.cashflow);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryMonthCashflowEntity implements CategoryMonthCashflowEntity {
  const _CategoryMonthCashflowEntity({required this.category, required this.month, required this.cashflow});
  

@override final  CategoryDB category;
@override final  int month;
@override final  int cashflow;

/// Create a copy of CategoryMonthCashflowEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryMonthCashflowEntityCopyWith<_CategoryMonthCashflowEntity> get copyWith => __$CategoryMonthCashflowEntityCopyWithImpl<_CategoryMonthCashflowEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryMonthCashflowEntity&&(identical(other.category, category) || other.category == category)&&(identical(other.month, month) || other.month == month)&&(identical(other.cashflow, cashflow) || other.cashflow == cashflow));
}


@override
int get hashCode => Object.hash(runtimeType,category,month,cashflow);

@override
String toString() {
  return 'CategoryMonthCashflowEntity(category: $category, month: $month, cashflow: $cashflow)';
}


}

/// @nodoc
abstract mixin class _$CategoryMonthCashflowEntityCopyWith<$Res> implements $CategoryMonthCashflowEntityCopyWith<$Res> {
  factory _$CategoryMonthCashflowEntityCopyWith(_CategoryMonthCashflowEntity value, $Res Function(_CategoryMonthCashflowEntity) _then) = __$CategoryMonthCashflowEntityCopyWithImpl;
@override @useResult
$Res call({
 CategoryDB category, int month, int cashflow
});




}
/// @nodoc
class __$CategoryMonthCashflowEntityCopyWithImpl<$Res>
    implements _$CategoryMonthCashflowEntityCopyWith<$Res> {
  __$CategoryMonthCashflowEntityCopyWithImpl(this._self, this._then);

  final _CategoryMonthCashflowEntity _self;
  final $Res Function(_CategoryMonthCashflowEntity) _then;

/// Create a copy of CategoryMonthCashflowEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? month = null,Object? cashflow = null,}) {
  return _then(_CategoryMonthCashflowEntity(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryDB,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,cashflow: null == cashflow ? _self.cashflow : cashflow // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
