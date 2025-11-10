// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_budget_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryBudgetEntity {

 CategoryDB get category; int get budget;
/// Create a copy of CategoryBudgetEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryBudgetEntityCopyWith<CategoryBudgetEntity> get copyWith => _$CategoryBudgetEntityCopyWithImpl<CategoryBudgetEntity>(this as CategoryBudgetEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryBudgetEntity&&(identical(other.category, category) || other.category == category)&&(identical(other.budget, budget) || other.budget == budget));
}


@override
int get hashCode => Object.hash(runtimeType,category,budget);

@override
String toString() {
  return 'CategoryBudgetEntity(category: $category, budget: $budget)';
}


}

/// @nodoc
abstract mixin class $CategoryBudgetEntityCopyWith<$Res>  {
  factory $CategoryBudgetEntityCopyWith(CategoryBudgetEntity value, $Res Function(CategoryBudgetEntity) _then) = _$CategoryBudgetEntityCopyWithImpl;
@useResult
$Res call({
 CategoryDB category, int budget
});




}
/// @nodoc
class _$CategoryBudgetEntityCopyWithImpl<$Res>
    implements $CategoryBudgetEntityCopyWith<$Res> {
  _$CategoryBudgetEntityCopyWithImpl(this._self, this._then);

  final CategoryBudgetEntity _self;
  final $Res Function(CategoryBudgetEntity) _then;

/// Create a copy of CategoryBudgetEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? budget = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryDB,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryBudgetEntity].
extension CategoryBudgetEntityPatterns on CategoryBudgetEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryBudgetEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryBudgetEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryBudgetEntity value)  $default,){
final _that = this;
switch (_that) {
case _CategoryBudgetEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryBudgetEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryBudgetEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CategoryDB category,  int budget)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryBudgetEntity() when $default != null:
return $default(_that.category,_that.budget);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CategoryDB category,  int budget)  $default,) {final _that = this;
switch (_that) {
case _CategoryBudgetEntity():
return $default(_that.category,_that.budget);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CategoryDB category,  int budget)?  $default,) {final _that = this;
switch (_that) {
case _CategoryBudgetEntity() when $default != null:
return $default(_that.category,_that.budget);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryBudgetEntity implements CategoryBudgetEntity {
  const _CategoryBudgetEntity({required this.category, required this.budget});
  

@override final  CategoryDB category;
@override final  int budget;

/// Create a copy of CategoryBudgetEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryBudgetEntityCopyWith<_CategoryBudgetEntity> get copyWith => __$CategoryBudgetEntityCopyWithImpl<_CategoryBudgetEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryBudgetEntity&&(identical(other.category, category) || other.category == category)&&(identical(other.budget, budget) || other.budget == budget));
}


@override
int get hashCode => Object.hash(runtimeType,category,budget);

@override
String toString() {
  return 'CategoryBudgetEntity(category: $category, budget: $budget)';
}


}

/// @nodoc
abstract mixin class _$CategoryBudgetEntityCopyWith<$Res> implements $CategoryBudgetEntityCopyWith<$Res> {
  factory _$CategoryBudgetEntityCopyWith(_CategoryBudgetEntity value, $Res Function(_CategoryBudgetEntity) _then) = __$CategoryBudgetEntityCopyWithImpl;
@override @useResult
$Res call({
 CategoryDB category, int budget
});




}
/// @nodoc
class __$CategoryBudgetEntityCopyWithImpl<$Res>
    implements _$CategoryBudgetEntityCopyWith<$Res> {
  __$CategoryBudgetEntityCopyWithImpl(this._self, this._then);

  final _CategoryBudgetEntity _self;
  final $Res Function(_CategoryBudgetEntity) _then;

/// Create a copy of CategoryBudgetEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? budget = null,}) {
  return _then(_CategoryBudgetEntity(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryDB,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
