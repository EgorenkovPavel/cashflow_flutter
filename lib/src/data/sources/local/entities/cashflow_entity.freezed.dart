// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashflow_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CashflowEntity {

 int get categoryId; Sum get sum;
/// Create a copy of CashflowEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashflowEntityCopyWith<CashflowEntity> get copyWith => _$CashflowEntityCopyWithImpl<CashflowEntity>(this as CashflowEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashflowEntity&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.sum, sum) || other.sum == sum));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,sum);

@override
String toString() {
  return 'CashflowEntity(categoryId: $categoryId, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $CashflowEntityCopyWith<$Res>  {
  factory $CashflowEntityCopyWith(CashflowEntity value, $Res Function(CashflowEntity) _then) = _$CashflowEntityCopyWithImpl;
@useResult
$Res call({
 int categoryId, Sum sum
});




}
/// @nodoc
class _$CashflowEntityCopyWithImpl<$Res>
    implements $CashflowEntityCopyWith<$Res> {
  _$CashflowEntityCopyWithImpl(this._self, this._then);

  final CashflowEntity _self;
  final $Res Function(CashflowEntity) _then;

/// Create a copy of CashflowEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? sum = null,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Sum,
  ));
}

}


/// Adds pattern-matching-related methods to [CashflowEntity].
extension CashflowEntityPatterns on CashflowEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashflowEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashflowEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashflowEntity value)  $default,){
final _that = this;
switch (_that) {
case _CashflowEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashflowEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CashflowEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int categoryId,  Sum sum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashflowEntity() when $default != null:
return $default(_that.categoryId,_that.sum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int categoryId,  Sum sum)  $default,) {final _that = this;
switch (_that) {
case _CashflowEntity():
return $default(_that.categoryId,_that.sum);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int categoryId,  Sum sum)?  $default,) {final _that = this;
switch (_that) {
case _CashflowEntity() when $default != null:
return $default(_that.categoryId,_that.sum);case _:
  return null;

}
}

}

/// @nodoc


class _CashflowEntity implements CashflowEntity {
  const _CashflowEntity({required this.categoryId, required this.sum});
  

@override final  int categoryId;
@override final  Sum sum;

/// Create a copy of CashflowEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashflowEntityCopyWith<_CashflowEntity> get copyWith => __$CashflowEntityCopyWithImpl<_CashflowEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashflowEntity&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.sum, sum) || other.sum == sum));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,sum);

@override
String toString() {
  return 'CashflowEntity(categoryId: $categoryId, sum: $sum)';
}


}

/// @nodoc
abstract mixin class _$CashflowEntityCopyWith<$Res> implements $CashflowEntityCopyWith<$Res> {
  factory _$CashflowEntityCopyWith(_CashflowEntity value, $Res Function(_CashflowEntity) _then) = __$CashflowEntityCopyWithImpl;
@override @useResult
$Res call({
 int categoryId, Sum sum
});




}
/// @nodoc
class __$CashflowEntityCopyWithImpl<$Res>
    implements _$CashflowEntityCopyWith<$Res> {
  __$CashflowEntityCopyWithImpl(this._self, this._then);

  final _CashflowEntity _self;
  final $Res Function(_CashflowEntity) _then;

/// Create a copy of CashflowEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? sum = null,}) {
  return _then(_CashflowEntity(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Sum,
  ));
}


}

// dart format on
