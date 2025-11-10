// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_control_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DataControlEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataControlEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DataControlEvent()';
}


}

/// @nodoc
class $DataControlEventCopyWith<$Res>  {
$DataControlEventCopyWith(DataControlEvent _, $Res Function(DataControlEvent) __);
}


/// Adds pattern-matching-related methods to [DataControlEvent].
extension DataControlEventPatterns on DataControlEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _DeleteAllDataControlEvent value)?  deleteAll,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeleteAllDataControlEvent() when deleteAll != null:
return deleteAll(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _DeleteAllDataControlEvent value)  deleteAll,}){
final _that = this;
switch (_that) {
case _DeleteAllDataControlEvent():
return deleteAll(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _DeleteAllDataControlEvent value)?  deleteAll,}){
final _that = this;
switch (_that) {
case _DeleteAllDataControlEvent() when deleteAll != null:
return deleteAll(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  deleteAll,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeleteAllDataControlEvent() when deleteAll != null:
return deleteAll();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  deleteAll,}) {final _that = this;
switch (_that) {
case _DeleteAllDataControlEvent():
return deleteAll();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  deleteAll,}) {final _that = this;
switch (_that) {
case _DeleteAllDataControlEvent() when deleteAll != null:
return deleteAll();case _:
  return null;

}
}

}

/// @nodoc


class _DeleteAllDataControlEvent implements DataControlEvent {
  const _DeleteAllDataControlEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteAllDataControlEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DataControlEvent.deleteAll()';
}


}




/// @nodoc
mixin _$DataControlState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataControlState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DataControlState()';
}


}

/// @nodoc
class $DataControlStateCopyWith<$Res>  {
$DataControlStateCopyWith(DataControlState _, $Res Function(DataControlState) __);
}


/// Adds pattern-matching-related methods to [DataControlState].
extension DataControlStatePatterns on DataControlState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitialDataControlState value)?  initial,TResult Function( _InProgressDataControlState value)?  inProgress,TResult Function( _SuccessDataControlState value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialDataControlState() when initial != null:
return initial(_that);case _InProgressDataControlState() when inProgress != null:
return inProgress(_that);case _SuccessDataControlState() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitialDataControlState value)  initial,required TResult Function( _InProgressDataControlState value)  inProgress,required TResult Function( _SuccessDataControlState value)  success,}){
final _that = this;
switch (_that) {
case _InitialDataControlState():
return initial(_that);case _InProgressDataControlState():
return inProgress(_that);case _SuccessDataControlState():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitialDataControlState value)?  initial,TResult? Function( _InProgressDataControlState value)?  inProgress,TResult? Function( _SuccessDataControlState value)?  success,}){
final _that = this;
switch (_that) {
case _InitialDataControlState() when initial != null:
return initial(_that);case _InProgressDataControlState() when inProgress != null:
return inProgress(_that);case _SuccessDataControlState() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  inProgress,TResult Function()?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitialDataControlState() when initial != null:
return initial();case _InProgressDataControlState() when inProgress != null:
return inProgress();case _SuccessDataControlState() when success != null:
return success();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  inProgress,required TResult Function()  success,}) {final _that = this;
switch (_that) {
case _InitialDataControlState():
return initial();case _InProgressDataControlState():
return inProgress();case _SuccessDataControlState():
return success();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  inProgress,TResult? Function()?  success,}) {final _that = this;
switch (_that) {
case _InitialDataControlState() when initial != null:
return initial();case _InProgressDataControlState() when inProgress != null:
return inProgress();case _SuccessDataControlState() when success != null:
return success();case _:
  return null;

}
}

}

/// @nodoc


class _InitialDataControlState extends DataControlState {
  const _InitialDataControlState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialDataControlState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DataControlState.initial()';
}


}




/// @nodoc


class _InProgressDataControlState extends DataControlState {
  const _InProgressDataControlState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InProgressDataControlState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DataControlState.inProgress()';
}


}




/// @nodoc


class _SuccessDataControlState extends DataControlState {
  const _SuccessDataControlState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessDataControlState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DataControlState.success()';
}


}




// dart format on
