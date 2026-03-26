// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_drive_settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DriveEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriveEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveEvent()';
}


}

/// @nodoc
class $DriveEventCopyWith<$Res>  {
$DriveEventCopyWith(DriveEvent _, $Res Function(DriveEvent) __);
}


/// Adds pattern-matching-related methods to [DriveEvent].
extension DriveEventPatterns on DriveEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _BackupDriveEvent value)?  backup,TResult Function( _RestoreDriveEvent value)?  restore,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackupDriveEvent() when backup != null:
return backup(_that);case _RestoreDriveEvent() when restore != null:
return restore(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _BackupDriveEvent value)  backup,required TResult Function( _RestoreDriveEvent value)  restore,}){
final _that = this;
switch (_that) {
case _BackupDriveEvent():
return backup(_that);case _RestoreDriveEvent():
return restore(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _BackupDriveEvent value)?  backup,TResult? Function( _RestoreDriveEvent value)?  restore,}){
final _that = this;
switch (_that) {
case _BackupDriveEvent() when backup != null:
return backup(_that);case _RestoreDriveEvent() when restore != null:
return restore(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String catalogId,  String fileName)?  backup,TResult Function( String fileId)?  restore,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackupDriveEvent() when backup != null:
return backup(_that.catalogId,_that.fileName);case _RestoreDriveEvent() when restore != null:
return restore(_that.fileId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String catalogId,  String fileName)  backup,required TResult Function( String fileId)  restore,}) {final _that = this;
switch (_that) {
case _BackupDriveEvent():
return backup(_that.catalogId,_that.fileName);case _RestoreDriveEvent():
return restore(_that.fileId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String catalogId,  String fileName)?  backup,TResult? Function( String fileId)?  restore,}) {final _that = this;
switch (_that) {
case _BackupDriveEvent() when backup != null:
return backup(_that.catalogId,_that.fileName);case _RestoreDriveEvent() when restore != null:
return restore(_that.fileId);case _:
  return null;

}
}

}

/// @nodoc


class _BackupDriveEvent implements DriveEvent {
  const _BackupDriveEvent({required this.catalogId, required this.fileName});
  

 final  String catalogId;
 final  String fileName;

/// Create a copy of DriveEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackupDriveEventCopyWith<_BackupDriveEvent> get copyWith => __$BackupDriveEventCopyWithImpl<_BackupDriveEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackupDriveEvent&&(identical(other.catalogId, catalogId) || other.catalogId == catalogId)&&(identical(other.fileName, fileName) || other.fileName == fileName));
}


@override
int get hashCode => Object.hash(runtimeType,catalogId,fileName);

@override
String toString() {
  return 'DriveEvent.backup(catalogId: $catalogId, fileName: $fileName)';
}


}

/// @nodoc
abstract mixin class _$BackupDriveEventCopyWith<$Res> implements $DriveEventCopyWith<$Res> {
  factory _$BackupDriveEventCopyWith(_BackupDriveEvent value, $Res Function(_BackupDriveEvent) _then) = __$BackupDriveEventCopyWithImpl;
@useResult
$Res call({
 String catalogId, String fileName
});




}
/// @nodoc
class __$BackupDriveEventCopyWithImpl<$Res>
    implements _$BackupDriveEventCopyWith<$Res> {
  __$BackupDriveEventCopyWithImpl(this._self, this._then);

  final _BackupDriveEvent _self;
  final $Res Function(_BackupDriveEvent) _then;

/// Create a copy of DriveEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? catalogId = null,Object? fileName = null,}) {
  return _then(_BackupDriveEvent(
catalogId: null == catalogId ? _self.catalogId : catalogId // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RestoreDriveEvent implements DriveEvent {
  const _RestoreDriveEvent({required this.fileId});
  

 final  String fileId;

/// Create a copy of DriveEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestoreDriveEventCopyWith<_RestoreDriveEvent> get copyWith => __$RestoreDriveEventCopyWithImpl<_RestoreDriveEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestoreDriveEvent&&(identical(other.fileId, fileId) || other.fileId == fileId));
}


@override
int get hashCode => Object.hash(runtimeType,fileId);

@override
String toString() {
  return 'DriveEvent.restore(fileId: $fileId)';
}


}

/// @nodoc
abstract mixin class _$RestoreDriveEventCopyWith<$Res> implements $DriveEventCopyWith<$Res> {
  factory _$RestoreDriveEventCopyWith(_RestoreDriveEvent value, $Res Function(_RestoreDriveEvent) _then) = __$RestoreDriveEventCopyWithImpl;
@useResult
$Res call({
 String fileId
});




}
/// @nodoc
class __$RestoreDriveEventCopyWithImpl<$Res>
    implements _$RestoreDriveEventCopyWith<$Res> {
  __$RestoreDriveEventCopyWithImpl(this._self, this._then);

  final _RestoreDriveEvent _self;
  final $Res Function(_RestoreDriveEvent) _then;

/// Create a copy of DriveEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fileId = null,}) {
  return _then(_RestoreDriveEvent(
fileId: null == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$DriveState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriveState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveState()';
}


}

/// @nodoc
class $DriveStateCopyWith<$Res>  {
$DriveStateCopyWith(DriveState _, $Res Function(DriveState) __);
}


/// Adds pattern-matching-related methods to [DriveState].
extension DriveStatePatterns on DriveState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _InitialDriveState value)?  initial,TResult Function( _InProgressDriveState value)?  inProgress,TResult Function( _FailureDriveState value)?  failure,TResult Function( _SuccessBackupDriveState value)?  successBackup,TResult Function( SuccessRestoreDriveState value)?  successRestore,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InitialDriveState() when initial != null:
return initial(_that);case _InProgressDriveState() when inProgress != null:
return inProgress(_that);case _FailureDriveState() when failure != null:
return failure(_that);case _SuccessBackupDriveState() when successBackup != null:
return successBackup(_that);case SuccessRestoreDriveState() when successRestore != null:
return successRestore(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _InitialDriveState value)  initial,required TResult Function( _InProgressDriveState value)  inProgress,required TResult Function( _FailureDriveState value)  failure,required TResult Function( _SuccessBackupDriveState value)  successBackup,required TResult Function( SuccessRestoreDriveState value)  successRestore,}){
final _that = this;
switch (_that) {
case _InitialDriveState():
return initial(_that);case _InProgressDriveState():
return inProgress(_that);case _FailureDriveState():
return failure(_that);case _SuccessBackupDriveState():
return successBackup(_that);case SuccessRestoreDriveState():
return successRestore(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _InitialDriveState value)?  initial,TResult? Function( _InProgressDriveState value)?  inProgress,TResult? Function( _FailureDriveState value)?  failure,TResult? Function( _SuccessBackupDriveState value)?  successBackup,TResult? Function( SuccessRestoreDriveState value)?  successRestore,}){
final _that = this;
switch (_that) {
case _InitialDriveState() when initial != null:
return initial(_that);case _InProgressDriveState() when inProgress != null:
return inProgress(_that);case _FailureDriveState() when failure != null:
return failure(_that);case _SuccessBackupDriveState() when successBackup != null:
return successBackup(_that);case SuccessRestoreDriveState() when successRestore != null:
return successRestore(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  inProgress,TResult Function()?  failure,TResult Function()?  successBackup,TResult Function()?  successRestore,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InitialDriveState() when initial != null:
return initial();case _InProgressDriveState() when inProgress != null:
return inProgress();case _FailureDriveState() when failure != null:
return failure();case _SuccessBackupDriveState() when successBackup != null:
return successBackup();case SuccessRestoreDriveState() when successRestore != null:
return successRestore();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  inProgress,required TResult Function()  failure,required TResult Function()  successBackup,required TResult Function()  successRestore,}) {final _that = this;
switch (_that) {
case _InitialDriveState():
return initial();case _InProgressDriveState():
return inProgress();case _FailureDriveState():
return failure();case _SuccessBackupDriveState():
return successBackup();case SuccessRestoreDriveState():
return successRestore();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  inProgress,TResult? Function()?  failure,TResult? Function()?  successBackup,TResult? Function()?  successRestore,}) {final _that = this;
switch (_that) {
case _InitialDriveState() when initial != null:
return initial();case _InProgressDriveState() when inProgress != null:
return inProgress();case _FailureDriveState() when failure != null:
return failure();case _SuccessBackupDriveState() when successBackup != null:
return successBackup();case SuccessRestoreDriveState() when successRestore != null:
return successRestore();case _:
  return null;

}
}

}

/// @nodoc


class _InitialDriveState extends DriveState {
  const _InitialDriveState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InitialDriveState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveState.initial()';
}


}




/// @nodoc


class _InProgressDriveState extends DriveState {
  const _InProgressDriveState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InProgressDriveState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveState.inProgress()';
}


}




/// @nodoc


class _FailureDriveState extends DriveState {
  const _FailureDriveState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailureDriveState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveState.failure()';
}


}




/// @nodoc


class _SuccessBackupDriveState extends DriveState {
  const _SuccessBackupDriveState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuccessBackupDriveState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveState.successBackup()';
}


}




/// @nodoc


class SuccessRestoreDriveState extends DriveState {
  const SuccessRestoreDriveState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessRestoreDriveState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveState.successRestore()';
}


}




// dart format on
