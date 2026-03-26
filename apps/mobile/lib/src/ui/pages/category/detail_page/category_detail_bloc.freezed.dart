// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryDetailEvent()';
}


}

/// @nodoc
class $CategoryDetailEventCopyWith<$Res>  {
$CategoryDetailEventCopyWith(CategoryDetailEvent _, $Res Function(CategoryDetailEvent) __);
}


/// Adds pattern-matching-related methods to [CategoryDetailEvent].
extension CategoryDetailEventPatterns on CategoryDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchCategoryDetailEvent value)?  fetch,TResult Function( _ChangeCategoryCategoryDetailEvent value)?  changeCategory,TResult Function( _ChangeOperationsCategoryDetailEvent value)?  changeOperations,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchCategoryDetailEvent() when fetch != null:
return fetch(_that);case _ChangeCategoryCategoryDetailEvent() when changeCategory != null:
return changeCategory(_that);case _ChangeOperationsCategoryDetailEvent() when changeOperations != null:
return changeOperations(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchCategoryDetailEvent value)  fetch,required TResult Function( _ChangeCategoryCategoryDetailEvent value)  changeCategory,required TResult Function( _ChangeOperationsCategoryDetailEvent value)  changeOperations,}){
final _that = this;
switch (_that) {
case _FetchCategoryDetailEvent():
return fetch(_that);case _ChangeCategoryCategoryDetailEvent():
return changeCategory(_that);case _ChangeOperationsCategoryDetailEvent():
return changeOperations(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchCategoryDetailEvent value)?  fetch,TResult? Function( _ChangeCategoryCategoryDetailEvent value)?  changeCategory,TResult? Function( _ChangeOperationsCategoryDetailEvent value)?  changeOperations,}){
final _that = this;
switch (_that) {
case _FetchCategoryDetailEvent() when fetch != null:
return fetch(_that);case _ChangeCategoryCategoryDetailEvent() when changeCategory != null:
return changeCategory(_that);case _ChangeOperationsCategoryDetailEvent() when changeOperations != null:
return changeOperations(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int categoryId)?  fetch,TResult Function( Category category)?  changeCategory,TResult Function( List<OperationView> operations)?  changeOperations,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchCategoryDetailEvent() when fetch != null:
return fetch(_that.categoryId);case _ChangeCategoryCategoryDetailEvent() when changeCategory != null:
return changeCategory(_that.category);case _ChangeOperationsCategoryDetailEvent() when changeOperations != null:
return changeOperations(_that.operations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int categoryId)  fetch,required TResult Function( Category category)  changeCategory,required TResult Function( List<OperationView> operations)  changeOperations,}) {final _that = this;
switch (_that) {
case _FetchCategoryDetailEvent():
return fetch(_that.categoryId);case _ChangeCategoryCategoryDetailEvent():
return changeCategory(_that.category);case _ChangeOperationsCategoryDetailEvent():
return changeOperations(_that.operations);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int categoryId)?  fetch,TResult? Function( Category category)?  changeCategory,TResult? Function( List<OperationView> operations)?  changeOperations,}) {final _that = this;
switch (_that) {
case _FetchCategoryDetailEvent() when fetch != null:
return fetch(_that.categoryId);case _ChangeCategoryCategoryDetailEvent() when changeCategory != null:
return changeCategory(_that.category);case _ChangeOperationsCategoryDetailEvent() when changeOperations != null:
return changeOperations(_that.operations);case _:
  return null;

}
}

}

/// @nodoc


class _FetchCategoryDetailEvent implements CategoryDetailEvent {
  const _FetchCategoryDetailEvent({required this.categoryId});
  

 final  int categoryId;

/// Create a copy of CategoryDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchCategoryDetailEventCopyWith<_FetchCategoryDetailEvent> get copyWith => __$FetchCategoryDetailEventCopyWithImpl<_FetchCategoryDetailEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchCategoryDetailEvent&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'CategoryDetailEvent.fetch(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$FetchCategoryDetailEventCopyWith<$Res> implements $CategoryDetailEventCopyWith<$Res> {
  factory _$FetchCategoryDetailEventCopyWith(_FetchCategoryDetailEvent value, $Res Function(_FetchCategoryDetailEvent) _then) = __$FetchCategoryDetailEventCopyWithImpl;
@useResult
$Res call({
 int categoryId
});




}
/// @nodoc
class __$FetchCategoryDetailEventCopyWithImpl<$Res>
    implements _$FetchCategoryDetailEventCopyWith<$Res> {
  __$FetchCategoryDetailEventCopyWithImpl(this._self, this._then);

  final _FetchCategoryDetailEvent _self;
  final $Res Function(_FetchCategoryDetailEvent) _then;

/// Create a copy of CategoryDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,}) {
  return _then(_FetchCategoryDetailEvent(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ChangeCategoryCategoryDetailEvent implements CategoryDetailEvent {
  const _ChangeCategoryCategoryDetailEvent(this.category);
  

 final  Category category;

/// Create a copy of CategoryDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeCategoryCategoryDetailEventCopyWith<_ChangeCategoryCategoryDetailEvent> get copyWith => __$ChangeCategoryCategoryDetailEventCopyWithImpl<_ChangeCategoryCategoryDetailEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeCategoryCategoryDetailEvent&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'CategoryDetailEvent.changeCategory(category: $category)';
}


}

/// @nodoc
abstract mixin class _$ChangeCategoryCategoryDetailEventCopyWith<$Res> implements $CategoryDetailEventCopyWith<$Res> {
  factory _$ChangeCategoryCategoryDetailEventCopyWith(_ChangeCategoryCategoryDetailEvent value, $Res Function(_ChangeCategoryCategoryDetailEvent) _then) = __$ChangeCategoryCategoryDetailEventCopyWithImpl;
@useResult
$Res call({
 Category category
});


$CategoryCopyWith<$Res> get category;

}
/// @nodoc
class __$ChangeCategoryCategoryDetailEventCopyWithImpl<$Res>
    implements _$ChangeCategoryCategoryDetailEventCopyWith<$Res> {
  __$ChangeCategoryCategoryDetailEventCopyWithImpl(this._self, this._then);

  final _ChangeCategoryCategoryDetailEvent _self;
  final $Res Function(_ChangeCategoryCategoryDetailEvent) _then;

/// Create a copy of CategoryDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_ChangeCategoryCategoryDetailEvent(
null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category,
  ));
}

/// Create a copy of CategoryDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res> get category {
  
  return $CategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

/// @nodoc


class _ChangeOperationsCategoryDetailEvent implements CategoryDetailEvent {
  const _ChangeOperationsCategoryDetailEvent(final  List<OperationView> operations): _operations = operations;
  

 final  List<OperationView> _operations;
 List<OperationView> get operations {
  if (_operations is EqualUnmodifiableListView) return _operations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_operations);
}


/// Create a copy of CategoryDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeOperationsCategoryDetailEventCopyWith<_ChangeOperationsCategoryDetailEvent> get copyWith => __$ChangeOperationsCategoryDetailEventCopyWithImpl<_ChangeOperationsCategoryDetailEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeOperationsCategoryDetailEvent&&const DeepCollectionEquality().equals(other._operations, _operations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_operations));

@override
String toString() {
  return 'CategoryDetailEvent.changeOperations(operations: $operations)';
}


}

/// @nodoc
abstract mixin class _$ChangeOperationsCategoryDetailEventCopyWith<$Res> implements $CategoryDetailEventCopyWith<$Res> {
  factory _$ChangeOperationsCategoryDetailEventCopyWith(_ChangeOperationsCategoryDetailEvent value, $Res Function(_ChangeOperationsCategoryDetailEvent) _then) = __$ChangeOperationsCategoryDetailEventCopyWithImpl;
@useResult
$Res call({
 List<OperationView> operations
});




}
/// @nodoc
class __$ChangeOperationsCategoryDetailEventCopyWithImpl<$Res>
    implements _$ChangeOperationsCategoryDetailEventCopyWith<$Res> {
  __$ChangeOperationsCategoryDetailEventCopyWithImpl(this._self, this._then);

  final _ChangeOperationsCategoryDetailEvent _self;
  final $Res Function(_ChangeOperationsCategoryDetailEvent) _then;

/// Create a copy of CategoryDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? operations = null,}) {
  return _then(_ChangeOperationsCategoryDetailEvent(
null == operations ? _self._operations : operations // ignore: cast_nullable_to_non_nullable
as List<OperationView>,
  ));
}


}

/// @nodoc
mixin _$CategoryDetailState {

 BudgetType get budgetType; String get title; int get budget; List<OperationView> get operations;
/// Create a copy of CategoryDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryDetailStateCopyWith<CategoryDetailState> get copyWith => _$CategoryDetailStateCopyWithImpl<CategoryDetailState>(this as CategoryDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryDetailState&&(identical(other.budgetType, budgetType) || other.budgetType == budgetType)&&(identical(other.title, title) || other.title == title)&&(identical(other.budget, budget) || other.budget == budget)&&const DeepCollectionEquality().equals(other.operations, operations));
}


@override
int get hashCode => Object.hash(runtimeType,budgetType,title,budget,const DeepCollectionEquality().hash(operations));

@override
String toString() {
  return 'CategoryDetailState(budgetType: $budgetType, title: $title, budget: $budget, operations: $operations)';
}


}

/// @nodoc
abstract mixin class $CategoryDetailStateCopyWith<$Res>  {
  factory $CategoryDetailStateCopyWith(CategoryDetailState value, $Res Function(CategoryDetailState) _then) = _$CategoryDetailStateCopyWithImpl;
@useResult
$Res call({
 BudgetType budgetType, String title, int budget, List<OperationView> operations
});




}
/// @nodoc
class _$CategoryDetailStateCopyWithImpl<$Res>
    implements $CategoryDetailStateCopyWith<$Res> {
  _$CategoryDetailStateCopyWithImpl(this._self, this._then);

  final CategoryDetailState _self;
  final $Res Function(CategoryDetailState) _then;

/// Create a copy of CategoryDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? budgetType = null,Object? title = null,Object? budget = null,Object? operations = null,}) {
  return _then(_self.copyWith(
budgetType: null == budgetType ? _self.budgetType : budgetType // ignore: cast_nullable_to_non_nullable
as BudgetType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,operations: null == operations ? _self.operations : operations // ignore: cast_nullable_to_non_nullable
as List<OperationView>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryDetailState].
extension CategoryDetailStatePatterns on CategoryDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryDetailState value)  $default,){
final _that = this;
switch (_that) {
case _CategoryDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BudgetType budgetType,  String title,  int budget,  List<OperationView> operations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryDetailState() when $default != null:
return $default(_that.budgetType,_that.title,_that.budget,_that.operations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BudgetType budgetType,  String title,  int budget,  List<OperationView> operations)  $default,) {final _that = this;
switch (_that) {
case _CategoryDetailState():
return $default(_that.budgetType,_that.title,_that.budget,_that.operations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BudgetType budgetType,  String title,  int budget,  List<OperationView> operations)?  $default,) {final _that = this;
switch (_that) {
case _CategoryDetailState() when $default != null:
return $default(_that.budgetType,_that.title,_that.budget,_that.operations);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryDetailState implements CategoryDetailState {
  const _CategoryDetailState({required this.budgetType, required this.title, required this.budget, required final  List<OperationView> operations}): _operations = operations;
  

@override final  BudgetType budgetType;
@override final  String title;
@override final  int budget;
 final  List<OperationView> _operations;
@override List<OperationView> get operations {
  if (_operations is EqualUnmodifiableListView) return _operations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_operations);
}


/// Create a copy of CategoryDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryDetailStateCopyWith<_CategoryDetailState> get copyWith => __$CategoryDetailStateCopyWithImpl<_CategoryDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryDetailState&&(identical(other.budgetType, budgetType) || other.budgetType == budgetType)&&(identical(other.title, title) || other.title == title)&&(identical(other.budget, budget) || other.budget == budget)&&const DeepCollectionEquality().equals(other._operations, _operations));
}


@override
int get hashCode => Object.hash(runtimeType,budgetType,title,budget,const DeepCollectionEquality().hash(_operations));

@override
String toString() {
  return 'CategoryDetailState(budgetType: $budgetType, title: $title, budget: $budget, operations: $operations)';
}


}

/// @nodoc
abstract mixin class _$CategoryDetailStateCopyWith<$Res> implements $CategoryDetailStateCopyWith<$Res> {
  factory _$CategoryDetailStateCopyWith(_CategoryDetailState value, $Res Function(_CategoryDetailState) _then) = __$CategoryDetailStateCopyWithImpl;
@override @useResult
$Res call({
 BudgetType budgetType, String title, int budget, List<OperationView> operations
});




}
/// @nodoc
class __$CategoryDetailStateCopyWithImpl<$Res>
    implements _$CategoryDetailStateCopyWith<$Res> {
  __$CategoryDetailStateCopyWithImpl(this._self, this._then);

  final _CategoryDetailState _self;
  final $Res Function(_CategoryDetailState) _then;

/// Create a copy of CategoryDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? budgetType = null,Object? title = null,Object? budget = null,Object? operations = null,}) {
  return _then(_CategoryDetailState(
budgetType: null == budgetType ? _self.budgetType : budgetType // ignore: cast_nullable_to_non_nullable
as BudgetType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,operations: null == operations ? _self._operations : operations // ignore: cast_nullable_to_non_nullable
as List<OperationView>,
  ));
}


}

// dart format on
