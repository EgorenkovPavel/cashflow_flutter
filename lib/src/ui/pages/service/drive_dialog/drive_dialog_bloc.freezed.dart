// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drive_dialog_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DialogDriveEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DialogDriveEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DialogDriveEvent()';
}


}

/// @nodoc
class $DialogDriveEventCopyWith<$Res>  {
$DialogDriveEventCopyWith(DialogDriveEvent _, $Res Function(DialogDriveEvent) __);
}


/// Adds pattern-matching-related methods to [DialogDriveEvent].
extension DialogDriveEventPatterns on DialogDriveEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitDialogDriveEvent value)?  init,TResult Function( _LoadFoldersDialogDriveEvent value)?  loadFolders,TResult Function( _OnFileTapDialogDriveEvent value)?  onFileTap,TResult Function( _BackPressedDialogDriveEvent value)?  backPressed,TResult Function( _ChooseDialogDriveEvent value)?  choose,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitDialogDriveEvent() when init != null:
return init(_that);case _LoadFoldersDialogDriveEvent() when loadFolders != null:
return loadFolders(_that);case _OnFileTapDialogDriveEvent() when onFileTap != null:
return onFileTap(_that);case _BackPressedDialogDriveEvent() when backPressed != null:
return backPressed(_that);case _ChooseDialogDriveEvent() when choose != null:
return choose(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitDialogDriveEvent value)  init,required TResult Function( _LoadFoldersDialogDriveEvent value)  loadFolders,required TResult Function( _OnFileTapDialogDriveEvent value)  onFileTap,required TResult Function( _BackPressedDialogDriveEvent value)  backPressed,required TResult Function( _ChooseDialogDriveEvent value)  choose,}){
final _that = this;
switch (_that) {
case _InitDialogDriveEvent():
return init(_that);case _LoadFoldersDialogDriveEvent():
return loadFolders(_that);case _OnFileTapDialogDriveEvent():
return onFileTap(_that);case _BackPressedDialogDriveEvent():
return backPressed(_that);case _ChooseDialogDriveEvent():
return choose(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitDialogDriveEvent value)?  init,TResult? Function( _LoadFoldersDialogDriveEvent value)?  loadFolders,TResult? Function( _OnFileTapDialogDriveEvent value)?  onFileTap,TResult? Function( _BackPressedDialogDriveEvent value)?  backPressed,TResult? Function( _ChooseDialogDriveEvent value)?  choose,}){
final _that = this;
switch (_that) {
case _InitDialogDriveEvent() when init != null:
return init(_that);case _LoadFoldersDialogDriveEvent() when loadFolders != null:
return loadFolders(_that);case _OnFileTapDialogDriveEvent() when onFileTap != null:
return onFileTap(_that);case _BackPressedDialogDriveEvent() when backPressed != null:
return backPressed(_that);case _ChooseDialogDriveEvent() when choose != null:
return choose(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  loadFolders,TResult Function( DriveFile file)?  onFileTap,TResult Function()?  backPressed,TResult Function()?  choose,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitDialogDriveEvent() when init != null:
return init();case _LoadFoldersDialogDriveEvent() when loadFolders != null:
return loadFolders();case _OnFileTapDialogDriveEvent() when onFileTap != null:
return onFileTap(_that.file);case _BackPressedDialogDriveEvent() when backPressed != null:
return backPressed();case _ChooseDialogDriveEvent() when choose != null:
return choose();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  loadFolders,required TResult Function( DriveFile file)  onFileTap,required TResult Function()  backPressed,required TResult Function()  choose,}) {final _that = this;
switch (_that) {
case _InitDialogDriveEvent():
return init();case _LoadFoldersDialogDriveEvent():
return loadFolders();case _OnFileTapDialogDriveEvent():
return onFileTap(_that.file);case _BackPressedDialogDriveEvent():
return backPressed();case _ChooseDialogDriveEvent():
return choose();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  loadFolders,TResult? Function( DriveFile file)?  onFileTap,TResult? Function()?  backPressed,TResult? Function()?  choose,}) {final _that = this;
switch (_that) {
case _InitDialogDriveEvent() when init != null:
return init();case _LoadFoldersDialogDriveEvent() when loadFolders != null:
return loadFolders();case _OnFileTapDialogDriveEvent() when onFileTap != null:
return onFileTap(_that.file);case _BackPressedDialogDriveEvent() when backPressed != null:
return backPressed();case _ChooseDialogDriveEvent() when choose != null:
return choose();case _:
  return null;

}
}

}

/// @nodoc


class _InitDialogDriveEvent implements DialogDriveEvent {
  const _InitDialogDriveEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitDialogDriveEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DialogDriveEvent.init()';
}


}




/// @nodoc


class _LoadFoldersDialogDriveEvent implements DialogDriveEvent {
  const _LoadFoldersDialogDriveEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadFoldersDialogDriveEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DialogDriveEvent.loadFolders()';
}


}




/// @nodoc


class _OnFileTapDialogDriveEvent implements DialogDriveEvent {
  const _OnFileTapDialogDriveEvent({required this.file});
  

 final  DriveFile file;

/// Create a copy of DialogDriveEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnFileTapDialogDriveEventCopyWith<_OnFileTapDialogDriveEvent> get copyWith => __$OnFileTapDialogDriveEventCopyWithImpl<_OnFileTapDialogDriveEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnFileTapDialogDriveEvent&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,file);

@override
String toString() {
  return 'DialogDriveEvent.onFileTap(file: $file)';
}


}

/// @nodoc
abstract mixin class _$OnFileTapDialogDriveEventCopyWith<$Res> implements $DialogDriveEventCopyWith<$Res> {
  factory _$OnFileTapDialogDriveEventCopyWith(_OnFileTapDialogDriveEvent value, $Res Function(_OnFileTapDialogDriveEvent) _then) = __$OnFileTapDialogDriveEventCopyWithImpl;
@useResult
$Res call({
 DriveFile file
});


$DriveFileCopyWith<$Res> get file;

}
/// @nodoc
class __$OnFileTapDialogDriveEventCopyWithImpl<$Res>
    implements _$OnFileTapDialogDriveEventCopyWith<$Res> {
  __$OnFileTapDialogDriveEventCopyWithImpl(this._self, this._then);

  final _OnFileTapDialogDriveEvent _self;
  final $Res Function(_OnFileTapDialogDriveEvent) _then;

/// Create a copy of DialogDriveEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? file = null,}) {
  return _then(_OnFileTapDialogDriveEvent(
file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as DriveFile,
  ));
}

/// Create a copy of DialogDriveEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriveFileCopyWith<$Res> get file {
  
  return $DriveFileCopyWith<$Res>(_self.file, (value) {
    return _then(_self.copyWith(file: value));
  });
}
}

/// @nodoc


class _BackPressedDialogDriveEvent implements DialogDriveEvent {
  const _BackPressedDialogDriveEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackPressedDialogDriveEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DialogDriveEvent.backPressed()';
}


}




/// @nodoc


class _ChooseDialogDriveEvent implements DialogDriveEvent {
  const _ChooseDialogDriveEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChooseDialogDriveEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DialogDriveEvent.choose()';
}


}




/// @nodoc
mixin _$DialogDriveState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DialogDriveState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DialogDriveState()';
}


}

/// @nodoc
class $DialogDriveStateCopyWith<$Res>  {
$DialogDriveStateCopyWith(DialogDriveState _, $Res Function(DialogDriveState) __);
}


/// Adds pattern-matching-related methods to [DialogDriveState].
extension DialogDriveStatePatterns on DialogDriveState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SuccessDialogDriveState value)?  success,TResult Function( _FailureDialogDriveState value)?  failure,TResult Function( _InProgressDialogDriveState value)?  inProgress,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuccessDialogDriveState() when success != null:
return success(_that);case _FailureDialogDriveState() when failure != null:
return failure(_that);case _InProgressDialogDriveState() when inProgress != null:
return inProgress(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SuccessDialogDriveState value)  success,required TResult Function( _FailureDialogDriveState value)  failure,required TResult Function( _InProgressDialogDriveState value)  inProgress,}){
final _that = this;
switch (_that) {
case _SuccessDialogDriveState():
return success(_that);case _FailureDialogDriveState():
return failure(_that);case _InProgressDialogDriveState():
return inProgress(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SuccessDialogDriveState value)?  success,TResult? Function( _FailureDialogDriveState value)?  failure,TResult? Function( _InProgressDialogDriveState value)?  inProgress,}){
final _that = this;
switch (_that) {
case _SuccessDialogDriveState() when success != null:
return success(_that);case _FailureDialogDriveState() when failure != null:
return failure(_that);case _InProgressDialogDriveState() when inProgress != null:
return inProgress(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DriveFile? result,  DialogDriveAction action,  List<DriveFile> folderList)?  success,TResult Function()?  failure,TResult Function()?  inProgress,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuccessDialogDriveState() when success != null:
return success(_that.result,_that.action,_that.folderList);case _FailureDialogDriveState() when failure != null:
return failure();case _InProgressDialogDriveState() when inProgress != null:
return inProgress();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DriveFile? result,  DialogDriveAction action,  List<DriveFile> folderList)  success,required TResult Function()  failure,required TResult Function()  inProgress,}) {final _that = this;
switch (_that) {
case _SuccessDialogDriveState():
return success(_that.result,_that.action,_that.folderList);case _FailureDialogDriveState():
return failure();case _InProgressDialogDriveState():
return inProgress();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DriveFile? result,  DialogDriveAction action,  List<DriveFile> folderList)?  success,TResult? Function()?  failure,TResult? Function()?  inProgress,}) {final _that = this;
switch (_that) {
case _SuccessDialogDriveState() when success != null:
return success(_that.result,_that.action,_that.folderList);case _FailureDialogDriveState() when failure != null:
return failure();case _InProgressDialogDriveState() when inProgress != null:
return inProgress();case _:
  return null;

}
}

}

/// @nodoc


class _SuccessDialogDriveState implements DialogDriveState {
  const _SuccessDialogDriveState({this.result, required this.action, required final  List<DriveFile> folderList}): _folderList = folderList;
  

 final  DriveFile? result;
 final  DialogDriveAction action;
 final  List<DriveFile> _folderList;
 List<DriveFile> get folderList {
  if (_folderList is EqualUnmodifiableListView) return _folderList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_folderList);
}


/// Create a copy of DialogDriveState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessDialogDriveStateCopyWith<_SuccessDialogDriveState> get copyWith => __$SuccessDialogDriveStateCopyWithImpl<_SuccessDialogDriveState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessDialogDriveState&&(identical(other.result, result) || other.result == result)&&(identical(other.action, action) || other.action == action)&&const DeepCollectionEquality().equals(other._folderList, _folderList));
}


@override
int get hashCode => Object.hash(runtimeType,result,action,const DeepCollectionEquality().hash(_folderList));

@override
String toString() {
  return 'DialogDriveState.success(result: $result, action: $action, folderList: $folderList)';
}


}

/// @nodoc
abstract mixin class _$SuccessDialogDriveStateCopyWith<$Res> implements $DialogDriveStateCopyWith<$Res> {
  factory _$SuccessDialogDriveStateCopyWith(_SuccessDialogDriveState value, $Res Function(_SuccessDialogDriveState) _then) = __$SuccessDialogDriveStateCopyWithImpl;
@useResult
$Res call({
 DriveFile? result, DialogDriveAction action, List<DriveFile> folderList
});


$DriveFileCopyWith<$Res>? get result;

}
/// @nodoc
class __$SuccessDialogDriveStateCopyWithImpl<$Res>
    implements _$SuccessDialogDriveStateCopyWith<$Res> {
  __$SuccessDialogDriveStateCopyWithImpl(this._self, this._then);

  final _SuccessDialogDriveState _self;
  final $Res Function(_SuccessDialogDriveState) _then;

/// Create a copy of DialogDriveState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = freezed,Object? action = null,Object? folderList = null,}) {
  return _then(_SuccessDialogDriveState(
result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as DriveFile?,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as DialogDriveAction,folderList: null == folderList ? _self._folderList : folderList // ignore: cast_nullable_to_non_nullable
as List<DriveFile>,
  ));
}

/// Create a copy of DialogDriveState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriveFileCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $DriveFileCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

/// @nodoc


class _FailureDialogDriveState implements DialogDriveState {
  const _FailureDialogDriveState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailureDialogDriveState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DialogDriveState.failure()';
}


}




/// @nodoc


class _InProgressDialogDriveState implements DialogDriveState {
  const _InProgressDialogDriveState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InProgressDialogDriveState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DialogDriveState.inProgress()';
}


}




// dart format on
