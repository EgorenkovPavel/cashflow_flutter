// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_cashflow_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryCashflowEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryCashflowEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryCashflowEvent()';
}


}

/// @nodoc
class $CategoryCashflowEventCopyWith<$Res>  {
$CategoryCashflowEventCopyWith(CategoryCashflowEvent _, $Res Function(CategoryCashflowEvent) __);
}


/// Adds pattern-matching-related methods to [CategoryCashflowEvent].
extension CategoryCashflowEventPatterns on CategoryCashflowEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ChangeCategoryCashFlowEvent value)?  change,TResult Function( _ChangeCategoriesCategoryCashflowEvent value)?  changeCategories,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeCategoryCashFlowEvent() when change != null:
return change(_that);case _ChangeCategoriesCategoryCashflowEvent() when changeCategories != null:
return changeCategories(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ChangeCategoryCashFlowEvent value)  change,required TResult Function( _ChangeCategoriesCategoryCashflowEvent value)  changeCategories,}){
final _that = this;
switch (_that) {
case _ChangeCategoryCashFlowEvent():
return change(_that);case _ChangeCategoriesCategoryCashflowEvent():
return changeCategories(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ChangeCategoryCashFlowEvent value)?  change,TResult? Function( _ChangeCategoriesCategoryCashflowEvent value)?  changeCategories,}){
final _that = this;
switch (_that) {
case _ChangeCategoryCashFlowEvent() when change != null:
return change(_that);case _ChangeCategoriesCategoryCashflowEvent() when changeCategories != null:
return changeCategories(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<CategoryCashFlow> cashFlows)?  change,TResult Function( List<Category> categories)?  changeCategories,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeCategoryCashFlowEvent() when change != null:
return change(_that.cashFlows);case _ChangeCategoriesCategoryCashflowEvent() when changeCategories != null:
return changeCategories(_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<CategoryCashFlow> cashFlows)  change,required TResult Function( List<Category> categories)  changeCategories,}) {final _that = this;
switch (_that) {
case _ChangeCategoryCashFlowEvent():
return change(_that.cashFlows);case _ChangeCategoriesCategoryCashflowEvent():
return changeCategories(_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<CategoryCashFlow> cashFlows)?  change,TResult? Function( List<Category> categories)?  changeCategories,}) {final _that = this;
switch (_that) {
case _ChangeCategoryCashFlowEvent() when change != null:
return change(_that.cashFlows);case _ChangeCategoriesCategoryCashflowEvent() when changeCategories != null:
return changeCategories(_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class _ChangeCategoryCashFlowEvent implements CategoryCashflowEvent {
  const _ChangeCategoryCashFlowEvent({required final  List<CategoryCashFlow> cashFlows}): _cashFlows = cashFlows;
  

 final  List<CategoryCashFlow> _cashFlows;
 List<CategoryCashFlow> get cashFlows {
  if (_cashFlows is EqualUnmodifiableListView) return _cashFlows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cashFlows);
}


/// Create a copy of CategoryCashflowEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeCategoryCashFlowEventCopyWith<_ChangeCategoryCashFlowEvent> get copyWith => __$ChangeCategoryCashFlowEventCopyWithImpl<_ChangeCategoryCashFlowEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeCategoryCashFlowEvent&&const DeepCollectionEquality().equals(other._cashFlows, _cashFlows));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cashFlows));

@override
String toString() {
  return 'CategoryCashflowEvent.change(cashFlows: $cashFlows)';
}


}

/// @nodoc
abstract mixin class _$ChangeCategoryCashFlowEventCopyWith<$Res> implements $CategoryCashflowEventCopyWith<$Res> {
  factory _$ChangeCategoryCashFlowEventCopyWith(_ChangeCategoryCashFlowEvent value, $Res Function(_ChangeCategoryCashFlowEvent) _then) = __$ChangeCategoryCashFlowEventCopyWithImpl;
@useResult
$Res call({
 List<CategoryCashFlow> cashFlows
});




}
/// @nodoc
class __$ChangeCategoryCashFlowEventCopyWithImpl<$Res>
    implements _$ChangeCategoryCashFlowEventCopyWith<$Res> {
  __$ChangeCategoryCashFlowEventCopyWithImpl(this._self, this._then);

  final _ChangeCategoryCashFlowEvent _self;
  final $Res Function(_ChangeCategoryCashFlowEvent) _then;

/// Create a copy of CategoryCashflowEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cashFlows = null,}) {
  return _then(_ChangeCategoryCashFlowEvent(
cashFlows: null == cashFlows ? _self._cashFlows : cashFlows // ignore: cast_nullable_to_non_nullable
as List<CategoryCashFlow>,
  ));
}


}

/// @nodoc


class _ChangeCategoriesCategoryCashflowEvent implements CategoryCashflowEvent {
  const _ChangeCategoriesCategoryCashflowEvent({required final  List<Category> categories}): _categories = categories;
  

 final  List<Category> _categories;
 List<Category> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of CategoryCashflowEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeCategoriesCategoryCashflowEventCopyWith<_ChangeCategoriesCategoryCashflowEvent> get copyWith => __$ChangeCategoriesCategoryCashflowEventCopyWithImpl<_ChangeCategoriesCategoryCashflowEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeCategoriesCategoryCashflowEvent&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'CategoryCashflowEvent.changeCategories(categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$ChangeCategoriesCategoryCashflowEventCopyWith<$Res> implements $CategoryCashflowEventCopyWith<$Res> {
  factory _$ChangeCategoriesCategoryCashflowEventCopyWith(_ChangeCategoriesCategoryCashflowEvent value, $Res Function(_ChangeCategoriesCategoryCashflowEvent) _then) = __$ChangeCategoriesCategoryCashflowEventCopyWithImpl;
@useResult
$Res call({
 List<Category> categories
});




}
/// @nodoc
class __$ChangeCategoriesCategoryCashflowEventCopyWithImpl<$Res>
    implements _$ChangeCategoriesCategoryCashflowEventCopyWith<$Res> {
  __$ChangeCategoriesCategoryCashflowEventCopyWithImpl(this._self, this._then);

  final _ChangeCategoriesCategoryCashflowEvent _self;
  final $Res Function(_ChangeCategoriesCategoryCashflowEvent) _then;

/// Create a copy of CategoryCashflowEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categories = null,}) {
  return _then(_ChangeCategoriesCategoryCashflowEvent(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,
  ));
}


}

/// @nodoc
mixin _$CategoryCashflowState {

 List<CategoryCashFlow> get cashflows; List<Category> get categories;
/// Create a copy of CategoryCashflowState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCashflowStateCopyWith<CategoryCashflowState> get copyWith => _$CategoryCashflowStateCopyWithImpl<CategoryCashflowState>(this as CategoryCashflowState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryCashflowState&&const DeepCollectionEquality().equals(other.cashflows, cashflows)&&const DeepCollectionEquality().equals(other.categories, categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cashflows),const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'CategoryCashflowState(cashflows: $cashflows, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $CategoryCashflowStateCopyWith<$Res>  {
  factory $CategoryCashflowStateCopyWith(CategoryCashflowState value, $Res Function(CategoryCashflowState) _then) = _$CategoryCashflowStateCopyWithImpl;
@useResult
$Res call({
 List<CategoryCashFlow> cashflows, List<Category> categories
});




}
/// @nodoc
class _$CategoryCashflowStateCopyWithImpl<$Res>
    implements $CategoryCashflowStateCopyWith<$Res> {
  _$CategoryCashflowStateCopyWithImpl(this._self, this._then);

  final CategoryCashflowState _self;
  final $Res Function(CategoryCashflowState) _then;

/// Create a copy of CategoryCashflowState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cashflows = null,Object? categories = null,}) {
  return _then(_self.copyWith(
cashflows: null == cashflows ? _self.cashflows : cashflows // ignore: cast_nullable_to_non_nullable
as List<CategoryCashFlow>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryCashflowState].
extension CategoryCashflowStatePatterns on CategoryCashflowState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryCashflowState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryCashflowState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryCashflowState value)  $default,){
final _that = this;
switch (_that) {
case _CategoryCashflowState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryCashflowState value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryCashflowState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CategoryCashFlow> cashflows,  List<Category> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryCashflowState() when $default != null:
return $default(_that.cashflows,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CategoryCashFlow> cashflows,  List<Category> categories)  $default,) {final _that = this;
switch (_that) {
case _CategoryCashflowState():
return $default(_that.cashflows,_that.categories);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CategoryCashFlow> cashflows,  List<Category> categories)?  $default,) {final _that = this;
switch (_that) {
case _CategoryCashflowState() when $default != null:
return $default(_that.cashflows,_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryCashflowState extends CategoryCashflowState {
  const _CategoryCashflowState({required final  List<CategoryCashFlow> cashflows, required final  List<Category> categories}): _cashflows = cashflows,_categories = categories,super._();
  

 final  List<CategoryCashFlow> _cashflows;
@override List<CategoryCashFlow> get cashflows {
  if (_cashflows is EqualUnmodifiableListView) return _cashflows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cashflows);
}

 final  List<Category> _categories;
@override List<Category> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of CategoryCashflowState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCashflowStateCopyWith<_CategoryCashflowState> get copyWith => __$CategoryCashflowStateCopyWithImpl<_CategoryCashflowState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryCashflowState&&const DeepCollectionEquality().equals(other._cashflows, _cashflows)&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cashflows),const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'CategoryCashflowState(cashflows: $cashflows, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$CategoryCashflowStateCopyWith<$Res> implements $CategoryCashflowStateCopyWith<$Res> {
  factory _$CategoryCashflowStateCopyWith(_CategoryCashflowState value, $Res Function(_CategoryCashflowState) _then) = __$CategoryCashflowStateCopyWithImpl;
@override @useResult
$Res call({
 List<CategoryCashFlow> cashflows, List<Category> categories
});




}
/// @nodoc
class __$CategoryCashflowStateCopyWithImpl<$Res>
    implements _$CategoryCashflowStateCopyWith<$Res> {
  __$CategoryCashflowStateCopyWithImpl(this._self, this._then);

  final _CategoryCashflowState _self;
  final $Res Function(_CategoryCashflowState) _then;

/// Create a copy of CategoryCashflowState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cashflows = null,Object? categories = null,}) {
  return _then(_CategoryCashflowState(
cashflows: null == cashflows ? _self._cashflows : cashflows // ignore: cast_nullable_to_non_nullable
as List<CategoryCashFlow>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,
  ));
}


}

// dart format on
