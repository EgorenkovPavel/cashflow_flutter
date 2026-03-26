// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_bar_chart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BudgetBarChartEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetBarChartEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BudgetBarChartEvent()';
}


}

/// @nodoc
class $BudgetBarChartEventCopyWith<$Res>  {
$BudgetBarChartEventCopyWith(BudgetBarChartEvent _, $Res Function(BudgetBarChartEvent) __);
}


/// Adds pattern-matching-related methods to [BudgetBarChartEvent].
extension BudgetBarChartEventPatterns on BudgetBarChartEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchBudgetBarChartEvent value)?  fetch,TResult Function( _ChangeBudgetBarChartEvent value)?  change,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchBudgetBarChartEvent() when fetch != null:
return fetch(_that);case _ChangeBudgetBarChartEvent() when change != null:
return change(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchBudgetBarChartEvent value)  fetch,required TResult Function( _ChangeBudgetBarChartEvent value)  change,}){
final _that = this;
switch (_that) {
case _FetchBudgetBarChartEvent():
return fetch(_that);case _ChangeBudgetBarChartEvent():
return change(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchBudgetBarChartEvent value)?  fetch,TResult? Function( _ChangeBudgetBarChartEvent value)?  change,}){
final _that = this;
switch (_that) {
case _FetchBudgetBarChartEvent() when fetch != null:
return fetch(_that);case _ChangeBudgetBarChartEvent() when change != null:
return change(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int categoryId,  int amount)?  fetch,TResult Function( Map<DateTime, Balance> data)?  change,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchBudgetBarChartEvent() when fetch != null:
return fetch(_that.categoryId,_that.amount);case _ChangeBudgetBarChartEvent() when change != null:
return change(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int categoryId,  int amount)  fetch,required TResult Function( Map<DateTime, Balance> data)  change,}) {final _that = this;
switch (_that) {
case _FetchBudgetBarChartEvent():
return fetch(_that.categoryId,_that.amount);case _ChangeBudgetBarChartEvent():
return change(_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int categoryId,  int amount)?  fetch,TResult? Function( Map<DateTime, Balance> data)?  change,}) {final _that = this;
switch (_that) {
case _FetchBudgetBarChartEvent() when fetch != null:
return fetch(_that.categoryId,_that.amount);case _ChangeBudgetBarChartEvent() when change != null:
return change(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _FetchBudgetBarChartEvent implements BudgetBarChartEvent {
  const _FetchBudgetBarChartEvent({required this.categoryId, required this.amount});
  

 final  int categoryId;
 final  int amount;

/// Create a copy of BudgetBarChartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchBudgetBarChartEventCopyWith<_FetchBudgetBarChartEvent> get copyWith => __$FetchBudgetBarChartEventCopyWithImpl<_FetchBudgetBarChartEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchBudgetBarChartEvent&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,categoryId,amount);

@override
String toString() {
  return 'BudgetBarChartEvent.fetch(categoryId: $categoryId, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$FetchBudgetBarChartEventCopyWith<$Res> implements $BudgetBarChartEventCopyWith<$Res> {
  factory _$FetchBudgetBarChartEventCopyWith(_FetchBudgetBarChartEvent value, $Res Function(_FetchBudgetBarChartEvent) _then) = __$FetchBudgetBarChartEventCopyWithImpl;
@useResult
$Res call({
 int categoryId, int amount
});




}
/// @nodoc
class __$FetchBudgetBarChartEventCopyWithImpl<$Res>
    implements _$FetchBudgetBarChartEventCopyWith<$Res> {
  __$FetchBudgetBarChartEventCopyWithImpl(this._self, this._then);

  final _FetchBudgetBarChartEvent _self;
  final $Res Function(_FetchBudgetBarChartEvent) _then;

/// Create a copy of BudgetBarChartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? amount = null,}) {
  return _then(_FetchBudgetBarChartEvent(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ChangeBudgetBarChartEvent implements BudgetBarChartEvent {
  const _ChangeBudgetBarChartEvent({required final  Map<DateTime, Balance> data}): _data = data;
  

 final  Map<DateTime, Balance> _data;
 Map<DateTime, Balance> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of BudgetBarChartEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeBudgetBarChartEventCopyWith<_ChangeBudgetBarChartEvent> get copyWith => __$ChangeBudgetBarChartEventCopyWithImpl<_ChangeBudgetBarChartEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeBudgetBarChartEvent&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'BudgetBarChartEvent.change(data: $data)';
}


}

/// @nodoc
abstract mixin class _$ChangeBudgetBarChartEventCopyWith<$Res> implements $BudgetBarChartEventCopyWith<$Res> {
  factory _$ChangeBudgetBarChartEventCopyWith(_ChangeBudgetBarChartEvent value, $Res Function(_ChangeBudgetBarChartEvent) _then) = __$ChangeBudgetBarChartEventCopyWithImpl;
@useResult
$Res call({
 Map<DateTime, Balance> data
});




}
/// @nodoc
class __$ChangeBudgetBarChartEventCopyWithImpl<$Res>
    implements _$ChangeBudgetBarChartEventCopyWith<$Res> {
  __$ChangeBudgetBarChartEventCopyWithImpl(this._self, this._then);

  final _ChangeBudgetBarChartEvent _self;
  final $Res Function(_ChangeBudgetBarChartEvent) _then;

/// Create a copy of BudgetBarChartEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_ChangeBudgetBarChartEvent(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<DateTime, Balance>,
  ));
}


}

/// @nodoc
mixin _$BudgetBarChartState {

 Map<DateTime, Balance> get data;
/// Create a copy of BudgetBarChartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetBarChartStateCopyWith<BudgetBarChartState> get copyWith => _$BudgetBarChartStateCopyWithImpl<BudgetBarChartState>(this as BudgetBarChartState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetBarChartState&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'BudgetBarChartState(data: $data)';
}


}

/// @nodoc
abstract mixin class $BudgetBarChartStateCopyWith<$Res>  {
  factory $BudgetBarChartStateCopyWith(BudgetBarChartState value, $Res Function(BudgetBarChartState) _then) = _$BudgetBarChartStateCopyWithImpl;
@useResult
$Res call({
 Map<DateTime, Balance> data
});




}
/// @nodoc
class _$BudgetBarChartStateCopyWithImpl<$Res>
    implements $BudgetBarChartStateCopyWith<$Res> {
  _$BudgetBarChartStateCopyWithImpl(this._self, this._then);

  final BudgetBarChartState _self;
  final $Res Function(BudgetBarChartState) _then;

/// Create a copy of BudgetBarChartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<DateTime, Balance>,
  ));
}

}


/// Adds pattern-matching-related methods to [BudgetBarChartState].
extension BudgetBarChartStatePatterns on BudgetBarChartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetBarChartState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetBarChartState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetBarChartState value)  $default,){
final _that = this;
switch (_that) {
case _BudgetBarChartState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetBarChartState value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetBarChartState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<DateTime, Balance> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetBarChartState() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<DateTime, Balance> data)  $default,) {final _that = this;
switch (_that) {
case _BudgetBarChartState():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<DateTime, Balance> data)?  $default,) {final _that = this;
switch (_that) {
case _BudgetBarChartState() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _BudgetBarChartState implements BudgetBarChartState {
  const _BudgetBarChartState({required final  Map<DateTime, Balance> data}): _data = data;
  

 final  Map<DateTime, Balance> _data;
@override Map<DateTime, Balance> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of BudgetBarChartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetBarChartStateCopyWith<_BudgetBarChartState> get copyWith => __$BudgetBarChartStateCopyWithImpl<_BudgetBarChartState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetBarChartState&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'BudgetBarChartState(data: $data)';
}


}

/// @nodoc
abstract mixin class _$BudgetBarChartStateCopyWith<$Res> implements $BudgetBarChartStateCopyWith<$Res> {
  factory _$BudgetBarChartStateCopyWith(_BudgetBarChartState value, $Res Function(_BudgetBarChartState) _then) = __$BudgetBarChartStateCopyWithImpl;
@override @useResult
$Res call({
 Map<DateTime, Balance> data
});




}
/// @nodoc
class __$BudgetBarChartStateCopyWithImpl<$Res>
    implements _$BudgetBarChartStateCopyWith<$Res> {
  __$BudgetBarChartStateCopyWithImpl(this._self, this._then);

  final _BudgetBarChartState _self;
  final $Res Function(_BudgetBarChartState) _then;

/// Create a copy of BudgetBarChartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_BudgetBarChartState(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<DateTime, Balance>,
  ));
}


}

// dart format on
