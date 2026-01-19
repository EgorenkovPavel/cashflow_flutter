// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_input_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryInputEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryInputEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryInputEvent()';
}


}

/// @nodoc
class $CategoryInputEventCopyWith<$Res>  {
$CategoryInputEventCopyWith(CategoryInputEvent _, $Res Function(CategoryInputEvent) __);
}


/// Adds pattern-matching-related methods to [CategoryInputEvent].
extension CategoryInputEventPatterns on CategoryInputEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitByTypeCategoryInputEvent value)?  initByType,TResult Function( _InitByIdCategoryInputEvent value)?  initById,TResult Function( _ChangeTitleCategoryInputEvent value)?  changeTitle,TResult Function( _ChangeBudgetCategoryInputEvent value)?  changeBudget,TResult Function( _ChangeBudgetTypeCategoryInputEvent value)?  changeBudgetType,TResult Function( _ChangeParentCategoryInputEvent value)?  changeParent,TResult Function( _SaveCategoryInputEvent value)?  save,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitByTypeCategoryInputEvent() when initByType != null:
return initByType(_that);case _InitByIdCategoryInputEvent() when initById != null:
return initById(_that);case _ChangeTitleCategoryInputEvent() when changeTitle != null:
return changeTitle(_that);case _ChangeBudgetCategoryInputEvent() when changeBudget != null:
return changeBudget(_that);case _ChangeBudgetTypeCategoryInputEvent() when changeBudgetType != null:
return changeBudgetType(_that);case _ChangeParentCategoryInputEvent() when changeParent != null:
return changeParent(_that);case _SaveCategoryInputEvent() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitByTypeCategoryInputEvent value)  initByType,required TResult Function( _InitByIdCategoryInputEvent value)  initById,required TResult Function( _ChangeTitleCategoryInputEvent value)  changeTitle,required TResult Function( _ChangeBudgetCategoryInputEvent value)  changeBudget,required TResult Function( _ChangeBudgetTypeCategoryInputEvent value)  changeBudgetType,required TResult Function( _ChangeParentCategoryInputEvent value)  changeParent,required TResult Function( _SaveCategoryInputEvent value)  save,}){
final _that = this;
switch (_that) {
case _InitByTypeCategoryInputEvent():
return initByType(_that);case _InitByIdCategoryInputEvent():
return initById(_that);case _ChangeTitleCategoryInputEvent():
return changeTitle(_that);case _ChangeBudgetCategoryInputEvent():
return changeBudget(_that);case _ChangeBudgetTypeCategoryInputEvent():
return changeBudgetType(_that);case _ChangeParentCategoryInputEvent():
return changeParent(_that);case _SaveCategoryInputEvent():
return save(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitByTypeCategoryInputEvent value)?  initByType,TResult? Function( _InitByIdCategoryInputEvent value)?  initById,TResult? Function( _ChangeTitleCategoryInputEvent value)?  changeTitle,TResult? Function( _ChangeBudgetCategoryInputEvent value)?  changeBudget,TResult? Function( _ChangeBudgetTypeCategoryInputEvent value)?  changeBudgetType,TResult? Function( _ChangeParentCategoryInputEvent value)?  changeParent,TResult? Function( _SaveCategoryInputEvent value)?  save,}){
final _that = this;
switch (_that) {
case _InitByTypeCategoryInputEvent() when initByType != null:
return initByType(_that);case _InitByIdCategoryInputEvent() when initById != null:
return initById(_that);case _ChangeTitleCategoryInputEvent() when changeTitle != null:
return changeTitle(_that);case _ChangeBudgetCategoryInputEvent() when changeBudget != null:
return changeBudget(_that);case _ChangeBudgetTypeCategoryInputEvent() when changeBudgetType != null:
return changeBudgetType(_that);case _ChangeParentCategoryInputEvent() when changeParent != null:
return changeParent(_that);case _SaveCategoryInputEvent() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CategoryType type,  bool isGroup)?  initByType,TResult Function( int categoryId)?  initById,TResult Function( String title)?  changeTitle,TResult Function( int budget)?  changeBudget,TResult Function( BudgetType budgetType)?  changeBudgetType,TResult Function( int? parentId)?  changeParent,TResult Function()?  save,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitByTypeCategoryInputEvent() when initByType != null:
return initByType(_that.type,_that.isGroup);case _InitByIdCategoryInputEvent() when initById != null:
return initById(_that.categoryId);case _ChangeTitleCategoryInputEvent() when changeTitle != null:
return changeTitle(_that.title);case _ChangeBudgetCategoryInputEvent() when changeBudget != null:
return changeBudget(_that.budget);case _ChangeBudgetTypeCategoryInputEvent() when changeBudgetType != null:
return changeBudgetType(_that.budgetType);case _ChangeParentCategoryInputEvent() when changeParent != null:
return changeParent(_that.parentId);case _SaveCategoryInputEvent() when save != null:
return save();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CategoryType type,  bool isGroup)  initByType,required TResult Function( int categoryId)  initById,required TResult Function( String title)  changeTitle,required TResult Function( int budget)  changeBudget,required TResult Function( BudgetType budgetType)  changeBudgetType,required TResult Function( int? parentId)  changeParent,required TResult Function()  save,}) {final _that = this;
switch (_that) {
case _InitByTypeCategoryInputEvent():
return initByType(_that.type,_that.isGroup);case _InitByIdCategoryInputEvent():
return initById(_that.categoryId);case _ChangeTitleCategoryInputEvent():
return changeTitle(_that.title);case _ChangeBudgetCategoryInputEvent():
return changeBudget(_that.budget);case _ChangeBudgetTypeCategoryInputEvent():
return changeBudgetType(_that.budgetType);case _ChangeParentCategoryInputEvent():
return changeParent(_that.parentId);case _SaveCategoryInputEvent():
return save();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CategoryType type,  bool isGroup)?  initByType,TResult? Function( int categoryId)?  initById,TResult? Function( String title)?  changeTitle,TResult? Function( int budget)?  changeBudget,TResult? Function( BudgetType budgetType)?  changeBudgetType,TResult? Function( int? parentId)?  changeParent,TResult? Function()?  save,}) {final _that = this;
switch (_that) {
case _InitByTypeCategoryInputEvent() when initByType != null:
return initByType(_that.type,_that.isGroup);case _InitByIdCategoryInputEvent() when initById != null:
return initById(_that.categoryId);case _ChangeTitleCategoryInputEvent() when changeTitle != null:
return changeTitle(_that.title);case _ChangeBudgetCategoryInputEvent() when changeBudget != null:
return changeBudget(_that.budget);case _ChangeBudgetTypeCategoryInputEvent() when changeBudgetType != null:
return changeBudgetType(_that.budgetType);case _ChangeParentCategoryInputEvent() when changeParent != null:
return changeParent(_that.parentId);case _SaveCategoryInputEvent() when save != null:
return save();case _:
  return null;

}
}

}

/// @nodoc


class _InitByTypeCategoryInputEvent implements CategoryInputEvent {
  const _InitByTypeCategoryInputEvent({required this.type, required this.isGroup});
  

 final  CategoryType type;
 final  bool isGroup;

/// Create a copy of CategoryInputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitByTypeCategoryInputEventCopyWith<_InitByTypeCategoryInputEvent> get copyWith => __$InitByTypeCategoryInputEventCopyWithImpl<_InitByTypeCategoryInputEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitByTypeCategoryInputEvent&&(identical(other.type, type) || other.type == type)&&(identical(other.isGroup, isGroup) || other.isGroup == isGroup));
}


@override
int get hashCode => Object.hash(runtimeType,type,isGroup);

@override
String toString() {
  return 'CategoryInputEvent.initByType(type: $type, isGroup: $isGroup)';
}


}

/// @nodoc
abstract mixin class _$InitByTypeCategoryInputEventCopyWith<$Res> implements $CategoryInputEventCopyWith<$Res> {
  factory _$InitByTypeCategoryInputEventCopyWith(_InitByTypeCategoryInputEvent value, $Res Function(_InitByTypeCategoryInputEvent) _then) = __$InitByTypeCategoryInputEventCopyWithImpl;
@useResult
$Res call({
 CategoryType type, bool isGroup
});




}
/// @nodoc
class __$InitByTypeCategoryInputEventCopyWithImpl<$Res>
    implements _$InitByTypeCategoryInputEventCopyWith<$Res> {
  __$InitByTypeCategoryInputEventCopyWithImpl(this._self, this._then);

  final _InitByTypeCategoryInputEvent _self;
  final $Res Function(_InitByTypeCategoryInputEvent) _then;

/// Create a copy of CategoryInputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,Object? isGroup = null,}) {
  return _then(_InitByTypeCategoryInputEvent(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,isGroup: null == isGroup ? _self.isGroup : isGroup // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _InitByIdCategoryInputEvent implements CategoryInputEvent {
  const _InitByIdCategoryInputEvent({required this.categoryId});
  

 final  int categoryId;

/// Create a copy of CategoryInputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitByIdCategoryInputEventCopyWith<_InitByIdCategoryInputEvent> get copyWith => __$InitByIdCategoryInputEventCopyWithImpl<_InitByIdCategoryInputEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitByIdCategoryInputEvent&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId);

@override
String toString() {
  return 'CategoryInputEvent.initById(categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$InitByIdCategoryInputEventCopyWith<$Res> implements $CategoryInputEventCopyWith<$Res> {
  factory _$InitByIdCategoryInputEventCopyWith(_InitByIdCategoryInputEvent value, $Res Function(_InitByIdCategoryInputEvent) _then) = __$InitByIdCategoryInputEventCopyWithImpl;
@useResult
$Res call({
 int categoryId
});




}
/// @nodoc
class __$InitByIdCategoryInputEventCopyWithImpl<$Res>
    implements _$InitByIdCategoryInputEventCopyWith<$Res> {
  __$InitByIdCategoryInputEventCopyWithImpl(this._self, this._then);

  final _InitByIdCategoryInputEvent _self;
  final $Res Function(_InitByIdCategoryInputEvent) _then;

/// Create a copy of CategoryInputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,}) {
  return _then(_InitByIdCategoryInputEvent(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ChangeTitleCategoryInputEvent implements CategoryInputEvent {
  const _ChangeTitleCategoryInputEvent({required this.title});
  

 final  String title;

/// Create a copy of CategoryInputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeTitleCategoryInputEventCopyWith<_ChangeTitleCategoryInputEvent> get copyWith => __$ChangeTitleCategoryInputEventCopyWithImpl<_ChangeTitleCategoryInputEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeTitleCategoryInputEvent&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'CategoryInputEvent.changeTitle(title: $title)';
}


}

/// @nodoc
abstract mixin class _$ChangeTitleCategoryInputEventCopyWith<$Res> implements $CategoryInputEventCopyWith<$Res> {
  factory _$ChangeTitleCategoryInputEventCopyWith(_ChangeTitleCategoryInputEvent value, $Res Function(_ChangeTitleCategoryInputEvent) _then) = __$ChangeTitleCategoryInputEventCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class __$ChangeTitleCategoryInputEventCopyWithImpl<$Res>
    implements _$ChangeTitleCategoryInputEventCopyWith<$Res> {
  __$ChangeTitleCategoryInputEventCopyWithImpl(this._self, this._then);

  final _ChangeTitleCategoryInputEvent _self;
  final $Res Function(_ChangeTitleCategoryInputEvent) _then;

/// Create a copy of CategoryInputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(_ChangeTitleCategoryInputEvent(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ChangeBudgetCategoryInputEvent implements CategoryInputEvent {
  const _ChangeBudgetCategoryInputEvent({required this.budget});
  

 final  int budget;

/// Create a copy of CategoryInputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeBudgetCategoryInputEventCopyWith<_ChangeBudgetCategoryInputEvent> get copyWith => __$ChangeBudgetCategoryInputEventCopyWithImpl<_ChangeBudgetCategoryInputEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeBudgetCategoryInputEvent&&(identical(other.budget, budget) || other.budget == budget));
}


@override
int get hashCode => Object.hash(runtimeType,budget);

@override
String toString() {
  return 'CategoryInputEvent.changeBudget(budget: $budget)';
}


}

/// @nodoc
abstract mixin class _$ChangeBudgetCategoryInputEventCopyWith<$Res> implements $CategoryInputEventCopyWith<$Res> {
  factory _$ChangeBudgetCategoryInputEventCopyWith(_ChangeBudgetCategoryInputEvent value, $Res Function(_ChangeBudgetCategoryInputEvent) _then) = __$ChangeBudgetCategoryInputEventCopyWithImpl;
@useResult
$Res call({
 int budget
});




}
/// @nodoc
class __$ChangeBudgetCategoryInputEventCopyWithImpl<$Res>
    implements _$ChangeBudgetCategoryInputEventCopyWith<$Res> {
  __$ChangeBudgetCategoryInputEventCopyWithImpl(this._self, this._then);

  final _ChangeBudgetCategoryInputEvent _self;
  final $Res Function(_ChangeBudgetCategoryInputEvent) _then;

/// Create a copy of CategoryInputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? budget = null,}) {
  return _then(_ChangeBudgetCategoryInputEvent(
budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ChangeBudgetTypeCategoryInputEvent implements CategoryInputEvent {
  const _ChangeBudgetTypeCategoryInputEvent({required this.budgetType});
  

 final  BudgetType budgetType;

/// Create a copy of CategoryInputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeBudgetTypeCategoryInputEventCopyWith<_ChangeBudgetTypeCategoryInputEvent> get copyWith => __$ChangeBudgetTypeCategoryInputEventCopyWithImpl<_ChangeBudgetTypeCategoryInputEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeBudgetTypeCategoryInputEvent&&(identical(other.budgetType, budgetType) || other.budgetType == budgetType));
}


@override
int get hashCode => Object.hash(runtimeType,budgetType);

@override
String toString() {
  return 'CategoryInputEvent.changeBudgetType(budgetType: $budgetType)';
}


}

/// @nodoc
abstract mixin class _$ChangeBudgetTypeCategoryInputEventCopyWith<$Res> implements $CategoryInputEventCopyWith<$Res> {
  factory _$ChangeBudgetTypeCategoryInputEventCopyWith(_ChangeBudgetTypeCategoryInputEvent value, $Res Function(_ChangeBudgetTypeCategoryInputEvent) _then) = __$ChangeBudgetTypeCategoryInputEventCopyWithImpl;
@useResult
$Res call({
 BudgetType budgetType
});




}
/// @nodoc
class __$ChangeBudgetTypeCategoryInputEventCopyWithImpl<$Res>
    implements _$ChangeBudgetTypeCategoryInputEventCopyWith<$Res> {
  __$ChangeBudgetTypeCategoryInputEventCopyWithImpl(this._self, this._then);

  final _ChangeBudgetTypeCategoryInputEvent _self;
  final $Res Function(_ChangeBudgetTypeCategoryInputEvent) _then;

/// Create a copy of CategoryInputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? budgetType = null,}) {
  return _then(_ChangeBudgetTypeCategoryInputEvent(
budgetType: null == budgetType ? _self.budgetType : budgetType // ignore: cast_nullable_to_non_nullable
as BudgetType,
  ));
}


}

/// @nodoc


class _ChangeParentCategoryInputEvent implements CategoryInputEvent {
  const _ChangeParentCategoryInputEvent({required this.parentId});
  

 final  int? parentId;

/// Create a copy of CategoryInputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeParentCategoryInputEventCopyWith<_ChangeParentCategoryInputEvent> get copyWith => __$ChangeParentCategoryInputEventCopyWithImpl<_ChangeParentCategoryInputEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeParentCategoryInputEvent&&(identical(other.parentId, parentId) || other.parentId == parentId));
}


@override
int get hashCode => Object.hash(runtimeType,parentId);

@override
String toString() {
  return 'CategoryInputEvent.changeParent(parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class _$ChangeParentCategoryInputEventCopyWith<$Res> implements $CategoryInputEventCopyWith<$Res> {
  factory _$ChangeParentCategoryInputEventCopyWith(_ChangeParentCategoryInputEvent value, $Res Function(_ChangeParentCategoryInputEvent) _then) = __$ChangeParentCategoryInputEventCopyWithImpl;
@useResult
$Res call({
 int? parentId
});




}
/// @nodoc
class __$ChangeParentCategoryInputEventCopyWithImpl<$Res>
    implements _$ChangeParentCategoryInputEventCopyWith<$Res> {
  __$ChangeParentCategoryInputEventCopyWithImpl(this._self, this._then);

  final _ChangeParentCategoryInputEvent _self;
  final $Res Function(_ChangeParentCategoryInputEvent) _then;

/// Create a copy of CategoryInputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? parentId = freezed,}) {
  return _then(_ChangeParentCategoryInputEvent(
parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _SaveCategoryInputEvent implements CategoryInputEvent {
  const _SaveCategoryInputEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveCategoryInputEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryInputEvent.save()';
}


}




/// @nodoc
mixin _$CategoryInputState {

 InvalidType get category; CategoryType get type; String get title; bool get isSaved;
/// Create a copy of CategoryInputState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryInputStateCopyWith<CategoryInputState> get copyWith => _$CategoryInputStateCopyWithImpl<CategoryInputState>(this as CategoryInputState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryInputState&&const DeepCollectionEquality().equals(other.category, category)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(category),type,title,isSaved);

@override
String toString() {
  return 'CategoryInputState(category: $category, type: $type, title: $title, isSaved: $isSaved)';
}


}

/// @nodoc
abstract mixin class $CategoryInputStateCopyWith<$Res>  {
  factory $CategoryInputStateCopyWith(CategoryInputState value, $Res Function(CategoryInputState) _then) = _$CategoryInputStateCopyWithImpl;
@useResult
$Res call({
 InvalidType category, CategoryType type, String title, bool isSaved
});




}
/// @nodoc
class _$CategoryInputStateCopyWithImpl<$Res>
    implements $CategoryInputStateCopyWith<$Res> {
  _$CategoryInputStateCopyWithImpl(this._self, this._then);

  final CategoryInputState _self;
  final $Res Function(CategoryInputState) _then;

/// Create a copy of CategoryInputState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = freezed,Object? type = null,Object? title = null,Object? isSaved = null,}) {
  return _then(_self.copyWith(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as InvalidType,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryInputState].
extension CategoryInputStatePatterns on CategoryInputState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ItemCategoryInputState value)?  item,TResult Function( _GroupCategoryInputState value)?  group,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemCategoryInputState() when item != null:
return item(_that);case _GroupCategoryInputState() when group != null:
return group(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ItemCategoryInputState value)  item,required TResult Function( _GroupCategoryInputState value)  group,}){
final _that = this;
switch (_that) {
case _ItemCategoryInputState():
return item(_that);case _GroupCategoryInputState():
return group(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ItemCategoryInputState value)?  item,TResult? Function( _GroupCategoryInputState value)?  group,}){
final _that = this;
switch (_that) {
case _ItemCategoryInputState() when item != null:
return item(_that);case _GroupCategoryInputState() when group != null:
return group(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CategoryItem? category,  CategoryType type,  BudgetType budgetType,  String title,  int budget,  int? parent,  bool isSaved)?  item,TResult Function( CategoryGroup? category,  CategoryType type,  String title,  bool isSaved)?  group,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemCategoryInputState() when item != null:
return item(_that.category,_that.type,_that.budgetType,_that.title,_that.budget,_that.parent,_that.isSaved);case _GroupCategoryInputState() when group != null:
return group(_that.category,_that.type,_that.title,_that.isSaved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CategoryItem? category,  CategoryType type,  BudgetType budgetType,  String title,  int budget,  int? parent,  bool isSaved)  item,required TResult Function( CategoryGroup? category,  CategoryType type,  String title,  bool isSaved)  group,}) {final _that = this;
switch (_that) {
case _ItemCategoryInputState():
return item(_that.category,_that.type,_that.budgetType,_that.title,_that.budget,_that.parent,_that.isSaved);case _GroupCategoryInputState():
return group(_that.category,_that.type,_that.title,_that.isSaved);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CategoryItem? category,  CategoryType type,  BudgetType budgetType,  String title,  int budget,  int? parent,  bool isSaved)?  item,TResult? Function( CategoryGroup? category,  CategoryType type,  String title,  bool isSaved)?  group,}) {final _that = this;
switch (_that) {
case _ItemCategoryInputState() when item != null:
return item(_that.category,_that.type,_that.budgetType,_that.title,_that.budget,_that.parent,_that.isSaved);case _GroupCategoryInputState() when group != null:
return group(_that.category,_that.type,_that.title,_that.isSaved);case _:
  return null;

}
}

}

/// @nodoc


class _ItemCategoryInputState extends CategoryInputState {
  const _ItemCategoryInputState({this.category, required this.type, required this.budgetType, required this.title, required this.budget, required this.parent, required this.isSaved}): super._();
  

@override final  CategoryItem? category;
@override final  CategoryType type;
 final  BudgetType budgetType;
@override final  String title;
 final  int budget;
 final  int? parent;
@override final  bool isSaved;

/// Create a copy of CategoryInputState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemCategoryInputStateCopyWith<_ItemCategoryInputState> get copyWith => __$ItemCategoryInputStateCopyWithImpl<_ItemCategoryInputState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemCategoryInputState&&const DeepCollectionEquality().equals(other.category, category)&&(identical(other.type, type) || other.type == type)&&(identical(other.budgetType, budgetType) || other.budgetType == budgetType)&&(identical(other.title, title) || other.title == title)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.parent, parent) || other.parent == parent)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(category),type,budgetType,title,budget,parent,isSaved);

@override
String toString() {
  return 'CategoryInputState.item(category: $category, type: $type, budgetType: $budgetType, title: $title, budget: $budget, parent: $parent, isSaved: $isSaved)';
}


}

/// @nodoc
abstract mixin class _$ItemCategoryInputStateCopyWith<$Res> implements $CategoryInputStateCopyWith<$Res> {
  factory _$ItemCategoryInputStateCopyWith(_ItemCategoryInputState value, $Res Function(_ItemCategoryInputState) _then) = __$ItemCategoryInputStateCopyWithImpl;
@override @useResult
$Res call({
 CategoryItem? category, CategoryType type, BudgetType budgetType, String title, int budget, int? parent, bool isSaved
});




}
/// @nodoc
class __$ItemCategoryInputStateCopyWithImpl<$Res>
    implements _$ItemCategoryInputStateCopyWith<$Res> {
  __$ItemCategoryInputStateCopyWithImpl(this._self, this._then);

  final _ItemCategoryInputState _self;
  final $Res Function(_ItemCategoryInputState) _then;

/// Create a copy of CategoryInputState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = freezed,Object? type = null,Object? budgetType = null,Object? title = null,Object? budget = null,Object? parent = freezed,Object? isSaved = null,}) {
  return _then(_ItemCategoryInputState(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryItem?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,budgetType: null == budgetType ? _self.budgetType : budgetType // ignore: cast_nullable_to_non_nullable
as BudgetType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as int,parent: freezed == parent ? _self.parent : parent // ignore: cast_nullable_to_non_nullable
as int?,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _GroupCategoryInputState extends CategoryInputState {
  const _GroupCategoryInputState({this.category, required this.type, required this.title, required this.isSaved}): super._();
  

@override final  CategoryGroup? category;
@override final  CategoryType type;
@override final  String title;
@override final  bool isSaved;

/// Create a copy of CategoryInputState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupCategoryInputStateCopyWith<_GroupCategoryInputState> get copyWith => __$GroupCategoryInputStateCopyWithImpl<_GroupCategoryInputState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupCategoryInputState&&const DeepCollectionEquality().equals(other.category, category)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(category),type,title,isSaved);

@override
String toString() {
  return 'CategoryInputState.group(category: $category, type: $type, title: $title, isSaved: $isSaved)';
}


}

/// @nodoc
abstract mixin class _$GroupCategoryInputStateCopyWith<$Res> implements $CategoryInputStateCopyWith<$Res> {
  factory _$GroupCategoryInputStateCopyWith(_GroupCategoryInputState value, $Res Function(_GroupCategoryInputState) _then) = __$GroupCategoryInputStateCopyWithImpl;
@override @useResult
$Res call({
 CategoryGroup? category, CategoryType type, String title, bool isSaved
});




}
/// @nodoc
class __$GroupCategoryInputStateCopyWithImpl<$Res>
    implements _$GroupCategoryInputStateCopyWith<$Res> {
  __$GroupCategoryInputStateCopyWithImpl(this._self, this._then);

  final _GroupCategoryInputState _self;
  final $Res Function(_GroupCategoryInputState) _then;

/// Create a copy of CategoryInputState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = freezed,Object? type = null,Object? title = null,Object? isSaved = null,}) {
  return _then(_GroupCategoryInputState(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryGroup?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
