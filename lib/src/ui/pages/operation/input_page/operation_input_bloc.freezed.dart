// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_input_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MasterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MasterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MasterEvent()';
}


}

/// @nodoc
class $MasterEventCopyWith<$Res>  {
$MasterEventCopyWith(MasterEvent _, $Res Function(MasterEvent) __);
}


/// Adds pattern-matching-related methods to [MasterEvent].
extension MasterEventPatterns on MasterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _StartMasterEvent value)?  start,TResult Function( _ChangeOperationTypeMasterEvent value)?  changeOperationType,TResult Function( _ChangeAccountMasterEvent value)?  changeAccount,TResult Function( _ChangeCategoryMasterEvent value)?  changeCategory,TResult Function( _ChangeRecAccountMasterEvent value)?  changeRecAccount,TResult Function( _ChangeSumMasterEvent value)?  changeSum,TResult Function( _ChangeRecSumMasterEvent value)?  changeRecSum,TResult Function( _CancelOperationMasterEvent value)?  cancelOperation,TResult Function( _NextTapMasterEvent value)?  nextTap,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartMasterEvent() when start != null:
return start(_that);case _ChangeOperationTypeMasterEvent() when changeOperationType != null:
return changeOperationType(_that);case _ChangeAccountMasterEvent() when changeAccount != null:
return changeAccount(_that);case _ChangeCategoryMasterEvent() when changeCategory != null:
return changeCategory(_that);case _ChangeRecAccountMasterEvent() when changeRecAccount != null:
return changeRecAccount(_that);case _ChangeSumMasterEvent() when changeSum != null:
return changeSum(_that);case _ChangeRecSumMasterEvent() when changeRecSum != null:
return changeRecSum(_that);case _CancelOperationMasterEvent() when cancelOperation != null:
return cancelOperation(_that);case _NextTapMasterEvent() when nextTap != null:
return nextTap(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _StartMasterEvent value)  start,required TResult Function( _ChangeOperationTypeMasterEvent value)  changeOperationType,required TResult Function( _ChangeAccountMasterEvent value)  changeAccount,required TResult Function( _ChangeCategoryMasterEvent value)  changeCategory,required TResult Function( _ChangeRecAccountMasterEvent value)  changeRecAccount,required TResult Function( _ChangeSumMasterEvent value)  changeSum,required TResult Function( _ChangeRecSumMasterEvent value)  changeRecSum,required TResult Function( _CancelOperationMasterEvent value)  cancelOperation,required TResult Function( _NextTapMasterEvent value)  nextTap,}){
final _that = this;
switch (_that) {
case _StartMasterEvent():
return start(_that);case _ChangeOperationTypeMasterEvent():
return changeOperationType(_that);case _ChangeAccountMasterEvent():
return changeAccount(_that);case _ChangeCategoryMasterEvent():
return changeCategory(_that);case _ChangeRecAccountMasterEvent():
return changeRecAccount(_that);case _ChangeSumMasterEvent():
return changeSum(_that);case _ChangeRecSumMasterEvent():
return changeRecSum(_that);case _CancelOperationMasterEvent():
return cancelOperation(_that);case _NextTapMasterEvent():
return nextTap(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _StartMasterEvent value)?  start,TResult? Function( _ChangeOperationTypeMasterEvent value)?  changeOperationType,TResult? Function( _ChangeAccountMasterEvent value)?  changeAccount,TResult? Function( _ChangeCategoryMasterEvent value)?  changeCategory,TResult? Function( _ChangeRecAccountMasterEvent value)?  changeRecAccount,TResult? Function( _ChangeSumMasterEvent value)?  changeSum,TResult? Function( _ChangeRecSumMasterEvent value)?  changeRecSum,TResult? Function( _CancelOperationMasterEvent value)?  cancelOperation,TResult? Function( _NextTapMasterEvent value)?  nextTap,}){
final _that = this;
switch (_that) {
case _StartMasterEvent() when start != null:
return start(_that);case _ChangeOperationTypeMasterEvent() when changeOperationType != null:
return changeOperationType(_that);case _ChangeAccountMasterEvent() when changeAccount != null:
return changeAccount(_that);case _ChangeCategoryMasterEvent() when changeCategory != null:
return changeCategory(_that);case _ChangeRecAccountMasterEvent() when changeRecAccount != null:
return changeRecAccount(_that);case _ChangeSumMasterEvent() when changeSum != null:
return changeSum(_that);case _ChangeRecSumMasterEvent() when changeRecSum != null:
return changeRecSum(_that);case _CancelOperationMasterEvent() when cancelOperation != null:
return cancelOperation(_that);case _NextTapMasterEvent() when nextTap != null:
return nextTap(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  start,TResult Function( OperationType operationType)?  changeOperationType,TResult Function( int id)?  changeAccount,TResult Function( int? id)?  changeCategory,TResult Function( int id)?  changeRecAccount,TResult Function( Sum sum)?  changeSum,TResult Function( Sum sum)?  changeRecSum,TResult Function()?  cancelOperation,TResult Function()?  nextTap,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartMasterEvent() when start != null:
return start();case _ChangeOperationTypeMasterEvent() when changeOperationType != null:
return changeOperationType(_that.operationType);case _ChangeAccountMasterEvent() when changeAccount != null:
return changeAccount(_that.id);case _ChangeCategoryMasterEvent() when changeCategory != null:
return changeCategory(_that.id);case _ChangeRecAccountMasterEvent() when changeRecAccount != null:
return changeRecAccount(_that.id);case _ChangeSumMasterEvent() when changeSum != null:
return changeSum(_that.sum);case _ChangeRecSumMasterEvent() when changeRecSum != null:
return changeRecSum(_that.sum);case _CancelOperationMasterEvent() when cancelOperation != null:
return cancelOperation();case _NextTapMasterEvent() when nextTap != null:
return nextTap();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  start,required TResult Function( OperationType operationType)  changeOperationType,required TResult Function( int id)  changeAccount,required TResult Function( int? id)  changeCategory,required TResult Function( int id)  changeRecAccount,required TResult Function( Sum sum)  changeSum,required TResult Function( Sum sum)  changeRecSum,required TResult Function()  cancelOperation,required TResult Function()  nextTap,}) {final _that = this;
switch (_that) {
case _StartMasterEvent():
return start();case _ChangeOperationTypeMasterEvent():
return changeOperationType(_that.operationType);case _ChangeAccountMasterEvent():
return changeAccount(_that.id);case _ChangeCategoryMasterEvent():
return changeCategory(_that.id);case _ChangeRecAccountMasterEvent():
return changeRecAccount(_that.id);case _ChangeSumMasterEvent():
return changeSum(_that.sum);case _ChangeRecSumMasterEvent():
return changeRecSum(_that.sum);case _CancelOperationMasterEvent():
return cancelOperation();case _NextTapMasterEvent():
return nextTap();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  start,TResult? Function( OperationType operationType)?  changeOperationType,TResult? Function( int id)?  changeAccount,TResult? Function( int? id)?  changeCategory,TResult? Function( int id)?  changeRecAccount,TResult? Function( Sum sum)?  changeSum,TResult? Function( Sum sum)?  changeRecSum,TResult? Function()?  cancelOperation,TResult? Function()?  nextTap,}) {final _that = this;
switch (_that) {
case _StartMasterEvent() when start != null:
return start();case _ChangeOperationTypeMasterEvent() when changeOperationType != null:
return changeOperationType(_that.operationType);case _ChangeAccountMasterEvent() when changeAccount != null:
return changeAccount(_that.id);case _ChangeCategoryMasterEvent() when changeCategory != null:
return changeCategory(_that.id);case _ChangeRecAccountMasterEvent() when changeRecAccount != null:
return changeRecAccount(_that.id);case _ChangeSumMasterEvent() when changeSum != null:
return changeSum(_that.sum);case _ChangeRecSumMasterEvent() when changeRecSum != null:
return changeRecSum(_that.sum);case _CancelOperationMasterEvent() when cancelOperation != null:
return cancelOperation();case _NextTapMasterEvent() when nextTap != null:
return nextTap();case _:
  return null;

}
}

}

/// @nodoc


class _StartMasterEvent implements MasterEvent {
  const _StartMasterEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartMasterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MasterEvent.start()';
}


}




/// @nodoc


class _ChangeOperationTypeMasterEvent implements MasterEvent {
  const _ChangeOperationTypeMasterEvent(this.operationType);
  

 final  OperationType operationType;

/// Create a copy of MasterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeOperationTypeMasterEventCopyWith<_ChangeOperationTypeMasterEvent> get copyWith => __$ChangeOperationTypeMasterEventCopyWithImpl<_ChangeOperationTypeMasterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeOperationTypeMasterEvent&&(identical(other.operationType, operationType) || other.operationType == operationType));
}


@override
int get hashCode => Object.hash(runtimeType,operationType);

@override
String toString() {
  return 'MasterEvent.changeOperationType(operationType: $operationType)';
}


}

/// @nodoc
abstract mixin class _$ChangeOperationTypeMasterEventCopyWith<$Res> implements $MasterEventCopyWith<$Res> {
  factory _$ChangeOperationTypeMasterEventCopyWith(_ChangeOperationTypeMasterEvent value, $Res Function(_ChangeOperationTypeMasterEvent) _then) = __$ChangeOperationTypeMasterEventCopyWithImpl;
@useResult
$Res call({
 OperationType operationType
});




}
/// @nodoc
class __$ChangeOperationTypeMasterEventCopyWithImpl<$Res>
    implements _$ChangeOperationTypeMasterEventCopyWith<$Res> {
  __$ChangeOperationTypeMasterEventCopyWithImpl(this._self, this._then);

  final _ChangeOperationTypeMasterEvent _self;
  final $Res Function(_ChangeOperationTypeMasterEvent) _then;

/// Create a copy of MasterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? operationType = null,}) {
  return _then(_ChangeOperationTypeMasterEvent(
null == operationType ? _self.operationType : operationType // ignore: cast_nullable_to_non_nullable
as OperationType,
  ));
}


}

/// @nodoc


class _ChangeAccountMasterEvent implements MasterEvent {
  const _ChangeAccountMasterEvent(this.id);
  

 final  int id;

/// Create a copy of MasterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeAccountMasterEventCopyWith<_ChangeAccountMasterEvent> get copyWith => __$ChangeAccountMasterEventCopyWithImpl<_ChangeAccountMasterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeAccountMasterEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'MasterEvent.changeAccount(id: $id)';
}


}

/// @nodoc
abstract mixin class _$ChangeAccountMasterEventCopyWith<$Res> implements $MasterEventCopyWith<$Res> {
  factory _$ChangeAccountMasterEventCopyWith(_ChangeAccountMasterEvent value, $Res Function(_ChangeAccountMasterEvent) _then) = __$ChangeAccountMasterEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$ChangeAccountMasterEventCopyWithImpl<$Res>
    implements _$ChangeAccountMasterEventCopyWith<$Res> {
  __$ChangeAccountMasterEventCopyWithImpl(this._self, this._then);

  final _ChangeAccountMasterEvent _self;
  final $Res Function(_ChangeAccountMasterEvent) _then;

/// Create a copy of MasterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_ChangeAccountMasterEvent(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ChangeCategoryMasterEvent implements MasterEvent {
  const _ChangeCategoryMasterEvent(this.id);
  

 final  int? id;

/// Create a copy of MasterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeCategoryMasterEventCopyWith<_ChangeCategoryMasterEvent> get copyWith => __$ChangeCategoryMasterEventCopyWithImpl<_ChangeCategoryMasterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeCategoryMasterEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'MasterEvent.changeCategory(id: $id)';
}


}

/// @nodoc
abstract mixin class _$ChangeCategoryMasterEventCopyWith<$Res> implements $MasterEventCopyWith<$Res> {
  factory _$ChangeCategoryMasterEventCopyWith(_ChangeCategoryMasterEvent value, $Res Function(_ChangeCategoryMasterEvent) _then) = __$ChangeCategoryMasterEventCopyWithImpl;
@useResult
$Res call({
 int? id
});




}
/// @nodoc
class __$ChangeCategoryMasterEventCopyWithImpl<$Res>
    implements _$ChangeCategoryMasterEventCopyWith<$Res> {
  __$ChangeCategoryMasterEventCopyWithImpl(this._self, this._then);

  final _ChangeCategoryMasterEvent _self;
  final $Res Function(_ChangeCategoryMasterEvent) _then;

/// Create a copy of MasterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = freezed,}) {
  return _then(_ChangeCategoryMasterEvent(
freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _ChangeRecAccountMasterEvent implements MasterEvent {
  const _ChangeRecAccountMasterEvent(this.id);
  

 final  int id;

/// Create a copy of MasterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeRecAccountMasterEventCopyWith<_ChangeRecAccountMasterEvent> get copyWith => __$ChangeRecAccountMasterEventCopyWithImpl<_ChangeRecAccountMasterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeRecAccountMasterEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'MasterEvent.changeRecAccount(id: $id)';
}


}

/// @nodoc
abstract mixin class _$ChangeRecAccountMasterEventCopyWith<$Res> implements $MasterEventCopyWith<$Res> {
  factory _$ChangeRecAccountMasterEventCopyWith(_ChangeRecAccountMasterEvent value, $Res Function(_ChangeRecAccountMasterEvent) _then) = __$ChangeRecAccountMasterEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$ChangeRecAccountMasterEventCopyWithImpl<$Res>
    implements _$ChangeRecAccountMasterEventCopyWith<$Res> {
  __$ChangeRecAccountMasterEventCopyWithImpl(this._self, this._then);

  final _ChangeRecAccountMasterEvent _self;
  final $Res Function(_ChangeRecAccountMasterEvent) _then;

/// Create a copy of MasterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_ChangeRecAccountMasterEvent(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ChangeSumMasterEvent implements MasterEvent {
  const _ChangeSumMasterEvent(this.sum);
  

 final  Sum sum;

/// Create a copy of MasterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeSumMasterEventCopyWith<_ChangeSumMasterEvent> get copyWith => __$ChangeSumMasterEventCopyWithImpl<_ChangeSumMasterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeSumMasterEvent&&(identical(other.sum, sum) || other.sum == sum));
}


@override
int get hashCode => Object.hash(runtimeType,sum);

@override
String toString() {
  return 'MasterEvent.changeSum(sum: $sum)';
}


}

/// @nodoc
abstract mixin class _$ChangeSumMasterEventCopyWith<$Res> implements $MasterEventCopyWith<$Res> {
  factory _$ChangeSumMasterEventCopyWith(_ChangeSumMasterEvent value, $Res Function(_ChangeSumMasterEvent) _then) = __$ChangeSumMasterEventCopyWithImpl;
@useResult
$Res call({
 Sum sum
});


$SumCopyWith<$Res> get sum;

}
/// @nodoc
class __$ChangeSumMasterEventCopyWithImpl<$Res>
    implements _$ChangeSumMasterEventCopyWith<$Res> {
  __$ChangeSumMasterEventCopyWithImpl(this._self, this._then);

  final _ChangeSumMasterEvent _self;
  final $Res Function(_ChangeSumMasterEvent) _then;

/// Create a copy of MasterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sum = null,}) {
  return _then(_ChangeSumMasterEvent(
null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Sum,
  ));
}

/// Create a copy of MasterEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SumCopyWith<$Res> get sum {
  
  return $SumCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}

/// @nodoc


class _ChangeRecSumMasterEvent implements MasterEvent {
  const _ChangeRecSumMasterEvent(this.sum);
  

 final  Sum sum;

/// Create a copy of MasterEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeRecSumMasterEventCopyWith<_ChangeRecSumMasterEvent> get copyWith => __$ChangeRecSumMasterEventCopyWithImpl<_ChangeRecSumMasterEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeRecSumMasterEvent&&(identical(other.sum, sum) || other.sum == sum));
}


@override
int get hashCode => Object.hash(runtimeType,sum);

@override
String toString() {
  return 'MasterEvent.changeRecSum(sum: $sum)';
}


}

/// @nodoc
abstract mixin class _$ChangeRecSumMasterEventCopyWith<$Res> implements $MasterEventCopyWith<$Res> {
  factory _$ChangeRecSumMasterEventCopyWith(_ChangeRecSumMasterEvent value, $Res Function(_ChangeRecSumMasterEvent) _then) = __$ChangeRecSumMasterEventCopyWithImpl;
@useResult
$Res call({
 Sum sum
});


$SumCopyWith<$Res> get sum;

}
/// @nodoc
class __$ChangeRecSumMasterEventCopyWithImpl<$Res>
    implements _$ChangeRecSumMasterEventCopyWith<$Res> {
  __$ChangeRecSumMasterEventCopyWithImpl(this._self, this._then);

  final _ChangeRecSumMasterEvent _self;
  final $Res Function(_ChangeRecSumMasterEvent) _then;

/// Create a copy of MasterEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sum = null,}) {
  return _then(_ChangeRecSumMasterEvent(
null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Sum,
  ));
}

/// Create a copy of MasterEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SumCopyWith<$Res> get sum {
  
  return $SumCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}

/// @nodoc


class _CancelOperationMasterEvent implements MasterEvent {
  const _CancelOperationMasterEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CancelOperationMasterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MasterEvent.cancelOperation()';
}


}




/// @nodoc


class _NextTapMasterEvent implements MasterEvent {
  const _NextTapMasterEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextTapMasterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MasterEvent.nextTap()';
}


}




/// @nodoc
mixin _$MasterState {

 int? get accountId; Sum get sum; Operation? get operation; MasterStateAction? get action;
/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MasterStateCopyWith<MasterState> get copyWith => _$MasterStateCopyWithImpl<MasterState>(this as MasterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MasterState&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.action, action) || other.action == action));
}


@override
int get hashCode => Object.hash(runtimeType,accountId,sum,operation,action);

@override
String toString() {
  return 'MasterState(accountId: $accountId, sum: $sum, operation: $operation, action: $action)';
}


}

/// @nodoc
abstract mixin class $MasterStateCopyWith<$Res>  {
  factory $MasterStateCopyWith(MasterState value, $Res Function(MasterState) _then) = _$MasterStateCopyWithImpl;
@useResult
$Res call({
 int? accountId, Sum sum, Operation? operation, MasterStateAction? action
});


$SumCopyWith<$Res> get sum;$OperationCopyWith<$Res>? get operation;

}
/// @nodoc
class _$MasterStateCopyWithImpl<$Res>
    implements $MasterStateCopyWith<$Res> {
  _$MasterStateCopyWithImpl(this._self, this._then);

  final MasterState _self;
  final $Res Function(MasterState) _then;

/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = freezed,Object? sum = null,Object? operation = freezed,Object? action = freezed,}) {
  return _then(_self.copyWith(
accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Sum,operation: freezed == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as Operation?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as MasterStateAction?,
  ));
}
/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SumCopyWith<$Res> get sum {
  
  return $SumCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OperationCopyWith<$Res>? get operation {
    if (_self.operation == null) {
    return null;
  }

  return $OperationCopyWith<$Res>(_self.operation!, (value) {
    return _then(_self.copyWith(operation: value));
  });
}
}


/// Adds pattern-matching-related methods to [MasterState].
extension MasterStatePatterns on MasterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InputMasterState value)?  input,TResult Function( _OutputMasterState value)?  output,TResult Function( _TransferMasterState value)?  transfer,TResult Function( _ExchangeMasterState value)?  exchange,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InputMasterState() when input != null:
return input(_that);case _OutputMasterState() when output != null:
return output(_that);case _TransferMasterState() when transfer != null:
return transfer(_that);case _ExchangeMasterState() when exchange != null:
return exchange(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InputMasterState value)  input,required TResult Function( _OutputMasterState value)  output,required TResult Function( _TransferMasterState value)  transfer,required TResult Function( _ExchangeMasterState value)  exchange,}){
final _that = this;
switch (_that) {
case _InputMasterState():
return input(_that);case _OutputMasterState():
return output(_that);case _TransferMasterState():
return transfer(_that);case _ExchangeMasterState():
return exchange(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InputMasterState value)?  input,TResult? Function( _OutputMasterState value)?  output,TResult? Function( _TransferMasterState value)?  transfer,TResult? Function( _ExchangeMasterState value)?  exchange,}){
final _that = this;
switch (_that) {
case _InputMasterState() when input != null:
return input(_that);case _OutputMasterState() when output != null:
return output(_that);case _TransferMasterState() when transfer != null:
return transfer(_that);case _ExchangeMasterState() when exchange != null:
return exchange(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? accountId,  int? categoryId,  Sum sum,  Operation? operation,  MasterStateAction? action)?  input,TResult Function( int? accountId,  int? categoryId,  Sum sum,  Operation? operation,  MasterStateAction? action)?  output,TResult Function( int? accountId,  int? recAccountId,  Sum sum,  Operation? operation,  MasterStateAction? action)?  transfer,TResult Function( int? accountId,  Sum sum,  Sum recSum,  Operation? operation,  MasterStateAction? action)?  exchange,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InputMasterState() when input != null:
return input(_that.accountId,_that.categoryId,_that.sum,_that.operation,_that.action);case _OutputMasterState() when output != null:
return output(_that.accountId,_that.categoryId,_that.sum,_that.operation,_that.action);case _TransferMasterState() when transfer != null:
return transfer(_that.accountId,_that.recAccountId,_that.sum,_that.operation,_that.action);case _ExchangeMasterState() when exchange != null:
return exchange(_that.accountId,_that.sum,_that.recSum,_that.operation,_that.action);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? accountId,  int? categoryId,  Sum sum,  Operation? operation,  MasterStateAction? action)  input,required TResult Function( int? accountId,  int? categoryId,  Sum sum,  Operation? operation,  MasterStateAction? action)  output,required TResult Function( int? accountId,  int? recAccountId,  Sum sum,  Operation? operation,  MasterStateAction? action)  transfer,required TResult Function( int? accountId,  Sum sum,  Sum recSum,  Operation? operation,  MasterStateAction? action)  exchange,}) {final _that = this;
switch (_that) {
case _InputMasterState():
return input(_that.accountId,_that.categoryId,_that.sum,_that.operation,_that.action);case _OutputMasterState():
return output(_that.accountId,_that.categoryId,_that.sum,_that.operation,_that.action);case _TransferMasterState():
return transfer(_that.accountId,_that.recAccountId,_that.sum,_that.operation,_that.action);case _ExchangeMasterState():
return exchange(_that.accountId,_that.sum,_that.recSum,_that.operation,_that.action);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? accountId,  int? categoryId,  Sum sum,  Operation? operation,  MasterStateAction? action)?  input,TResult? Function( int? accountId,  int? categoryId,  Sum sum,  Operation? operation,  MasterStateAction? action)?  output,TResult? Function( int? accountId,  int? recAccountId,  Sum sum,  Operation? operation,  MasterStateAction? action)?  transfer,TResult? Function( int? accountId,  Sum sum,  Sum recSum,  Operation? operation,  MasterStateAction? action)?  exchange,}) {final _that = this;
switch (_that) {
case _InputMasterState() when input != null:
return input(_that.accountId,_that.categoryId,_that.sum,_that.operation,_that.action);case _OutputMasterState() when output != null:
return output(_that.accountId,_that.categoryId,_that.sum,_that.operation,_that.action);case _TransferMasterState() when transfer != null:
return transfer(_that.accountId,_that.recAccountId,_that.sum,_that.operation,_that.action);case _ExchangeMasterState() when exchange != null:
return exchange(_that.accountId,_that.sum,_that.recSum,_that.operation,_that.action);case _:
  return null;

}
}

}

/// @nodoc


class _InputMasterState implements MasterState {
  const _InputMasterState({this.accountId, this.categoryId, required this.sum, this.operation, this.action});
  

@override final  int? accountId;
 final  int? categoryId;
@override final  Sum sum;
@override final  Operation? operation;
@override final  MasterStateAction? action;

/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InputMasterStateCopyWith<_InputMasterState> get copyWith => __$InputMasterStateCopyWithImpl<_InputMasterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InputMasterState&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.action, action) || other.action == action));
}


@override
int get hashCode => Object.hash(runtimeType,accountId,categoryId,sum,operation,action);

@override
String toString() {
  return 'MasterState.input(accountId: $accountId, categoryId: $categoryId, sum: $sum, operation: $operation, action: $action)';
}


}

/// @nodoc
abstract mixin class _$InputMasterStateCopyWith<$Res> implements $MasterStateCopyWith<$Res> {
  factory _$InputMasterStateCopyWith(_InputMasterState value, $Res Function(_InputMasterState) _then) = __$InputMasterStateCopyWithImpl;
@override @useResult
$Res call({
 int? accountId, int? categoryId, Sum sum, Operation? operation, MasterStateAction? action
});


@override $SumCopyWith<$Res> get sum;@override $OperationCopyWith<$Res>? get operation;

}
/// @nodoc
class __$InputMasterStateCopyWithImpl<$Res>
    implements _$InputMasterStateCopyWith<$Res> {
  __$InputMasterStateCopyWithImpl(this._self, this._then);

  final _InputMasterState _self;
  final $Res Function(_InputMasterState) _then;

/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = freezed,Object? categoryId = freezed,Object? sum = null,Object? operation = freezed,Object? action = freezed,}) {
  return _then(_InputMasterState(
accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Sum,operation: freezed == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as Operation?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as MasterStateAction?,
  ));
}

/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SumCopyWith<$Res> get sum {
  
  return $SumCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OperationCopyWith<$Res>? get operation {
    if (_self.operation == null) {
    return null;
  }

  return $OperationCopyWith<$Res>(_self.operation!, (value) {
    return _then(_self.copyWith(operation: value));
  });
}
}

/// @nodoc


class _OutputMasterState implements MasterState {
  const _OutputMasterState({this.accountId, this.categoryId, required this.sum, this.operation, this.action});
  

@override final  int? accountId;
 final  int? categoryId;
@override final  Sum sum;
@override final  Operation? operation;
@override final  MasterStateAction? action;

/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutputMasterStateCopyWith<_OutputMasterState> get copyWith => __$OutputMasterStateCopyWithImpl<_OutputMasterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutputMasterState&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.action, action) || other.action == action));
}


@override
int get hashCode => Object.hash(runtimeType,accountId,categoryId,sum,operation,action);

@override
String toString() {
  return 'MasterState.output(accountId: $accountId, categoryId: $categoryId, sum: $sum, operation: $operation, action: $action)';
}


}

/// @nodoc
abstract mixin class _$OutputMasterStateCopyWith<$Res> implements $MasterStateCopyWith<$Res> {
  factory _$OutputMasterStateCopyWith(_OutputMasterState value, $Res Function(_OutputMasterState) _then) = __$OutputMasterStateCopyWithImpl;
@override @useResult
$Res call({
 int? accountId, int? categoryId, Sum sum, Operation? operation, MasterStateAction? action
});


@override $SumCopyWith<$Res> get sum;@override $OperationCopyWith<$Res>? get operation;

}
/// @nodoc
class __$OutputMasterStateCopyWithImpl<$Res>
    implements _$OutputMasterStateCopyWith<$Res> {
  __$OutputMasterStateCopyWithImpl(this._self, this._then);

  final _OutputMasterState _self;
  final $Res Function(_OutputMasterState) _then;

/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = freezed,Object? categoryId = freezed,Object? sum = null,Object? operation = freezed,Object? action = freezed,}) {
  return _then(_OutputMasterState(
accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Sum,operation: freezed == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as Operation?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as MasterStateAction?,
  ));
}

/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SumCopyWith<$Res> get sum {
  
  return $SumCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OperationCopyWith<$Res>? get operation {
    if (_self.operation == null) {
    return null;
  }

  return $OperationCopyWith<$Res>(_self.operation!, (value) {
    return _then(_self.copyWith(operation: value));
  });
}
}

/// @nodoc


class _TransferMasterState implements MasterState {
  const _TransferMasterState({this.accountId, this.recAccountId, required this.sum, this.operation, this.action});
  

@override final  int? accountId;
 final  int? recAccountId;
@override final  Sum sum;
@override final  Operation? operation;
@override final  MasterStateAction? action;

/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferMasterStateCopyWith<_TransferMasterState> get copyWith => __$TransferMasterStateCopyWithImpl<_TransferMasterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferMasterState&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.recAccountId, recAccountId) || other.recAccountId == recAccountId)&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.action, action) || other.action == action));
}


@override
int get hashCode => Object.hash(runtimeType,accountId,recAccountId,sum,operation,action);

@override
String toString() {
  return 'MasterState.transfer(accountId: $accountId, recAccountId: $recAccountId, sum: $sum, operation: $operation, action: $action)';
}


}

/// @nodoc
abstract mixin class _$TransferMasterStateCopyWith<$Res> implements $MasterStateCopyWith<$Res> {
  factory _$TransferMasterStateCopyWith(_TransferMasterState value, $Res Function(_TransferMasterState) _then) = __$TransferMasterStateCopyWithImpl;
@override @useResult
$Res call({
 int? accountId, int? recAccountId, Sum sum, Operation? operation, MasterStateAction? action
});


@override $SumCopyWith<$Res> get sum;@override $OperationCopyWith<$Res>? get operation;

}
/// @nodoc
class __$TransferMasterStateCopyWithImpl<$Res>
    implements _$TransferMasterStateCopyWith<$Res> {
  __$TransferMasterStateCopyWithImpl(this._self, this._then);

  final _TransferMasterState _self;
  final $Res Function(_TransferMasterState) _then;

/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = freezed,Object? recAccountId = freezed,Object? sum = null,Object? operation = freezed,Object? action = freezed,}) {
  return _then(_TransferMasterState(
accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,recAccountId: freezed == recAccountId ? _self.recAccountId : recAccountId // ignore: cast_nullable_to_non_nullable
as int?,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Sum,operation: freezed == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as Operation?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as MasterStateAction?,
  ));
}

/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SumCopyWith<$Res> get sum {
  
  return $SumCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OperationCopyWith<$Res>? get operation {
    if (_self.operation == null) {
    return null;
  }

  return $OperationCopyWith<$Res>(_self.operation!, (value) {
    return _then(_self.copyWith(operation: value));
  });
}
}

/// @nodoc


class _ExchangeMasterState implements MasterState {
  const _ExchangeMasterState({this.accountId, required this.sum, required this.recSum, this.operation, this.action});
  

@override final  int? accountId;
@override final  Sum sum;
 final  Sum recSum;
@override final  Operation? operation;
@override final  MasterStateAction? action;

/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExchangeMasterStateCopyWith<_ExchangeMasterState> get copyWith => __$ExchangeMasterStateCopyWithImpl<_ExchangeMasterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExchangeMasterState&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.recSum, recSum) || other.recSum == recSum)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.action, action) || other.action == action));
}


@override
int get hashCode => Object.hash(runtimeType,accountId,sum,recSum,operation,action);

@override
String toString() {
  return 'MasterState.exchange(accountId: $accountId, sum: $sum, recSum: $recSum, operation: $operation, action: $action)';
}


}

/// @nodoc
abstract mixin class _$ExchangeMasterStateCopyWith<$Res> implements $MasterStateCopyWith<$Res> {
  factory _$ExchangeMasterStateCopyWith(_ExchangeMasterState value, $Res Function(_ExchangeMasterState) _then) = __$ExchangeMasterStateCopyWithImpl;
@override @useResult
$Res call({
 int? accountId, Sum sum, Sum recSum, Operation? operation, MasterStateAction? action
});


@override $SumCopyWith<$Res> get sum;$SumCopyWith<$Res> get recSum;@override $OperationCopyWith<$Res>? get operation;

}
/// @nodoc
class __$ExchangeMasterStateCopyWithImpl<$Res>
    implements _$ExchangeMasterStateCopyWith<$Res> {
  __$ExchangeMasterStateCopyWithImpl(this._self, this._then);

  final _ExchangeMasterState _self;
  final $Res Function(_ExchangeMasterState) _then;

/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = freezed,Object? sum = null,Object? recSum = null,Object? operation = freezed,Object? action = freezed,}) {
  return _then(_ExchangeMasterState(
accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int?,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Sum,recSum: null == recSum ? _self.recSum : recSum // ignore: cast_nullable_to_non_nullable
as Sum,operation: freezed == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as Operation?,action: freezed == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as MasterStateAction?,
  ));
}

/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SumCopyWith<$Res> get sum {
  
  return $SumCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SumCopyWith<$Res> get recSum {
  
  return $SumCopyWith<$Res>(_self.recSum, (value) {
    return _then(_self.copyWith(recSum: value));
  });
}/// Create a copy of MasterState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OperationCopyWith<$Res>? get operation {
    if (_self.operation == null) {
    return null;
  }

  return $OperationCopyWith<$Res>(_self.operation!, (value) {
    return _then(_self.copyWith(operation: value));
  });
}
}

// dart format on
