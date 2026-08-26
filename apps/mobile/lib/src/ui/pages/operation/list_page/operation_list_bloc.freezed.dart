// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OperationListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OperationListEvent()';
}


}

/// @nodoc
class $OperationListEventCopyWith<$Res>  {
$OperationListEventCopyWith(OperationListEvent _, $Res Function(OperationListEvent) __);
}


/// Adds pattern-matching-related methods to [OperationListEvent].
extension OperationListEventPatterns on OperationListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchOperationListEvent value)?  fetch,TResult Function( _ChangeOperationsOperationListEvent value)?  changeOperations,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchOperationListEvent() when fetch != null:
return fetch(_that);case _ChangeOperationsOperationListEvent() when changeOperations != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchOperationListEvent value)  fetch,required TResult Function( _ChangeOperationsOperationListEvent value)  changeOperations,}){
final _that = this;
switch (_that) {
case _FetchOperationListEvent():
return fetch(_that);case _ChangeOperationsOperationListEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchOperationListEvent value)?  fetch,TResult? Function( _ChangeOperationsOperationListEvent value)?  changeOperations,}){
final _that = this;
switch (_that) {
case _FetchOperationListEvent() when fetch != null:
return fetch(_that);case _ChangeOperationsOperationListEvent() when changeOperations != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( OperationListFilter filter)?  fetch,TResult Function( List<OperationView> operations)?  changeOperations,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchOperationListEvent() when fetch != null:
return fetch(_that.filter);case _ChangeOperationsOperationListEvent() when changeOperations != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( OperationListFilter filter)  fetch,required TResult Function( List<OperationView> operations)  changeOperations,}) {final _that = this;
switch (_that) {
case _FetchOperationListEvent():
return fetch(_that.filter);case _ChangeOperationsOperationListEvent():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( OperationListFilter filter)?  fetch,TResult? Function( List<OperationView> operations)?  changeOperations,}) {final _that = this;
switch (_that) {
case _FetchOperationListEvent() when fetch != null:
return fetch(_that.filter);case _ChangeOperationsOperationListEvent() when changeOperations != null:
return changeOperations(_that.operations);case _:
  return null;

}
}

}

/// @nodoc


class _FetchOperationListEvent implements OperationListEvent {
  const _FetchOperationListEvent({required this.filter});
  

 final  OperationListFilter filter;

/// Create a copy of OperationListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchOperationListEventCopyWith<_FetchOperationListEvent> get copyWith => __$FetchOperationListEventCopyWithImpl<_FetchOperationListEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchOperationListEvent&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'OperationListEvent.fetch(filter: $filter)';
}


}

/// @nodoc
abstract mixin class _$FetchOperationListEventCopyWith<$Res> implements $OperationListEventCopyWith<$Res> {
  factory _$FetchOperationListEventCopyWith(_FetchOperationListEvent value, $Res Function(_FetchOperationListEvent) _then) = __$FetchOperationListEventCopyWithImpl;
@useResult
$Res call({
 OperationListFilter filter
});


$OperationListFilterCopyWith<$Res> get filter;

}
/// @nodoc
class __$FetchOperationListEventCopyWithImpl<$Res>
    implements _$FetchOperationListEventCopyWith<$Res> {
  __$FetchOperationListEventCopyWithImpl(this._self, this._then);

  final _FetchOperationListEvent _self;
  final $Res Function(_FetchOperationListEvent) _then;

/// Create a copy of OperationListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(_FetchOperationListEvent(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as OperationListFilter,
  ));
}

/// Create a copy of OperationListEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OperationListFilterCopyWith<$Res> get filter {
  
  return $OperationListFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc


class _ChangeOperationsOperationListEvent implements OperationListEvent {
  const _ChangeOperationsOperationListEvent({required final  List<OperationView> operations}): _operations = operations;
  

 final  List<OperationView> _operations;
 List<OperationView> get operations {
  if (_operations is EqualUnmodifiableListView) return _operations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_operations);
}


/// Create a copy of OperationListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeOperationsOperationListEventCopyWith<_ChangeOperationsOperationListEvent> get copyWith => __$ChangeOperationsOperationListEventCopyWithImpl<_ChangeOperationsOperationListEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeOperationsOperationListEvent&&const DeepCollectionEquality().equals(other._operations, _operations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_operations));

@override
String toString() {
  return 'OperationListEvent.changeOperations(operations: $operations)';
}


}

/// @nodoc
abstract mixin class _$ChangeOperationsOperationListEventCopyWith<$Res> implements $OperationListEventCopyWith<$Res> {
  factory _$ChangeOperationsOperationListEventCopyWith(_ChangeOperationsOperationListEvent value, $Res Function(_ChangeOperationsOperationListEvent) _then) = __$ChangeOperationsOperationListEventCopyWithImpl;
@useResult
$Res call({
 List<OperationView> operations
});




}
/// @nodoc
class __$ChangeOperationsOperationListEventCopyWithImpl<$Res>
    implements _$ChangeOperationsOperationListEventCopyWith<$Res> {
  __$ChangeOperationsOperationListEventCopyWithImpl(this._self, this._then);

  final _ChangeOperationsOperationListEvent _self;
  final $Res Function(_ChangeOperationsOperationListEvent) _then;

/// Create a copy of OperationListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? operations = null,}) {
  return _then(_ChangeOperationsOperationListEvent(
operations: null == operations ? _self._operations : operations // ignore: cast_nullable_to_non_nullable
as List<OperationView>,
  ));
}


}

// dart format on
