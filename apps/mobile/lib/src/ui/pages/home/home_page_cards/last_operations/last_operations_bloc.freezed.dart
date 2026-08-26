// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'last_operations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LastOperationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LastOperationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LastOperationsEvent()';
}


}

/// @nodoc
class $LastOperationsEventCopyWith<$Res>  {
$LastOperationsEventCopyWith(LastOperationsEvent _, $Res Function(LastOperationsEvent) __);
}


/// Adds pattern-matching-related methods to [LastOperationsEvent].
extension LastOperationsEventPatterns on LastOperationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchLastOperationsEvent value)?  fetch,TResult Function( _ChangeOperationsLastOperationsEvent value)?  changeOperations,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchLastOperationsEvent() when fetch != null:
return fetch(_that);case _ChangeOperationsLastOperationsEvent() when changeOperations != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchLastOperationsEvent value)  fetch,required TResult Function( _ChangeOperationsLastOperationsEvent value)  changeOperations,}){
final _that = this;
switch (_that) {
case _FetchLastOperationsEvent():
return fetch(_that);case _ChangeOperationsLastOperationsEvent():
return changeOperations(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchLastOperationsEvent value)?  fetch,TResult? Function( _ChangeOperationsLastOperationsEvent value)?  changeOperations,}){
final _that = this;
switch (_that) {
case _FetchLastOperationsEvent() when fetch != null:
return fetch(_that);case _ChangeOperationsLastOperationsEvent() when changeOperations != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetch,TResult Function( List<OperationView> operations)?  changeOperations,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchLastOperationsEvent() when fetch != null:
return fetch();case _ChangeOperationsLastOperationsEvent() when changeOperations != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetch,required TResult Function( List<OperationView> operations)  changeOperations,}) {final _that = this;
switch (_that) {
case _FetchLastOperationsEvent():
return fetch();case _ChangeOperationsLastOperationsEvent():
return changeOperations(_that.operations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetch,TResult? Function( List<OperationView> operations)?  changeOperations,}) {final _that = this;
switch (_that) {
case _FetchLastOperationsEvent() when fetch != null:
return fetch();case _ChangeOperationsLastOperationsEvent() when changeOperations != null:
return changeOperations(_that.operations);case _:
  return null;

}
}

}

/// @nodoc


class _FetchLastOperationsEvent implements LastOperationsEvent {
  const _FetchLastOperationsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchLastOperationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LastOperationsEvent.fetch()';
}


}




/// @nodoc


class _ChangeOperationsLastOperationsEvent implements LastOperationsEvent {
  const _ChangeOperationsLastOperationsEvent(final  List<OperationView> operations): _operations = operations;
  

 final  List<OperationView> _operations;
 List<OperationView> get operations {
  if (_operations is EqualUnmodifiableListView) return _operations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_operations);
}


/// Create a copy of LastOperationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeOperationsLastOperationsEventCopyWith<_ChangeOperationsLastOperationsEvent> get copyWith => __$ChangeOperationsLastOperationsEventCopyWithImpl<_ChangeOperationsLastOperationsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeOperationsLastOperationsEvent&&const DeepCollectionEquality().equals(other._operations, _operations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_operations));

@override
String toString() {
  return 'LastOperationsEvent.changeOperations(operations: $operations)';
}


}

/// @nodoc
abstract mixin class _$ChangeOperationsLastOperationsEventCopyWith<$Res> implements $LastOperationsEventCopyWith<$Res> {
  factory _$ChangeOperationsLastOperationsEventCopyWith(_ChangeOperationsLastOperationsEvent value, $Res Function(_ChangeOperationsLastOperationsEvent) _then) = __$ChangeOperationsLastOperationsEventCopyWithImpl;
@useResult
$Res call({
 List<OperationView> operations
});




}
/// @nodoc
class __$ChangeOperationsLastOperationsEventCopyWithImpl<$Res>
    implements _$ChangeOperationsLastOperationsEventCopyWith<$Res> {
  __$ChangeOperationsLastOperationsEventCopyWithImpl(this._self, this._then);

  final _ChangeOperationsLastOperationsEvent _self;
  final $Res Function(_ChangeOperationsLastOperationsEvent) _then;

/// Create a copy of LastOperationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? operations = null,}) {
  return _then(_ChangeOperationsLastOperationsEvent(
null == operations ? _self._operations : operations // ignore: cast_nullable_to_non_nullable
as List<OperationView>,
  ));
}


}

/// @nodoc
mixin _$LastOperationsState {

 List<OperationView> get operations;
/// Create a copy of LastOperationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LastOperationsStateCopyWith<LastOperationsState> get copyWith => _$LastOperationsStateCopyWithImpl<LastOperationsState>(this as LastOperationsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LastOperationsState&&const DeepCollectionEquality().equals(other.operations, operations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(operations));

@override
String toString() {
  return 'LastOperationsState(operations: $operations)';
}


}

/// @nodoc
abstract mixin class $LastOperationsStateCopyWith<$Res>  {
  factory $LastOperationsStateCopyWith(LastOperationsState value, $Res Function(LastOperationsState) _then) = _$LastOperationsStateCopyWithImpl;
@useResult
$Res call({
 List<OperationView> operations
});




}
/// @nodoc
class _$LastOperationsStateCopyWithImpl<$Res>
    implements $LastOperationsStateCopyWith<$Res> {
  _$LastOperationsStateCopyWithImpl(this._self, this._then);

  final LastOperationsState _self;
  final $Res Function(LastOperationsState) _then;

/// Create a copy of LastOperationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? operations = null,}) {
  return _then(_self.copyWith(
operations: null == operations ? _self.operations : operations // ignore: cast_nullable_to_non_nullable
as List<OperationView>,
  ));
}

}


/// Adds pattern-matching-related methods to [LastOperationsState].
extension LastOperationsStatePatterns on LastOperationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LastOperationsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LastOperationsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LastOperationsState value)  $default,){
final _that = this;
switch (_that) {
case _LastOperationsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LastOperationsState value)?  $default,){
final _that = this;
switch (_that) {
case _LastOperationsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<OperationView> operations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LastOperationsState() when $default != null:
return $default(_that.operations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<OperationView> operations)  $default,) {final _that = this;
switch (_that) {
case _LastOperationsState():
return $default(_that.operations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<OperationView> operations)?  $default,) {final _that = this;
switch (_that) {
case _LastOperationsState() when $default != null:
return $default(_that.operations);case _:
  return null;

}
}

}

/// @nodoc


class _LastOperationsState implements LastOperationsState {
  const _LastOperationsState({required final  List<OperationView> operations}): _operations = operations;
  

 final  List<OperationView> _operations;
@override List<OperationView> get operations {
  if (_operations is EqualUnmodifiableListView) return _operations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_operations);
}


/// Create a copy of LastOperationsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LastOperationsStateCopyWith<_LastOperationsState> get copyWith => __$LastOperationsStateCopyWithImpl<_LastOperationsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LastOperationsState&&const DeepCollectionEquality().equals(other._operations, _operations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_operations));

@override
String toString() {
  return 'LastOperationsState(operations: $operations)';
}


}

/// @nodoc
abstract mixin class _$LastOperationsStateCopyWith<$Res> implements $LastOperationsStateCopyWith<$Res> {
  factory _$LastOperationsStateCopyWith(_LastOperationsState value, $Res Function(_LastOperationsState) _then) = __$LastOperationsStateCopyWithImpl;
@override @useResult
$Res call({
 List<OperationView> operations
});




}
/// @nodoc
class __$LastOperationsStateCopyWithImpl<$Res>
    implements _$LastOperationsStateCopyWith<$Res> {
  __$LastOperationsStateCopyWithImpl(this._self, this._then);

  final _LastOperationsState _self;
  final $Res Function(_LastOperationsState) _then;

/// Create a copy of LastOperationsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? operations = null,}) {
  return _then(_LastOperationsState(
operations: null == operations ? _self._operations : operations // ignore: cast_nullable_to_non_nullable
as List<OperationView>,
  ));
}


}

// dart format on
