// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_cashflow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryCashFlow {

 int get categoryId; CategoryType get type; String get categoryTitle; BudgetType get budgetType; int get budget; Balance get monthCashFlow; Balance get yearCashFlow;
/// Create a copy of CategoryCashFlow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCashFlowCopyWith<CategoryCashFlow> get copyWith => _$CategoryCashFlowCopyWithImpl<CategoryCashFlow>(this as CategoryCashFlow, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryCashFlow&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.type, type) || other.type == type)&&(identical(other.categoryTitle, categoryTitle) || other.categoryTitle == categoryTitle)&&(identical(other.budgetType, budgetType) || other.budgetType == budgetType)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.monthCashFlow, monthCashFlow) || other.monthCashFlow == monthCashFlow)&&(identical(other.yearCashFlow, yearCashFlow) || other.yearCashFlow == yearCashFlow));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,type,categoryTitle,budgetType,budget,monthCashFlow,yearCashFlow);

@override
String toString() {
  return 'CategoryCashFlow(categoryId: $categoryId, type: $type, categoryTitle: $categoryTitle, budgetType: $budgetType, budget: $budget, monthCashFlow: $monthCashFlow, yearCashFlow: $yearCashFlow)';
}


}

/// @nodoc
abstract mixin class $CategoryCashFlowCopyWith<$Res>  {
  factory $CategoryCashFlowCopyWith(CategoryCashFlow value, $Res Function(CategoryCashFlow) _then) = _$CategoryCashFlowCopyWithImpl;
@useResult
$Res call({
 int categoryId, CategoryType type, String categoryTitle, BudgetType budgetType, int budget, Balance monthCashFlow, Balance yearCashFlow
});




}
/// @nodoc
class _$CategoryCashFlowCopyWithImpl<$Res>
    implements $CategoryCashFlowCopyWith<$Res> {
  _$CategoryCashFlowCopyWithImpl(this._self, this._then);

  final CategoryCashFlow _self;
  final $Res Function(CategoryCashFlow) _then;

/// Create a copy of CategoryCashFlow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? type = null,Object? categoryTitle = null,Object? budgetType = null,Object? budget = null,Object? monthCashFlow = null,Object? yearCashFlow = null,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,categoryTitle: null == categoryTitle ? _self.categoryTitle : categoryTitle // ignore: cast_nullable_to_non_nullable
as String,budgetType: null == budgetType ? _self.budgetType : budgetType // ignore: cast_nullable_to_non_nullable
as BudgetType,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,monthCashFlow: null == monthCashFlow ? _self.monthCashFlow : monthCashFlow // ignore: cast_nullable_to_non_nullable
as Balance,yearCashFlow: null == yearCashFlow ? _self.yearCashFlow : yearCashFlow // ignore: cast_nullable_to_non_nullable
as Balance,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryCashFlow].
extension CategoryCashFlowPatterns on CategoryCashFlow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryCashFlow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryCashFlow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryCashFlow value)  $default,){
final _that = this;
switch (_that) {
case _CategoryCashFlow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryCashFlow value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryCashFlow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int categoryId,  CategoryType type,  String categoryTitle,  BudgetType budgetType,  int budget,  Balance monthCashFlow,  Balance yearCashFlow)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryCashFlow() when $default != null:
return $default(_that.categoryId,_that.type,_that.categoryTitle,_that.budgetType,_that.budget,_that.monthCashFlow,_that.yearCashFlow);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int categoryId,  CategoryType type,  String categoryTitle,  BudgetType budgetType,  int budget,  Balance monthCashFlow,  Balance yearCashFlow)  $default,) {final _that = this;
switch (_that) {
case _CategoryCashFlow():
return $default(_that.categoryId,_that.type,_that.categoryTitle,_that.budgetType,_that.budget,_that.monthCashFlow,_that.yearCashFlow);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int categoryId,  CategoryType type,  String categoryTitle,  BudgetType budgetType,  int budget,  Balance monthCashFlow,  Balance yearCashFlow)?  $default,) {final _that = this;
switch (_that) {
case _CategoryCashFlow() when $default != null:
return $default(_that.categoryId,_that.type,_that.categoryTitle,_that.budgetType,_that.budget,_that.monthCashFlow,_that.yearCashFlow);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryCashFlow implements CategoryCashFlow {
  const _CategoryCashFlow({required this.categoryId, required this.type, required this.categoryTitle, required this.budgetType, required this.budget, required this.monthCashFlow, required this.yearCashFlow});
  

@override final  int categoryId;
@override final  CategoryType type;
@override final  String categoryTitle;
@override final  BudgetType budgetType;
@override final  int budget;
@override final  Balance monthCashFlow;
@override final  Balance yearCashFlow;

/// Create a copy of CategoryCashFlow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCashFlowCopyWith<_CategoryCashFlow> get copyWith => __$CategoryCashFlowCopyWithImpl<_CategoryCashFlow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryCashFlow&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.type, type) || other.type == type)&&(identical(other.categoryTitle, categoryTitle) || other.categoryTitle == categoryTitle)&&(identical(other.budgetType, budgetType) || other.budgetType == budgetType)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.monthCashFlow, monthCashFlow) || other.monthCashFlow == monthCashFlow)&&(identical(other.yearCashFlow, yearCashFlow) || other.yearCashFlow == yearCashFlow));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,type,categoryTitle,budgetType,budget,monthCashFlow,yearCashFlow);

@override
String toString() {
  return 'CategoryCashFlow(categoryId: $categoryId, type: $type, categoryTitle: $categoryTitle, budgetType: $budgetType, budget: $budget, monthCashFlow: $monthCashFlow, yearCashFlow: $yearCashFlow)';
}


}

/// @nodoc
abstract mixin class _$CategoryCashFlowCopyWith<$Res> implements $CategoryCashFlowCopyWith<$Res> {
  factory _$CategoryCashFlowCopyWith(_CategoryCashFlow value, $Res Function(_CategoryCashFlow) _then) = __$CategoryCashFlowCopyWithImpl;
@override @useResult
$Res call({
 int categoryId, CategoryType type, String categoryTitle, BudgetType budgetType, int budget, Balance monthCashFlow, Balance yearCashFlow
});




}
/// @nodoc
class __$CategoryCashFlowCopyWithImpl<$Res>
    implements _$CategoryCashFlowCopyWith<$Res> {
  __$CategoryCashFlowCopyWithImpl(this._self, this._then);

  final _CategoryCashFlow _self;
  final $Res Function(_CategoryCashFlow) _then;

/// Create a copy of CategoryCashFlow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? type = null,Object? categoryTitle = null,Object? budgetType = null,Object? budget = null,Object? monthCashFlow = null,Object? yearCashFlow = null,}) {
  return _then(_CategoryCashFlow(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,categoryTitle: null == categoryTitle ? _self.categoryTitle : categoryTitle // ignore: cast_nullable_to_non_nullable
as String,budgetType: null == budgetType ? _self.budgetType : budgetType // ignore: cast_nullable_to_non_nullable
as BudgetType,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,monthCashFlow: null == monthCashFlow ? _self.monthCashFlow : monthCashFlow // ignore: cast_nullable_to_non_nullable
as Balance,yearCashFlow: null == yearCashFlow ? _self.yearCashFlow : yearCashFlow // ignore: cast_nullable_to_non_nullable
as Balance,
  ));
}


}

// dart format on
