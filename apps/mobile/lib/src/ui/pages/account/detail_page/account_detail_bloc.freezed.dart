// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountDetailEvent()';
}


}

/// @nodoc
class $AccountDetailEventCopyWith<$Res>  {
$AccountDetailEventCopyWith(AccountDetailEvent _, $Res Function(AccountDetailEvent) __);
}


/// Adds pattern-matching-related methods to [AccountDetailEvent].
extension AccountDetailEventPatterns on AccountDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchAccountDetailEvent value)?  fetch,TResult Function( _TitleChangedAccountDetailEvent value)?  titleChanged,TResult Function( _OperationsChangedAccountDetailEvent value)?  operationsChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchAccountDetailEvent() when fetch != null:
return fetch(_that);case _TitleChangedAccountDetailEvent() when titleChanged != null:
return titleChanged(_that);case _OperationsChangedAccountDetailEvent() when operationsChanged != null:
return operationsChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchAccountDetailEvent value)  fetch,required TResult Function( _TitleChangedAccountDetailEvent value)  titleChanged,required TResult Function( _OperationsChangedAccountDetailEvent value)  operationsChanged,}){
final _that = this;
switch (_that) {
case _FetchAccountDetailEvent():
return fetch(_that);case _TitleChangedAccountDetailEvent():
return titleChanged(_that);case _OperationsChangedAccountDetailEvent():
return operationsChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchAccountDetailEvent value)?  fetch,TResult? Function( _TitleChangedAccountDetailEvent value)?  titleChanged,TResult? Function( _OperationsChangedAccountDetailEvent value)?  operationsChanged,}){
final _that = this;
switch (_that) {
case _FetchAccountDetailEvent() when fetch != null:
return fetch(_that);case _TitleChangedAccountDetailEvent() when titleChanged != null:
return titleChanged(_that);case _OperationsChangedAccountDetailEvent() when operationsChanged != null:
return operationsChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int accountId)?  fetch,TResult Function( String title)?  titleChanged,TResult Function( List<OperationView> operations)?  operationsChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchAccountDetailEvent() when fetch != null:
return fetch(_that.accountId);case _TitleChangedAccountDetailEvent() when titleChanged != null:
return titleChanged(_that.title);case _OperationsChangedAccountDetailEvent() when operationsChanged != null:
return operationsChanged(_that.operations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int accountId)  fetch,required TResult Function( String title)  titleChanged,required TResult Function( List<OperationView> operations)  operationsChanged,}) {final _that = this;
switch (_that) {
case _FetchAccountDetailEvent():
return fetch(_that.accountId);case _TitleChangedAccountDetailEvent():
return titleChanged(_that.title);case _OperationsChangedAccountDetailEvent():
return operationsChanged(_that.operations);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int accountId)?  fetch,TResult? Function( String title)?  titleChanged,TResult? Function( List<OperationView> operations)?  operationsChanged,}) {final _that = this;
switch (_that) {
case _FetchAccountDetailEvent() when fetch != null:
return fetch(_that.accountId);case _TitleChangedAccountDetailEvent() when titleChanged != null:
return titleChanged(_that.title);case _OperationsChangedAccountDetailEvent() when operationsChanged != null:
return operationsChanged(_that.operations);case _:
  return null;

}
}

}

/// @nodoc


class _FetchAccountDetailEvent implements AccountDetailEvent {
  const _FetchAccountDetailEvent({required this.accountId});
  

 final  int accountId;

/// Create a copy of AccountDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchAccountDetailEventCopyWith<_FetchAccountDetailEvent> get copyWith => __$FetchAccountDetailEventCopyWithImpl<_FetchAccountDetailEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchAccountDetailEvent&&(identical(other.accountId, accountId) || other.accountId == accountId));
}


@override
int get hashCode => Object.hash(runtimeType,accountId);

@override
String toString() {
  return 'AccountDetailEvent.fetch(accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class _$FetchAccountDetailEventCopyWith<$Res> implements $AccountDetailEventCopyWith<$Res> {
  factory _$FetchAccountDetailEventCopyWith(_FetchAccountDetailEvent value, $Res Function(_FetchAccountDetailEvent) _then) = __$FetchAccountDetailEventCopyWithImpl;
@useResult
$Res call({
 int accountId
});




}
/// @nodoc
class __$FetchAccountDetailEventCopyWithImpl<$Res>
    implements _$FetchAccountDetailEventCopyWith<$Res> {
  __$FetchAccountDetailEventCopyWithImpl(this._self, this._then);

  final _FetchAccountDetailEvent _self;
  final $Res Function(_FetchAccountDetailEvent) _then;

/// Create a copy of AccountDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accountId = null,}) {
  return _then(_FetchAccountDetailEvent(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _TitleChangedAccountDetailEvent implements AccountDetailEvent {
  const _TitleChangedAccountDetailEvent(this.title);
  

 final  String title;

/// Create a copy of AccountDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TitleChangedAccountDetailEventCopyWith<_TitleChangedAccountDetailEvent> get copyWith => __$TitleChangedAccountDetailEventCopyWithImpl<_TitleChangedAccountDetailEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TitleChangedAccountDetailEvent&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'AccountDetailEvent.titleChanged(title: $title)';
}


}

/// @nodoc
abstract mixin class _$TitleChangedAccountDetailEventCopyWith<$Res> implements $AccountDetailEventCopyWith<$Res> {
  factory _$TitleChangedAccountDetailEventCopyWith(_TitleChangedAccountDetailEvent value, $Res Function(_TitleChangedAccountDetailEvent) _then) = __$TitleChangedAccountDetailEventCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class __$TitleChangedAccountDetailEventCopyWithImpl<$Res>
    implements _$TitleChangedAccountDetailEventCopyWith<$Res> {
  __$TitleChangedAccountDetailEventCopyWithImpl(this._self, this._then);

  final _TitleChangedAccountDetailEvent _self;
  final $Res Function(_TitleChangedAccountDetailEvent) _then;

/// Create a copy of AccountDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(_TitleChangedAccountDetailEvent(
null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _OperationsChangedAccountDetailEvent implements AccountDetailEvent {
  const _OperationsChangedAccountDetailEvent(final  List<OperationView> operations): _operations = operations;
  

 final  List<OperationView> _operations;
 List<OperationView> get operations {
  if (_operations is EqualUnmodifiableListView) return _operations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_operations);
}


/// Create a copy of AccountDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationsChangedAccountDetailEventCopyWith<_OperationsChangedAccountDetailEvent> get copyWith => __$OperationsChangedAccountDetailEventCopyWithImpl<_OperationsChangedAccountDetailEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationsChangedAccountDetailEvent&&const DeepCollectionEquality().equals(other._operations, _operations));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_operations));

@override
String toString() {
  return 'AccountDetailEvent.operationsChanged(operations: $operations)';
}


}

/// @nodoc
abstract mixin class _$OperationsChangedAccountDetailEventCopyWith<$Res> implements $AccountDetailEventCopyWith<$Res> {
  factory _$OperationsChangedAccountDetailEventCopyWith(_OperationsChangedAccountDetailEvent value, $Res Function(_OperationsChangedAccountDetailEvent) _then) = __$OperationsChangedAccountDetailEventCopyWithImpl;
@useResult
$Res call({
 List<OperationView> operations
});




}
/// @nodoc
class __$OperationsChangedAccountDetailEventCopyWithImpl<$Res>
    implements _$OperationsChangedAccountDetailEventCopyWith<$Res> {
  __$OperationsChangedAccountDetailEventCopyWithImpl(this._self, this._then);

  final _OperationsChangedAccountDetailEvent _self;
  final $Res Function(_OperationsChangedAccountDetailEvent) _then;

/// Create a copy of AccountDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? operations = null,}) {
  return _then(_OperationsChangedAccountDetailEvent(
null == operations ? _self._operations : operations // ignore: cast_nullable_to_non_nullable
as List<OperationView>,
  ));
}


}

/// @nodoc
mixin _$AccountDetailState {

 String get title; List<OperationView> get operations;
/// Create a copy of AccountDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountDetailStateCopyWith<AccountDetailState> get copyWith => _$AccountDetailStateCopyWithImpl<AccountDetailState>(this as AccountDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountDetailState&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.operations, operations));
}


@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(operations));

@override
String toString() {
  return 'AccountDetailState(title: $title, operations: $operations)';
}


}

/// @nodoc
abstract mixin class $AccountDetailStateCopyWith<$Res>  {
  factory $AccountDetailStateCopyWith(AccountDetailState value, $Res Function(AccountDetailState) _then) = _$AccountDetailStateCopyWithImpl;
@useResult
$Res call({
 String title, List<OperationView> operations
});




}
/// @nodoc
class _$AccountDetailStateCopyWithImpl<$Res>
    implements $AccountDetailStateCopyWith<$Res> {
  _$AccountDetailStateCopyWithImpl(this._self, this._then);

  final AccountDetailState _self;
  final $Res Function(AccountDetailState) _then;

/// Create a copy of AccountDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? operations = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,operations: null == operations ? _self.operations : operations // ignore: cast_nullable_to_non_nullable
as List<OperationView>,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountDetailState].
extension AccountDetailStatePatterns on AccountDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountDetailState value)  $default,){
final _that = this;
switch (_that) {
case _AccountDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _AccountDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  List<OperationView> operations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountDetailState() when $default != null:
return $default(_that.title,_that.operations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  List<OperationView> operations)  $default,) {final _that = this;
switch (_that) {
case _AccountDetailState():
return $default(_that.title,_that.operations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  List<OperationView> operations)?  $default,) {final _that = this;
switch (_that) {
case _AccountDetailState() when $default != null:
return $default(_that.title,_that.operations);case _:
  return null;

}
}

}

/// @nodoc


class _AccountDetailState implements AccountDetailState {
  const _AccountDetailState({required this.title, required final  List<OperationView> operations}): _operations = operations;
  

@override final  String title;
 final  List<OperationView> _operations;
@override List<OperationView> get operations {
  if (_operations is EqualUnmodifiableListView) return _operations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_operations);
}


/// Create a copy of AccountDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountDetailStateCopyWith<_AccountDetailState> get copyWith => __$AccountDetailStateCopyWithImpl<_AccountDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountDetailState&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._operations, _operations));
}


@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_operations));

@override
String toString() {
  return 'AccountDetailState(title: $title, operations: $operations)';
}


}

/// @nodoc
abstract mixin class _$AccountDetailStateCopyWith<$Res> implements $AccountDetailStateCopyWith<$Res> {
  factory _$AccountDetailStateCopyWith(_AccountDetailState value, $Res Function(_AccountDetailState) _then) = __$AccountDetailStateCopyWithImpl;
@override @useResult
$Res call({
 String title, List<OperationView> operations
});




}
/// @nodoc
class __$AccountDetailStateCopyWithImpl<$Res>
    implements _$AccountDetailStateCopyWith<$Res> {
  __$AccountDetailStateCopyWithImpl(this._self, this._then);

  final _AccountDetailState _self;
  final $Res Function(_AccountDetailState) _then;

/// Create a copy of AccountDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? operations = null,}) {
  return _then(_AccountDetailState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,operations: null == operations ? _self._operations : operations // ignore: cast_nullable_to_non_nullable
as List<OperationView>,
  ));
}


}

// dart format on
