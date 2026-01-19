// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OperationFilterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationFilterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OperationFilterEvent()';
}


}

/// @nodoc
class $OperationFilterEventCopyWith<$Res>  {
$OperationFilterEventCopyWith(OperationFilterEvent _, $Res Function(OperationFilterEvent) __);
}


/// Adds pattern-matching-related methods to [OperationFilterEvent].
extension OperationFilterEventPatterns on OperationFilterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitPeriodOperationFilterEvent value)?  init,TResult Function( _ResetPeriodOperationFilterEvent value)?  resetPeriod,TResult Function( _SetPeriodOperationFilterEvent value)?  setPeriod,TResult Function( _AddAccountOperationFilterEvent value)?  addAccount,TResult Function( _RemoveAccountOperationFilterEvent value)?  removeAccount,TResult Function( _AddCategoryOperationFilterEvent value)?  addCategory,TResult Function( _RemoveCategoryOperationFilterEvent value)?  removeCategory,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitPeriodOperationFilterEvent() when init != null:
return init(_that);case _ResetPeriodOperationFilterEvent() when resetPeriod != null:
return resetPeriod(_that);case _SetPeriodOperationFilterEvent() when setPeriod != null:
return setPeriod(_that);case _AddAccountOperationFilterEvent() when addAccount != null:
return addAccount(_that);case _RemoveAccountOperationFilterEvent() when removeAccount != null:
return removeAccount(_that);case _AddCategoryOperationFilterEvent() when addCategory != null:
return addCategory(_that);case _RemoveCategoryOperationFilterEvent() when removeCategory != null:
return removeCategory(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitPeriodOperationFilterEvent value)  init,required TResult Function( _ResetPeriodOperationFilterEvent value)  resetPeriod,required TResult Function( _SetPeriodOperationFilterEvent value)  setPeriod,required TResult Function( _AddAccountOperationFilterEvent value)  addAccount,required TResult Function( _RemoveAccountOperationFilterEvent value)  removeAccount,required TResult Function( _AddCategoryOperationFilterEvent value)  addCategory,required TResult Function( _RemoveCategoryOperationFilterEvent value)  removeCategory,}){
final _that = this;
switch (_that) {
case _InitPeriodOperationFilterEvent():
return init(_that);case _ResetPeriodOperationFilterEvent():
return resetPeriod(_that);case _SetPeriodOperationFilterEvent():
return setPeriod(_that);case _AddAccountOperationFilterEvent():
return addAccount(_that);case _RemoveAccountOperationFilterEvent():
return removeAccount(_that);case _AddCategoryOperationFilterEvent():
return addCategory(_that);case _RemoveCategoryOperationFilterEvent():
return removeCategory(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitPeriodOperationFilterEvent value)?  init,TResult? Function( _ResetPeriodOperationFilterEvent value)?  resetPeriod,TResult? Function( _SetPeriodOperationFilterEvent value)?  setPeriod,TResult? Function( _AddAccountOperationFilterEvent value)?  addAccount,TResult? Function( _RemoveAccountOperationFilterEvent value)?  removeAccount,TResult? Function( _AddCategoryOperationFilterEvent value)?  addCategory,TResult? Function( _RemoveCategoryOperationFilterEvent value)?  removeCategory,}){
final _that = this;
switch (_that) {
case _InitPeriodOperationFilterEvent() when init != null:
return init(_that);case _ResetPeriodOperationFilterEvent() when resetPeriod != null:
return resetPeriod(_that);case _SetPeriodOperationFilterEvent() when setPeriod != null:
return setPeriod(_that);case _AddAccountOperationFilterEvent() when addAccount != null:
return addAccount(_that);case _RemoveAccountOperationFilterEvent() when removeAccount != null:
return removeAccount(_that);case _AddCategoryOperationFilterEvent() when addCategory != null:
return addCategory(_that);case _RemoveCategoryOperationFilterEvent() when removeCategory != null:
return removeCategory(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( OperationListFilter filter)?  init,TResult Function()?  resetPeriod,TResult Function( DateTimeRange period)?  setPeriod,TResult Function( AccountView account)?  addAccount,TResult Function( AccountView account)?  removeAccount,TResult Function( CategoryView category)?  addCategory,TResult Function( CategoryView category)?  removeCategory,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitPeriodOperationFilterEvent() when init != null:
return init(_that.filter);case _ResetPeriodOperationFilterEvent() when resetPeriod != null:
return resetPeriod();case _SetPeriodOperationFilterEvent() when setPeriod != null:
return setPeriod(_that.period);case _AddAccountOperationFilterEvent() when addAccount != null:
return addAccount(_that.account);case _RemoveAccountOperationFilterEvent() when removeAccount != null:
return removeAccount(_that.account);case _AddCategoryOperationFilterEvent() when addCategory != null:
return addCategory(_that.category);case _RemoveCategoryOperationFilterEvent() when removeCategory != null:
return removeCategory(_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( OperationListFilter filter)  init,required TResult Function()  resetPeriod,required TResult Function( DateTimeRange period)  setPeriod,required TResult Function( AccountView account)  addAccount,required TResult Function( AccountView account)  removeAccount,required TResult Function( CategoryView category)  addCategory,required TResult Function( CategoryView category)  removeCategory,}) {final _that = this;
switch (_that) {
case _InitPeriodOperationFilterEvent():
return init(_that.filter);case _ResetPeriodOperationFilterEvent():
return resetPeriod();case _SetPeriodOperationFilterEvent():
return setPeriod(_that.period);case _AddAccountOperationFilterEvent():
return addAccount(_that.account);case _RemoveAccountOperationFilterEvent():
return removeAccount(_that.account);case _AddCategoryOperationFilterEvent():
return addCategory(_that.category);case _RemoveCategoryOperationFilterEvent():
return removeCategory(_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( OperationListFilter filter)?  init,TResult? Function()?  resetPeriod,TResult? Function( DateTimeRange period)?  setPeriod,TResult? Function( AccountView account)?  addAccount,TResult? Function( AccountView account)?  removeAccount,TResult? Function( CategoryView category)?  addCategory,TResult? Function( CategoryView category)?  removeCategory,}) {final _that = this;
switch (_that) {
case _InitPeriodOperationFilterEvent() when init != null:
return init(_that.filter);case _ResetPeriodOperationFilterEvent() when resetPeriod != null:
return resetPeriod();case _SetPeriodOperationFilterEvent() when setPeriod != null:
return setPeriod(_that.period);case _AddAccountOperationFilterEvent() when addAccount != null:
return addAccount(_that.account);case _RemoveAccountOperationFilterEvent() when removeAccount != null:
return removeAccount(_that.account);case _AddCategoryOperationFilterEvent() when addCategory != null:
return addCategory(_that.category);case _RemoveCategoryOperationFilterEvent() when removeCategory != null:
return removeCategory(_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _InitPeriodOperationFilterEvent implements OperationFilterEvent {
  const _InitPeriodOperationFilterEvent({required this.filter});
  

 final  OperationListFilter filter;

/// Create a copy of OperationFilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InitPeriodOperationFilterEventCopyWith<_InitPeriodOperationFilterEvent> get copyWith => __$InitPeriodOperationFilterEventCopyWithImpl<_InitPeriodOperationFilterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitPeriodOperationFilterEvent&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'OperationFilterEvent.init(filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$InitPeriodOperationFilterEventCopyWith<$Res> implements $OperationFilterEventCopyWith<$Res> {
  factory _$InitPeriodOperationFilterEventCopyWith(_InitPeriodOperationFilterEvent value, $Res Function(_InitPeriodOperationFilterEvent) _then) = __$InitPeriodOperationFilterEventCopyWithImpl;
@useResult
$Res call({
 OperationListFilter filter
});




}
/// @nodoc
class __$InitPeriodOperationFilterEventCopyWithImpl<$Res>
    implements _$InitPeriodOperationFilterEventCopyWith<$Res> {
  __$InitPeriodOperationFilterEventCopyWithImpl(this._self, this._then);

  final _InitPeriodOperationFilterEvent _self;
  final $Res Function(_InitPeriodOperationFilterEvent) _then;

/// Create a copy of OperationFilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(_InitPeriodOperationFilterEvent(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as OperationListFilter,
  ));
}


}

/// @nodoc


class _ResetPeriodOperationFilterEvent implements OperationFilterEvent {
  const _ResetPeriodOperationFilterEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPeriodOperationFilterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OperationFilterEvent.resetPeriod()';
}


}




/// @nodoc


class _SetPeriodOperationFilterEvent implements OperationFilterEvent {
  const _SetPeriodOperationFilterEvent({required this.period});
  

 final  DateTimeRange period;

/// Create a copy of OperationFilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetPeriodOperationFilterEventCopyWith<_SetPeriodOperationFilterEvent> get copyWith => __$SetPeriodOperationFilterEventCopyWithImpl<_SetPeriodOperationFilterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetPeriodOperationFilterEvent&&(identical(other.period, period) || other.period == period));
}


@override
int get hashCode => Object.hash(runtimeType,period);

@override
String toString() {
  return 'OperationFilterEvent.setPeriod(period: $period)';
}


}

/// @nodoc
abstract mixin class _$SetPeriodOperationFilterEventCopyWith<$Res> implements $OperationFilterEventCopyWith<$Res> {
  factory _$SetPeriodOperationFilterEventCopyWith(_SetPeriodOperationFilterEvent value, $Res Function(_SetPeriodOperationFilterEvent) _then) = __$SetPeriodOperationFilterEventCopyWithImpl;
@useResult
$Res call({
 DateTimeRange period
});




}
/// @nodoc
class __$SetPeriodOperationFilterEventCopyWithImpl<$Res>
    implements _$SetPeriodOperationFilterEventCopyWith<$Res> {
  __$SetPeriodOperationFilterEventCopyWithImpl(this._self, this._then);

  final _SetPeriodOperationFilterEvent _self;
  final $Res Function(_SetPeriodOperationFilterEvent) _then;

/// Create a copy of OperationFilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? period = null,}) {
  return _then(_SetPeriodOperationFilterEvent(
period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as DateTimeRange,
  ));
}


}

/// @nodoc


class _AddAccountOperationFilterEvent implements OperationFilterEvent {
  const _AddAccountOperationFilterEvent({required this.account});
  

 final  AccountView account;

/// Create a copy of OperationFilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddAccountOperationFilterEventCopyWith<_AddAccountOperationFilterEvent> get copyWith => __$AddAccountOperationFilterEventCopyWithImpl<_AddAccountOperationFilterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddAccountOperationFilterEvent&&(identical(other.account, account) || other.account == account));
}


@override
int get hashCode => Object.hash(runtimeType,account);

@override
String toString() {
  return 'OperationFilterEvent.addAccount(account: $account)';
}


}

/// @nodoc
abstract mixin class _$AddAccountOperationFilterEventCopyWith<$Res> implements $OperationFilterEventCopyWith<$Res> {
  factory _$AddAccountOperationFilterEventCopyWith(_AddAccountOperationFilterEvent value, $Res Function(_AddAccountOperationFilterEvent) _then) = __$AddAccountOperationFilterEventCopyWithImpl;
@useResult
$Res call({
 AccountView account
});


$AccountViewCopyWith<$Res> get account;

}
/// @nodoc
class __$AddAccountOperationFilterEventCopyWithImpl<$Res>
    implements _$AddAccountOperationFilterEventCopyWith<$Res> {
  __$AddAccountOperationFilterEventCopyWithImpl(this._self, this._then);

  final _AddAccountOperationFilterEvent _self;
  final $Res Function(_AddAccountOperationFilterEvent) _then;

/// Create a copy of OperationFilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? account = null,}) {
  return _then(_AddAccountOperationFilterEvent(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountView,
  ));
}

/// Create a copy of OperationFilterEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountViewCopyWith<$Res> get account {
  
  return $AccountViewCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}

/// @nodoc


class _RemoveAccountOperationFilterEvent implements OperationFilterEvent {
  const _RemoveAccountOperationFilterEvent({required this.account});
  

 final  AccountView account;

/// Create a copy of OperationFilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveAccountOperationFilterEventCopyWith<_RemoveAccountOperationFilterEvent> get copyWith => __$RemoveAccountOperationFilterEventCopyWithImpl<_RemoveAccountOperationFilterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveAccountOperationFilterEvent&&(identical(other.account, account) || other.account == account));
}


@override
int get hashCode => Object.hash(runtimeType,account);

@override
String toString() {
  return 'OperationFilterEvent.removeAccount(account: $account)';
}


}

/// @nodoc
abstract mixin class _$RemoveAccountOperationFilterEventCopyWith<$Res> implements $OperationFilterEventCopyWith<$Res> {
  factory _$RemoveAccountOperationFilterEventCopyWith(_RemoveAccountOperationFilterEvent value, $Res Function(_RemoveAccountOperationFilterEvent) _then) = __$RemoveAccountOperationFilterEventCopyWithImpl;
@useResult
$Res call({
 AccountView account
});


$AccountViewCopyWith<$Res> get account;

}
/// @nodoc
class __$RemoveAccountOperationFilterEventCopyWithImpl<$Res>
    implements _$RemoveAccountOperationFilterEventCopyWith<$Res> {
  __$RemoveAccountOperationFilterEventCopyWithImpl(this._self, this._then);

  final _RemoveAccountOperationFilterEvent _self;
  final $Res Function(_RemoveAccountOperationFilterEvent) _then;

/// Create a copy of OperationFilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? account = null,}) {
  return _then(_RemoveAccountOperationFilterEvent(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountView,
  ));
}

/// Create a copy of OperationFilterEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountViewCopyWith<$Res> get account {
  
  return $AccountViewCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}

/// @nodoc


class _AddCategoryOperationFilterEvent implements OperationFilterEvent {
  const _AddCategoryOperationFilterEvent({required this.category});
  

 final  CategoryView category;

/// Create a copy of OperationFilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddCategoryOperationFilterEventCopyWith<_AddCategoryOperationFilterEvent> get copyWith => __$AddCategoryOperationFilterEventCopyWithImpl<_AddCategoryOperationFilterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddCategoryOperationFilterEvent&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'OperationFilterEvent.addCategory(category: $category)';
}


}

/// @nodoc
abstract mixin class _$AddCategoryOperationFilterEventCopyWith<$Res> implements $OperationFilterEventCopyWith<$Res> {
  factory _$AddCategoryOperationFilterEventCopyWith(_AddCategoryOperationFilterEvent value, $Res Function(_AddCategoryOperationFilterEvent) _then) = __$AddCategoryOperationFilterEventCopyWithImpl;
@useResult
$Res call({
 CategoryView category
});




}
/// @nodoc
class __$AddCategoryOperationFilterEventCopyWithImpl<$Res>
    implements _$AddCategoryOperationFilterEventCopyWith<$Res> {
  __$AddCategoryOperationFilterEventCopyWithImpl(this._self, this._then);

  final _AddCategoryOperationFilterEvent _self;
  final $Res Function(_AddCategoryOperationFilterEvent) _then;

/// Create a copy of OperationFilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_AddCategoryOperationFilterEvent(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryView,
  ));
}


}

/// @nodoc


class _RemoveCategoryOperationFilterEvent implements OperationFilterEvent {
  const _RemoveCategoryOperationFilterEvent({required this.category});
  

 final  CategoryView category;

/// Create a copy of OperationFilterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoveCategoryOperationFilterEventCopyWith<_RemoveCategoryOperationFilterEvent> get copyWith => __$RemoveCategoryOperationFilterEventCopyWithImpl<_RemoveCategoryOperationFilterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoveCategoryOperationFilterEvent&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'OperationFilterEvent.removeCategory(category: $category)';
}


}

/// @nodoc
abstract mixin class _$RemoveCategoryOperationFilterEventCopyWith<$Res> implements $OperationFilterEventCopyWith<$Res> {
  factory _$RemoveCategoryOperationFilterEventCopyWith(_RemoveCategoryOperationFilterEvent value, $Res Function(_RemoveCategoryOperationFilterEvent) _then) = __$RemoveCategoryOperationFilterEventCopyWithImpl;
@useResult
$Res call({
 CategoryView category
});




}
/// @nodoc
class __$RemoveCategoryOperationFilterEventCopyWithImpl<$Res>
    implements _$RemoveCategoryOperationFilterEventCopyWith<$Res> {
  __$RemoveCategoryOperationFilterEventCopyWithImpl(this._self, this._then);

  final _RemoveCategoryOperationFilterEvent _self;
  final $Res Function(_RemoveCategoryOperationFilterEvent) _then;

/// Create a copy of OperationFilterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_RemoveCategoryOperationFilterEvent(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryView,
  ));
}


}

/// @nodoc
mixin _$OperationFilterState {

 DateTimeRange? get period; Set<int> get accountIds; Set<int> get categoryIds;
/// Create a copy of OperationFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationFilterStateCopyWith<OperationFilterState> get copyWith => _$OperationFilterStateCopyWithImpl<OperationFilterState>(this as OperationFilterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationFilterState&&(identical(other.period, period) || other.period == period)&&const DeepCollectionEquality().equals(other.accountIds, accountIds)&&const DeepCollectionEquality().equals(other.categoryIds, categoryIds));
}


@override
int get hashCode => Object.hash(runtimeType,period,const DeepCollectionEquality().hash(accountIds),const DeepCollectionEquality().hash(categoryIds));

@override
String toString() {
  return 'OperationFilterState(period: $period, accountIds: $accountIds, categoryIds: $categoryIds)';
}


}

/// @nodoc
abstract mixin class $OperationFilterStateCopyWith<$Res>  {
  factory $OperationFilterStateCopyWith(OperationFilterState value, $Res Function(OperationFilterState) _then) = _$OperationFilterStateCopyWithImpl;
@useResult
$Res call({
 DateTimeRange? period, Set<int> accountIds, Set<int> categoryIds
});




}
/// @nodoc
class _$OperationFilterStateCopyWithImpl<$Res>
    implements $OperationFilterStateCopyWith<$Res> {
  _$OperationFilterStateCopyWithImpl(this._self, this._then);

  final OperationFilterState _self;
  final $Res Function(OperationFilterState) _then;

/// Create a copy of OperationFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? period = freezed,Object? accountIds = null,Object? categoryIds = null,}) {
  return _then(_self.copyWith(
period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as DateTimeRange?,accountIds: null == accountIds ? _self.accountIds : accountIds // ignore: cast_nullable_to_non_nullable
as Set<int>,categoryIds: null == categoryIds ? _self.categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [OperationFilterState].
extension OperationFilterStatePatterns on OperationFilterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OperationFilterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OperationFilterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OperationFilterState value)  $default,){
final _that = this;
switch (_that) {
case _OperationFilterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OperationFilterState value)?  $default,){
final _that = this;
switch (_that) {
case _OperationFilterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTimeRange? period,  Set<int> accountIds,  Set<int> categoryIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OperationFilterState() when $default != null:
return $default(_that.period,_that.accountIds,_that.categoryIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTimeRange? period,  Set<int> accountIds,  Set<int> categoryIds)  $default,) {final _that = this;
switch (_that) {
case _OperationFilterState():
return $default(_that.period,_that.accountIds,_that.categoryIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTimeRange? period,  Set<int> accountIds,  Set<int> categoryIds)?  $default,) {final _that = this;
switch (_that) {
case _OperationFilterState() when $default != null:
return $default(_that.period,_that.accountIds,_that.categoryIds);case _:
  return null;

}
}

}

/// @nodoc


class _OperationFilterState extends OperationFilterState {
  const _OperationFilterState({this.period, final  Set<int> accountIds = const {}, final  Set<int> categoryIds = const {}}): _accountIds = accountIds,_categoryIds = categoryIds,super._();
  

@override final  DateTimeRange? period;
 final  Set<int> _accountIds;
@override@JsonKey() Set<int> get accountIds {
  if (_accountIds is EqualUnmodifiableSetView) return _accountIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_accountIds);
}

 final  Set<int> _categoryIds;
@override@JsonKey() Set<int> get categoryIds {
  if (_categoryIds is EqualUnmodifiableSetView) return _categoryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_categoryIds);
}


/// Create a copy of OperationFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationFilterStateCopyWith<_OperationFilterState> get copyWith => __$OperationFilterStateCopyWithImpl<_OperationFilterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationFilterState&&(identical(other.period, period) || other.period == period)&&const DeepCollectionEquality().equals(other._accountIds, _accountIds)&&const DeepCollectionEquality().equals(other._categoryIds, _categoryIds));
}


@override
int get hashCode => Object.hash(runtimeType,period,const DeepCollectionEquality().hash(_accountIds),const DeepCollectionEquality().hash(_categoryIds));

@override
String toString() {
  return 'OperationFilterState(period: $period, accountIds: $accountIds, categoryIds: $categoryIds)';
}


}

/// @nodoc
abstract mixin class _$OperationFilterStateCopyWith<$Res> implements $OperationFilterStateCopyWith<$Res> {
  factory _$OperationFilterStateCopyWith(_OperationFilterState value, $Res Function(_OperationFilterState) _then) = __$OperationFilterStateCopyWithImpl;
@override @useResult
$Res call({
 DateTimeRange? period, Set<int> accountIds, Set<int> categoryIds
});




}
/// @nodoc
class __$OperationFilterStateCopyWithImpl<$Res>
    implements _$OperationFilterStateCopyWith<$Res> {
  __$OperationFilterStateCopyWithImpl(this._self, this._then);

  final _OperationFilterState _self;
  final $Res Function(_OperationFilterState) _then;

/// Create a copy of OperationFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? period = freezed,Object? accountIds = null,Object? categoryIds = null,}) {
  return _then(_OperationFilterState(
period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as DateTimeRange?,accountIds: null == accountIds ? _self._accountIds : accountIds // ignore: cast_nullable_to_non_nullable
as Set<int>,categoryIds: null == categoryIds ? _self._categoryIds : categoryIds // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}


}

// dart format on
