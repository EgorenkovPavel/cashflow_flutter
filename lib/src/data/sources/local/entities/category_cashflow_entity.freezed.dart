// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_cashflow_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryCashflowEntity {

 CategoryDB get category; int get monthCashflow; int get yearCashflow;
/// Create a copy of CategoryCashflowEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCashflowEntityCopyWith<CategoryCashflowEntity> get copyWith => _$CategoryCashflowEntityCopyWithImpl<CategoryCashflowEntity>(this as CategoryCashflowEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryCashflowEntity&&(identical(other.category, category) || other.category == category)&&(identical(other.monthCashflow, monthCashflow) || other.monthCashflow == monthCashflow)&&(identical(other.yearCashflow, yearCashflow) || other.yearCashflow == yearCashflow));
}


@override
int get hashCode => Object.hash(runtimeType,category,monthCashflow,yearCashflow);

@override
String toString() {
  return 'CategoryCashflowEntity(category: $category, monthCashflow: $monthCashflow, yearCashflow: $yearCashflow)';
}


}

/// @nodoc
abstract mixin class $CategoryCashflowEntityCopyWith<$Res>  {
  factory $CategoryCashflowEntityCopyWith(CategoryCashflowEntity value, $Res Function(CategoryCashflowEntity) _then) = _$CategoryCashflowEntityCopyWithImpl;
@useResult
$Res call({
 CategoryDB category, int monthCashflow, int yearCashflow
});




}
/// @nodoc
class _$CategoryCashflowEntityCopyWithImpl<$Res>
    implements $CategoryCashflowEntityCopyWith<$Res> {
  _$CategoryCashflowEntityCopyWithImpl(this._self, this._then);

  final CategoryCashflowEntity _self;
  final $Res Function(CategoryCashflowEntity) _then;

/// Create a copy of CategoryCashflowEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? monthCashflow = null,Object? yearCashflow = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryDB,monthCashflow: null == monthCashflow ? _self.monthCashflow : monthCashflow // ignore: cast_nullable_to_non_nullable
as int,yearCashflow: null == yearCashflow ? _self.yearCashflow : yearCashflow // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryCashflowEntity].
extension CategoryCashflowEntityPatterns on CategoryCashflowEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryCashflowEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryCashflowEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryCashflowEntity value)  $default,){
final _that = this;
switch (_that) {
case _CategoryCashflowEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryCashflowEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryCashflowEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CategoryDB category,  int monthCashflow,  int yearCashflow)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryCashflowEntity() when $default != null:
return $default(_that.category,_that.monthCashflow,_that.yearCashflow);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CategoryDB category,  int monthCashflow,  int yearCashflow)  $default,) {final _that = this;
switch (_that) {
case _CategoryCashflowEntity():
return $default(_that.category,_that.monthCashflow,_that.yearCashflow);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CategoryDB category,  int monthCashflow,  int yearCashflow)?  $default,) {final _that = this;
switch (_that) {
case _CategoryCashflowEntity() when $default != null:
return $default(_that.category,_that.monthCashflow,_that.yearCashflow);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryCashflowEntity implements CategoryCashflowEntity {
  const _CategoryCashflowEntity({required this.category, required this.monthCashflow, required this.yearCashflow});
  

@override final  CategoryDB category;
@override final  int monthCashflow;
@override final  int yearCashflow;

/// Create a copy of CategoryCashflowEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCashflowEntityCopyWith<_CategoryCashflowEntity> get copyWith => __$CategoryCashflowEntityCopyWithImpl<_CategoryCashflowEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryCashflowEntity&&(identical(other.category, category) || other.category == category)&&(identical(other.monthCashflow, monthCashflow) || other.monthCashflow == monthCashflow)&&(identical(other.yearCashflow, yearCashflow) || other.yearCashflow == yearCashflow));
}


@override
int get hashCode => Object.hash(runtimeType,category,monthCashflow,yearCashflow);

@override
String toString() {
  return 'CategoryCashflowEntity(category: $category, monthCashflow: $monthCashflow, yearCashflow: $yearCashflow)';
}


}

/// @nodoc
abstract mixin class _$CategoryCashflowEntityCopyWith<$Res> implements $CategoryCashflowEntityCopyWith<$Res> {
  factory _$CategoryCashflowEntityCopyWith(_CategoryCashflowEntity value, $Res Function(_CategoryCashflowEntity) _then) = __$CategoryCashflowEntityCopyWithImpl;
@override @useResult
$Res call({
 CategoryDB category, int monthCashflow, int yearCashflow
});




}
/// @nodoc
class __$CategoryCashflowEntityCopyWithImpl<$Res>
    implements _$CategoryCashflowEntityCopyWith<$Res> {
  __$CategoryCashflowEntityCopyWithImpl(this._self, this._then);

  final _CategoryCashflowEntity _self;
  final $Res Function(_CategoryCashflowEntity) _then;

/// Create a copy of CategoryCashflowEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? monthCashflow = null,Object? yearCashflow = null,}) {
  return _then(_CategoryCashflowEntity(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryDB,monthCashflow: null == monthCashflow ? _self.monthCashflow : monthCashflow // ignore: cast_nullable_to_non_nullable
as int,yearCashflow: null == yearCashflow ? _self.yearCashflow : yearCashflow // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
