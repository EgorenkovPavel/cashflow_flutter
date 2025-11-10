// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BudgetEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BudgetEvent()';
}


}

/// @nodoc
class $BudgetEventCopyWith<$Res>  {
$BudgetEventCopyWith(BudgetEvent _, $Res Function(BudgetEvent) __);
}


/// Adds pattern-matching-related methods to [BudgetEvent].
extension BudgetEventPatterns on BudgetEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchBudgetEvent value)?  fetch,TResult Function( _PreviousYearBudgetEvent value)?  previousYear,TResult Function( _NextYearBudgetEvent value)?  nextYear,TResult Function( _ShowAllBudgetEvent value)?  showAll,TResult Function( _ChangeItemsBudgetEvent value)?  changeItems,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchBudgetEvent() when fetch != null:
return fetch(_that);case _PreviousYearBudgetEvent() when previousYear != null:
return previousYear(_that);case _NextYearBudgetEvent() when nextYear != null:
return nextYear(_that);case _ShowAllBudgetEvent() when showAll != null:
return showAll(_that);case _ChangeItemsBudgetEvent() when changeItems != null:
return changeItems(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchBudgetEvent value)  fetch,required TResult Function( _PreviousYearBudgetEvent value)  previousYear,required TResult Function( _NextYearBudgetEvent value)  nextYear,required TResult Function( _ShowAllBudgetEvent value)  showAll,required TResult Function( _ChangeItemsBudgetEvent value)  changeItems,}){
final _that = this;
switch (_that) {
case _FetchBudgetEvent():
return fetch(_that);case _PreviousYearBudgetEvent():
return previousYear(_that);case _NextYearBudgetEvent():
return nextYear(_that);case _ShowAllBudgetEvent():
return showAll(_that);case _ChangeItemsBudgetEvent():
return changeItems(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchBudgetEvent value)?  fetch,TResult? Function( _PreviousYearBudgetEvent value)?  previousYear,TResult? Function( _NextYearBudgetEvent value)?  nextYear,TResult? Function( _ShowAllBudgetEvent value)?  showAll,TResult? Function( _ChangeItemsBudgetEvent value)?  changeItems,}){
final _that = this;
switch (_that) {
case _FetchBudgetEvent() when fetch != null:
return fetch(_that);case _PreviousYearBudgetEvent() when previousYear != null:
return previousYear(_that);case _NextYearBudgetEvent() when nextYear != null:
return nextYear(_that);case _ShowAllBudgetEvent() when showAll != null:
return showAll(_that);case _ChangeItemsBudgetEvent() when changeItems != null:
return changeItems(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( CategoryType type)?  fetch,TResult Function()?  previousYear,TResult Function()?  nextYear,TResult Function( BudgetType budgetType)?  showAll,TResult Function( List<CategoryCashFlow> items)?  changeItems,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchBudgetEvent() when fetch != null:
return fetch(_that.type);case _PreviousYearBudgetEvent() when previousYear != null:
return previousYear();case _NextYearBudgetEvent() when nextYear != null:
return nextYear();case _ShowAllBudgetEvent() when showAll != null:
return showAll(_that.budgetType);case _ChangeItemsBudgetEvent() when changeItems != null:
return changeItems(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( CategoryType type)  fetch,required TResult Function()  previousYear,required TResult Function()  nextYear,required TResult Function( BudgetType budgetType)  showAll,required TResult Function( List<CategoryCashFlow> items)  changeItems,}) {final _that = this;
switch (_that) {
case _FetchBudgetEvent():
return fetch(_that.type);case _PreviousYearBudgetEvent():
return previousYear();case _NextYearBudgetEvent():
return nextYear();case _ShowAllBudgetEvent():
return showAll(_that.budgetType);case _ChangeItemsBudgetEvent():
return changeItems(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( CategoryType type)?  fetch,TResult? Function()?  previousYear,TResult? Function()?  nextYear,TResult? Function( BudgetType budgetType)?  showAll,TResult? Function( List<CategoryCashFlow> items)?  changeItems,}) {final _that = this;
switch (_that) {
case _FetchBudgetEvent() when fetch != null:
return fetch(_that.type);case _PreviousYearBudgetEvent() when previousYear != null:
return previousYear();case _NextYearBudgetEvent() when nextYear != null:
return nextYear();case _ShowAllBudgetEvent() when showAll != null:
return showAll(_that.budgetType);case _ChangeItemsBudgetEvent() when changeItems != null:
return changeItems(_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _FetchBudgetEvent implements BudgetEvent {
  const _FetchBudgetEvent({required this.type});
  

 final  CategoryType type;

/// Create a copy of BudgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchBudgetEventCopyWith<_FetchBudgetEvent> get copyWith => __$FetchBudgetEventCopyWithImpl<_FetchBudgetEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchBudgetEvent&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,type);

@override
String toString() {
  return 'BudgetEvent.fetch(type: $type)';
}


}

/// @nodoc
abstract mixin class _$FetchBudgetEventCopyWith<$Res> implements $BudgetEventCopyWith<$Res> {
  factory _$FetchBudgetEventCopyWith(_FetchBudgetEvent value, $Res Function(_FetchBudgetEvent) _then) = __$FetchBudgetEventCopyWithImpl;
@useResult
$Res call({
 CategoryType type
});




}
/// @nodoc
class __$FetchBudgetEventCopyWithImpl<$Res>
    implements _$FetchBudgetEventCopyWith<$Res> {
  __$FetchBudgetEventCopyWithImpl(this._self, this._then);

  final _FetchBudgetEvent _self;
  final $Res Function(_FetchBudgetEvent) _then;

/// Create a copy of BudgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,}) {
  return _then(_FetchBudgetEvent(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,
  ));
}


}

/// @nodoc


class _PreviousYearBudgetEvent implements BudgetEvent {
  const _PreviousYearBudgetEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreviousYearBudgetEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BudgetEvent.previousYear()';
}


}




/// @nodoc


class _NextYearBudgetEvent implements BudgetEvent {
  const _NextYearBudgetEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextYearBudgetEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BudgetEvent.nextYear()';
}


}




/// @nodoc


class _ShowAllBudgetEvent implements BudgetEvent {
  const _ShowAllBudgetEvent({required this.budgetType});
  

 final  BudgetType budgetType;

/// Create a copy of BudgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShowAllBudgetEventCopyWith<_ShowAllBudgetEvent> get copyWith => __$ShowAllBudgetEventCopyWithImpl<_ShowAllBudgetEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowAllBudgetEvent&&(identical(other.budgetType, budgetType) || other.budgetType == budgetType));
}


@override
int get hashCode => Object.hash(runtimeType,budgetType);

@override
String toString() {
  return 'BudgetEvent.showAll(budgetType: $budgetType)';
}


}

/// @nodoc
abstract mixin class _$ShowAllBudgetEventCopyWith<$Res> implements $BudgetEventCopyWith<$Res> {
  factory _$ShowAllBudgetEventCopyWith(_ShowAllBudgetEvent value, $Res Function(_ShowAllBudgetEvent) _then) = __$ShowAllBudgetEventCopyWithImpl;
@useResult
$Res call({
 BudgetType budgetType
});




}
/// @nodoc
class __$ShowAllBudgetEventCopyWithImpl<$Res>
    implements _$ShowAllBudgetEventCopyWith<$Res> {
  __$ShowAllBudgetEventCopyWithImpl(this._self, this._then);

  final _ShowAllBudgetEvent _self;
  final $Res Function(_ShowAllBudgetEvent) _then;

/// Create a copy of BudgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? budgetType = null,}) {
  return _then(_ShowAllBudgetEvent(
budgetType: null == budgetType ? _self.budgetType : budgetType // ignore: cast_nullable_to_non_nullable
as BudgetType,
  ));
}


}

/// @nodoc


class _ChangeItemsBudgetEvent implements BudgetEvent {
  const _ChangeItemsBudgetEvent({required final  List<CategoryCashFlow> items}): _items = items;
  

 final  List<CategoryCashFlow> _items;
 List<CategoryCashFlow> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of BudgetEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeItemsBudgetEventCopyWith<_ChangeItemsBudgetEvent> get copyWith => __$ChangeItemsBudgetEventCopyWithImpl<_ChangeItemsBudgetEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeItemsBudgetEvent&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'BudgetEvent.changeItems(items: $items)';
}


}

/// @nodoc
abstract mixin class _$ChangeItemsBudgetEventCopyWith<$Res> implements $BudgetEventCopyWith<$Res> {
  factory _$ChangeItemsBudgetEventCopyWith(_ChangeItemsBudgetEvent value, $Res Function(_ChangeItemsBudgetEvent) _then) = __$ChangeItemsBudgetEventCopyWithImpl;
@useResult
$Res call({
 List<CategoryCashFlow> items
});




}
/// @nodoc
class __$ChangeItemsBudgetEventCopyWithImpl<$Res>
    implements _$ChangeItemsBudgetEventCopyWith<$Res> {
  __$ChangeItemsBudgetEventCopyWithImpl(this._self, this._then);

  final _ChangeItemsBudgetEvent _self;
  final $Res Function(_ChangeItemsBudgetEvent) _then;

/// Create a copy of BudgetEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_ChangeItemsBudgetEvent(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CategoryCashFlow>,
  ));
}


}

/// @nodoc
mixin _$BudgetState {

 DateTime get date; CategoryType get type; List<CategoryCashFlow> get itemsMonthBudget; List<CategoryCashFlow> get itemsYearBudget; List<CategoryCashFlow> get itemsAll; bool get showAllMonthBudget; bool get showAllYearBudget;
/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetStateCopyWith<BudgetState> get copyWith => _$BudgetStateCopyWithImpl<BudgetState>(this as BudgetState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetState&&(identical(other.date, date) || other.date == date)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.itemsMonthBudget, itemsMonthBudget)&&const DeepCollectionEquality().equals(other.itemsYearBudget, itemsYearBudget)&&const DeepCollectionEquality().equals(other.itemsAll, itemsAll)&&(identical(other.showAllMonthBudget, showAllMonthBudget) || other.showAllMonthBudget == showAllMonthBudget)&&(identical(other.showAllYearBudget, showAllYearBudget) || other.showAllYearBudget == showAllYearBudget));
}


@override
int get hashCode => Object.hash(runtimeType,date,type,const DeepCollectionEquality().hash(itemsMonthBudget),const DeepCollectionEquality().hash(itemsYearBudget),const DeepCollectionEquality().hash(itemsAll),showAllMonthBudget,showAllYearBudget);

@override
String toString() {
  return 'BudgetState(date: $date, type: $type, itemsMonthBudget: $itemsMonthBudget, itemsYearBudget: $itemsYearBudget, itemsAll: $itemsAll, showAllMonthBudget: $showAllMonthBudget, showAllYearBudget: $showAllYearBudget)';
}


}

/// @nodoc
abstract mixin class $BudgetStateCopyWith<$Res>  {
  factory $BudgetStateCopyWith(BudgetState value, $Res Function(BudgetState) _then) = _$BudgetStateCopyWithImpl;
@useResult
$Res call({
 DateTime date, CategoryType type, List<CategoryCashFlow> itemsMonthBudget, List<CategoryCashFlow> itemsYearBudget, List<CategoryCashFlow> itemsAll, bool showAllMonthBudget, bool showAllYearBudget
});




}
/// @nodoc
class _$BudgetStateCopyWithImpl<$Res>
    implements $BudgetStateCopyWith<$Res> {
  _$BudgetStateCopyWithImpl(this._self, this._then);

  final BudgetState _self;
  final $Res Function(BudgetState) _then;

/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? type = null,Object? itemsMonthBudget = null,Object? itemsYearBudget = null,Object? itemsAll = null,Object? showAllMonthBudget = null,Object? showAllYearBudget = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,itemsMonthBudget: null == itemsMonthBudget ? _self.itemsMonthBudget : itemsMonthBudget // ignore: cast_nullable_to_non_nullable
as List<CategoryCashFlow>,itemsYearBudget: null == itemsYearBudget ? _self.itemsYearBudget : itemsYearBudget // ignore: cast_nullable_to_non_nullable
as List<CategoryCashFlow>,itemsAll: null == itemsAll ? _self.itemsAll : itemsAll // ignore: cast_nullable_to_non_nullable
as List<CategoryCashFlow>,showAllMonthBudget: null == showAllMonthBudget ? _self.showAllMonthBudget : showAllMonthBudget // ignore: cast_nullable_to_non_nullable
as bool,showAllYearBudget: null == showAllYearBudget ? _self.showAllYearBudget : showAllYearBudget // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BudgetState].
extension BudgetStatePatterns on BudgetState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetState value)  $default,){
final _that = this;
switch (_that) {
case _BudgetState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetState value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  CategoryType type,  List<CategoryCashFlow> itemsMonthBudget,  List<CategoryCashFlow> itemsYearBudget,  List<CategoryCashFlow> itemsAll,  bool showAllMonthBudget,  bool showAllYearBudget)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetState() when $default != null:
return $default(_that.date,_that.type,_that.itemsMonthBudget,_that.itemsYearBudget,_that.itemsAll,_that.showAllMonthBudget,_that.showAllYearBudget);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  CategoryType type,  List<CategoryCashFlow> itemsMonthBudget,  List<CategoryCashFlow> itemsYearBudget,  List<CategoryCashFlow> itemsAll,  bool showAllMonthBudget,  bool showAllYearBudget)  $default,) {final _that = this;
switch (_that) {
case _BudgetState():
return $default(_that.date,_that.type,_that.itemsMonthBudget,_that.itemsYearBudget,_that.itemsAll,_that.showAllMonthBudget,_that.showAllYearBudget);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  CategoryType type,  List<CategoryCashFlow> itemsMonthBudget,  List<CategoryCashFlow> itemsYearBudget,  List<CategoryCashFlow> itemsAll,  bool showAllMonthBudget,  bool showAllYearBudget)?  $default,) {final _that = this;
switch (_that) {
case _BudgetState() when $default != null:
return $default(_that.date,_that.type,_that.itemsMonthBudget,_that.itemsYearBudget,_that.itemsAll,_that.showAllMonthBudget,_that.showAllYearBudget);case _:
  return null;

}
}

}

/// @nodoc


class _BudgetState implements BudgetState {
  const _BudgetState({required this.date, required this.type, required final  List<CategoryCashFlow> itemsMonthBudget, required final  List<CategoryCashFlow> itemsYearBudget, required final  List<CategoryCashFlow> itemsAll, required this.showAllMonthBudget, required this.showAllYearBudget}): _itemsMonthBudget = itemsMonthBudget,_itemsYearBudget = itemsYearBudget,_itemsAll = itemsAll;
  

@override final  DateTime date;
@override final  CategoryType type;
 final  List<CategoryCashFlow> _itemsMonthBudget;
@override List<CategoryCashFlow> get itemsMonthBudget {
  if (_itemsMonthBudget is EqualUnmodifiableListView) return _itemsMonthBudget;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itemsMonthBudget);
}

 final  List<CategoryCashFlow> _itemsYearBudget;
@override List<CategoryCashFlow> get itemsYearBudget {
  if (_itemsYearBudget is EqualUnmodifiableListView) return _itemsYearBudget;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itemsYearBudget);
}

 final  List<CategoryCashFlow> _itemsAll;
@override List<CategoryCashFlow> get itemsAll {
  if (_itemsAll is EqualUnmodifiableListView) return _itemsAll;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itemsAll);
}

@override final  bool showAllMonthBudget;
@override final  bool showAllYearBudget;

/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetStateCopyWith<_BudgetState> get copyWith => __$BudgetStateCopyWithImpl<_BudgetState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetState&&(identical(other.date, date) || other.date == date)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._itemsMonthBudget, _itemsMonthBudget)&&const DeepCollectionEquality().equals(other._itemsYearBudget, _itemsYearBudget)&&const DeepCollectionEquality().equals(other._itemsAll, _itemsAll)&&(identical(other.showAllMonthBudget, showAllMonthBudget) || other.showAllMonthBudget == showAllMonthBudget)&&(identical(other.showAllYearBudget, showAllYearBudget) || other.showAllYearBudget == showAllYearBudget));
}


@override
int get hashCode => Object.hash(runtimeType,date,type,const DeepCollectionEquality().hash(_itemsMonthBudget),const DeepCollectionEquality().hash(_itemsYearBudget),const DeepCollectionEquality().hash(_itemsAll),showAllMonthBudget,showAllYearBudget);

@override
String toString() {
  return 'BudgetState(date: $date, type: $type, itemsMonthBudget: $itemsMonthBudget, itemsYearBudget: $itemsYearBudget, itemsAll: $itemsAll, showAllMonthBudget: $showAllMonthBudget, showAllYearBudget: $showAllYearBudget)';
}


}

/// @nodoc
abstract mixin class _$BudgetStateCopyWith<$Res> implements $BudgetStateCopyWith<$Res> {
  factory _$BudgetStateCopyWith(_BudgetState value, $Res Function(_BudgetState) _then) = __$BudgetStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, CategoryType type, List<CategoryCashFlow> itemsMonthBudget, List<CategoryCashFlow> itemsYearBudget, List<CategoryCashFlow> itemsAll, bool showAllMonthBudget, bool showAllYearBudget
});




}
/// @nodoc
class __$BudgetStateCopyWithImpl<$Res>
    implements _$BudgetStateCopyWith<$Res> {
  __$BudgetStateCopyWithImpl(this._self, this._then);

  final _BudgetState _self;
  final $Res Function(_BudgetState) _then;

/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? type = null,Object? itemsMonthBudget = null,Object? itemsYearBudget = null,Object? itemsAll = null,Object? showAllMonthBudget = null,Object? showAllYearBudget = null,}) {
  return _then(_BudgetState(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as CategoryType,itemsMonthBudget: null == itemsMonthBudget ? _self._itemsMonthBudget : itemsMonthBudget // ignore: cast_nullable_to_non_nullable
as List<CategoryCashFlow>,itemsYearBudget: null == itemsYearBudget ? _self._itemsYearBudget : itemsYearBudget // ignore: cast_nullable_to_non_nullable
as List<CategoryCashFlow>,itemsAll: null == itemsAll ? _self._itemsAll : itemsAll // ignore: cast_nullable_to_non_nullable
as List<CategoryCashFlow>,showAllMonthBudget: null == showAllMonthBudget ? _self.showAllMonthBudget : showAllMonthBudget // ignore: cast_nullable_to_non_nullable
as bool,showAllYearBudget: null == showAllYearBudget ? _self.showAllYearBudget : showAllYearBudget // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
