// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_drive_settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DriveEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String catalogId, String fileName) backup,
    required TResult Function(String fileId) restore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String catalogId, String fileName)? backup,
    TResult? Function(String fileId)? restore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String catalogId, String fileName)? backup,
    TResult Function(String fileId)? restore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BackupDriveEvent value) backup,
    required TResult Function(_RestoreDriveEvent value) restore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BackupDriveEvent value)? backup,
    TResult? Function(_RestoreDriveEvent value)? restore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BackupDriveEvent value)? backup,
    TResult Function(_RestoreDriveEvent value)? restore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriveEventCopyWith<$Res> {
  factory $DriveEventCopyWith(
          DriveEvent value, $Res Function(DriveEvent) then) =
      _$DriveEventCopyWithImpl<$Res, DriveEvent>;
}

/// @nodoc
class _$DriveEventCopyWithImpl<$Res, $Val extends DriveEvent>
    implements $DriveEventCopyWith<$Res> {
  _$DriveEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_BackupDriveEventCopyWith<$Res> {
  factory _$$_BackupDriveEventCopyWith(
          _$_BackupDriveEvent value, $Res Function(_$_BackupDriveEvent) then) =
      __$$_BackupDriveEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String catalogId, String fileName});
}

/// @nodoc
class __$$_BackupDriveEventCopyWithImpl<$Res>
    extends _$DriveEventCopyWithImpl<$Res, _$_BackupDriveEvent>
    implements _$$_BackupDriveEventCopyWith<$Res> {
  __$$_BackupDriveEventCopyWithImpl(
      _$_BackupDriveEvent _value, $Res Function(_$_BackupDriveEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catalogId = null,
    Object? fileName = null,
  }) {
    return _then(_$_BackupDriveEvent(
      catalogId: null == catalogId
          ? _value.catalogId
          : catalogId // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BackupDriveEvent implements _BackupDriveEvent {
  const _$_BackupDriveEvent({required this.catalogId, required this.fileName});

  @override
  final String catalogId;
  @override
  final String fileName;

  @override
  String toString() {
    return 'DriveEvent.backup(catalogId: $catalogId, fileName: $fileName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BackupDriveEvent &&
            (identical(other.catalogId, catalogId) ||
                other.catalogId == catalogId) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, catalogId, fileName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BackupDriveEventCopyWith<_$_BackupDriveEvent> get copyWith =>
      __$$_BackupDriveEventCopyWithImpl<_$_BackupDriveEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String catalogId, String fileName) backup,
    required TResult Function(String fileId) restore,
  }) {
    return backup(catalogId, fileName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String catalogId, String fileName)? backup,
    TResult? Function(String fileId)? restore,
  }) {
    return backup?.call(catalogId, fileName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String catalogId, String fileName)? backup,
    TResult Function(String fileId)? restore,
    required TResult orElse(),
  }) {
    if (backup != null) {
      return backup(catalogId, fileName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BackupDriveEvent value) backup,
    required TResult Function(_RestoreDriveEvent value) restore,
  }) {
    return backup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BackupDriveEvent value)? backup,
    TResult? Function(_RestoreDriveEvent value)? restore,
  }) {
    return backup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BackupDriveEvent value)? backup,
    TResult Function(_RestoreDriveEvent value)? restore,
    required TResult orElse(),
  }) {
    if (backup != null) {
      return backup(this);
    }
    return orElse();
  }
}

abstract class _BackupDriveEvent implements DriveEvent {
  const factory _BackupDriveEvent(
      {required final String catalogId,
      required final String fileName}) = _$_BackupDriveEvent;

  String get catalogId;
  String get fileName;
  @JsonKey(ignore: true)
  _$$_BackupDriveEventCopyWith<_$_BackupDriveEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RestoreDriveEventCopyWith<$Res> {
  factory _$$_RestoreDriveEventCopyWith(_$_RestoreDriveEvent value,
          $Res Function(_$_RestoreDriveEvent) then) =
      __$$_RestoreDriveEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String fileId});
}

/// @nodoc
class __$$_RestoreDriveEventCopyWithImpl<$Res>
    extends _$DriveEventCopyWithImpl<$Res, _$_RestoreDriveEvent>
    implements _$$_RestoreDriveEventCopyWith<$Res> {
  __$$_RestoreDriveEventCopyWithImpl(
      _$_RestoreDriveEvent _value, $Res Function(_$_RestoreDriveEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = null,
  }) {
    return _then(_$_RestoreDriveEvent(
      fileId: null == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RestoreDriveEvent implements _RestoreDriveEvent {
  const _$_RestoreDriveEvent({required this.fileId});

  @override
  final String fileId;

  @override
  String toString() {
    return 'DriveEvent.restore(fileId: $fileId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestoreDriveEvent &&
            (identical(other.fileId, fileId) || other.fileId == fileId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestoreDriveEventCopyWith<_$_RestoreDriveEvent> get copyWith =>
      __$$_RestoreDriveEventCopyWithImpl<_$_RestoreDriveEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String catalogId, String fileName) backup,
    required TResult Function(String fileId) restore,
  }) {
    return restore(fileId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String catalogId, String fileName)? backup,
    TResult? Function(String fileId)? restore,
  }) {
    return restore?.call(fileId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String catalogId, String fileName)? backup,
    TResult Function(String fileId)? restore,
    required TResult orElse(),
  }) {
    if (restore != null) {
      return restore(fileId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BackupDriveEvent value) backup,
    required TResult Function(_RestoreDriveEvent value) restore,
  }) {
    return restore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BackupDriveEvent value)? backup,
    TResult? Function(_RestoreDriveEvent value)? restore,
  }) {
    return restore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BackupDriveEvent value)? backup,
    TResult Function(_RestoreDriveEvent value)? restore,
    required TResult orElse(),
  }) {
    if (restore != null) {
      return restore(this);
    }
    return orElse();
  }
}

abstract class _RestoreDriveEvent implements DriveEvent {
  const factory _RestoreDriveEvent({required final String fileId}) =
      _$_RestoreDriveEvent;

  String get fileId;
  @JsonKey(ignore: true)
  _$$_RestoreDriveEventCopyWith<_$_RestoreDriveEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DriveState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() failure,
    required TResult Function() successBackup,
    required TResult Function() successRestore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? failure,
    TResult? Function()? successBackup,
    TResult? Function()? successRestore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? failure,
    TResult Function()? successBackup,
    TResult Function()? successRestore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialDriveState value) initial,
    required TResult Function(_InProgressDriveState value) inProgress,
    required TResult Function(_FailureDriveState value) failure,
    required TResult Function(_SuccessBackupDriveState value) successBackup,
    required TResult Function(SuccessRestoreDriveState value) successRestore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialDriveState value)? initial,
    TResult? Function(_InProgressDriveState value)? inProgress,
    TResult? Function(_FailureDriveState value)? failure,
    TResult? Function(_SuccessBackupDriveState value)? successBackup,
    TResult? Function(SuccessRestoreDriveState value)? successRestore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialDriveState value)? initial,
    TResult Function(_InProgressDriveState value)? inProgress,
    TResult Function(_FailureDriveState value)? failure,
    TResult Function(_SuccessBackupDriveState value)? successBackup,
    TResult Function(SuccessRestoreDriveState value)? successRestore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriveStateCopyWith<$Res> {
  factory $DriveStateCopyWith(
          DriveState value, $Res Function(DriveState) then) =
      _$DriveStateCopyWithImpl<$Res, DriveState>;
}

/// @nodoc
class _$DriveStateCopyWithImpl<$Res, $Val extends DriveState>
    implements $DriveStateCopyWith<$Res> {
  _$DriveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialDriveStateCopyWith<$Res> {
  factory _$$_InitialDriveStateCopyWith(_$_InitialDriveState value,
          $Res Function(_$_InitialDriveState) then) =
      __$$_InitialDriveStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialDriveStateCopyWithImpl<$Res>
    extends _$DriveStateCopyWithImpl<$Res, _$_InitialDriveState>
    implements _$$_InitialDriveStateCopyWith<$Res> {
  __$$_InitialDriveStateCopyWithImpl(
      _$_InitialDriveState _value, $Res Function(_$_InitialDriveState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitialDriveState extends _InitialDriveState {
  const _$_InitialDriveState() : super._();

  @override
  String toString() {
    return 'DriveState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InitialDriveState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() failure,
    required TResult Function() successBackup,
    required TResult Function() successRestore,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? failure,
    TResult? Function()? successBackup,
    TResult? Function()? successRestore,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? failure,
    TResult Function()? successBackup,
    TResult Function()? successRestore,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialDriveState value) initial,
    required TResult Function(_InProgressDriveState value) inProgress,
    required TResult Function(_FailureDriveState value) failure,
    required TResult Function(_SuccessBackupDriveState value) successBackup,
    required TResult Function(SuccessRestoreDriveState value) successRestore,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialDriveState value)? initial,
    TResult? Function(_InProgressDriveState value)? inProgress,
    TResult? Function(_FailureDriveState value)? failure,
    TResult? Function(_SuccessBackupDriveState value)? successBackup,
    TResult? Function(SuccessRestoreDriveState value)? successRestore,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialDriveState value)? initial,
    TResult Function(_InProgressDriveState value)? inProgress,
    TResult Function(_FailureDriveState value)? failure,
    TResult Function(_SuccessBackupDriveState value)? successBackup,
    TResult Function(SuccessRestoreDriveState value)? successRestore,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialDriveState extends DriveState {
  const factory _InitialDriveState() = _$_InitialDriveState;
  const _InitialDriveState._() : super._();
}

/// @nodoc
abstract class _$$_InProgressDriveStateCopyWith<$Res> {
  factory _$$_InProgressDriveStateCopyWith(_$_InProgressDriveState value,
          $Res Function(_$_InProgressDriveState) then) =
      __$$_InProgressDriveStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InProgressDriveStateCopyWithImpl<$Res>
    extends _$DriveStateCopyWithImpl<$Res, _$_InProgressDriveState>
    implements _$$_InProgressDriveStateCopyWith<$Res> {
  __$$_InProgressDriveStateCopyWithImpl(_$_InProgressDriveState _value,
      $Res Function(_$_InProgressDriveState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InProgressDriveState extends _InProgressDriveState {
  const _$_InProgressDriveState() : super._();

  @override
  String toString() {
    return 'DriveState.inProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InProgressDriveState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() failure,
    required TResult Function() successBackup,
    required TResult Function() successRestore,
  }) {
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? failure,
    TResult? Function()? successBackup,
    TResult? Function()? successRestore,
  }) {
    return inProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? failure,
    TResult Function()? successBackup,
    TResult Function()? successRestore,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialDriveState value) initial,
    required TResult Function(_InProgressDriveState value) inProgress,
    required TResult Function(_FailureDriveState value) failure,
    required TResult Function(_SuccessBackupDriveState value) successBackup,
    required TResult Function(SuccessRestoreDriveState value) successRestore,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialDriveState value)? initial,
    TResult? Function(_InProgressDriveState value)? inProgress,
    TResult? Function(_FailureDriveState value)? failure,
    TResult? Function(_SuccessBackupDriveState value)? successBackup,
    TResult? Function(SuccessRestoreDriveState value)? successRestore,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialDriveState value)? initial,
    TResult Function(_InProgressDriveState value)? inProgress,
    TResult Function(_FailureDriveState value)? failure,
    TResult Function(_SuccessBackupDriveState value)? successBackup,
    TResult Function(SuccessRestoreDriveState value)? successRestore,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _InProgressDriveState extends DriveState {
  const factory _InProgressDriveState() = _$_InProgressDriveState;
  const _InProgressDriveState._() : super._();
}

/// @nodoc
abstract class _$$_FailureDriveStateCopyWith<$Res> {
  factory _$$_FailureDriveStateCopyWith(_$_FailureDriveState value,
          $Res Function(_$_FailureDriveState) then) =
      __$$_FailureDriveStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FailureDriveStateCopyWithImpl<$Res>
    extends _$DriveStateCopyWithImpl<$Res, _$_FailureDriveState>
    implements _$$_FailureDriveStateCopyWith<$Res> {
  __$$_FailureDriveStateCopyWithImpl(
      _$_FailureDriveState _value, $Res Function(_$_FailureDriveState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FailureDriveState extends _FailureDriveState {
  const _$_FailureDriveState() : super._();

  @override
  String toString() {
    return 'DriveState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FailureDriveState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() failure,
    required TResult Function() successBackup,
    required TResult Function() successRestore,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? failure,
    TResult? Function()? successBackup,
    TResult? Function()? successRestore,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? failure,
    TResult Function()? successBackup,
    TResult Function()? successRestore,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialDriveState value) initial,
    required TResult Function(_InProgressDriveState value) inProgress,
    required TResult Function(_FailureDriveState value) failure,
    required TResult Function(_SuccessBackupDriveState value) successBackup,
    required TResult Function(SuccessRestoreDriveState value) successRestore,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialDriveState value)? initial,
    TResult? Function(_InProgressDriveState value)? inProgress,
    TResult? Function(_FailureDriveState value)? failure,
    TResult? Function(_SuccessBackupDriveState value)? successBackup,
    TResult? Function(SuccessRestoreDriveState value)? successRestore,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialDriveState value)? initial,
    TResult Function(_InProgressDriveState value)? inProgress,
    TResult Function(_FailureDriveState value)? failure,
    TResult Function(_SuccessBackupDriveState value)? successBackup,
    TResult Function(SuccessRestoreDriveState value)? successRestore,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _FailureDriveState extends DriveState {
  const factory _FailureDriveState() = _$_FailureDriveState;
  const _FailureDriveState._() : super._();
}

/// @nodoc
abstract class _$$_SuccessBackupDriveStateCopyWith<$Res> {
  factory _$$_SuccessBackupDriveStateCopyWith(_$_SuccessBackupDriveState value,
          $Res Function(_$_SuccessBackupDriveState) then) =
      __$$_SuccessBackupDriveStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccessBackupDriveStateCopyWithImpl<$Res>
    extends _$DriveStateCopyWithImpl<$Res, _$_SuccessBackupDriveState>
    implements _$$_SuccessBackupDriveStateCopyWith<$Res> {
  __$$_SuccessBackupDriveStateCopyWithImpl(_$_SuccessBackupDriveState _value,
      $Res Function(_$_SuccessBackupDriveState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SuccessBackupDriveState extends _SuccessBackupDriveState {
  const _$_SuccessBackupDriveState() : super._();

  @override
  String toString() {
    return 'DriveState.successBackup()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuccessBackupDriveState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() failure,
    required TResult Function() successBackup,
    required TResult Function() successRestore,
  }) {
    return successBackup();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? failure,
    TResult? Function()? successBackup,
    TResult? Function()? successRestore,
  }) {
    return successBackup?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? failure,
    TResult Function()? successBackup,
    TResult Function()? successRestore,
    required TResult orElse(),
  }) {
    if (successBackup != null) {
      return successBackup();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialDriveState value) initial,
    required TResult Function(_InProgressDriveState value) inProgress,
    required TResult Function(_FailureDriveState value) failure,
    required TResult Function(_SuccessBackupDriveState value) successBackup,
    required TResult Function(SuccessRestoreDriveState value) successRestore,
  }) {
    return successBackup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialDriveState value)? initial,
    TResult? Function(_InProgressDriveState value)? inProgress,
    TResult? Function(_FailureDriveState value)? failure,
    TResult? Function(_SuccessBackupDriveState value)? successBackup,
    TResult? Function(SuccessRestoreDriveState value)? successRestore,
  }) {
    return successBackup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialDriveState value)? initial,
    TResult Function(_InProgressDriveState value)? inProgress,
    TResult Function(_FailureDriveState value)? failure,
    TResult Function(_SuccessBackupDriveState value)? successBackup,
    TResult Function(SuccessRestoreDriveState value)? successRestore,
    required TResult orElse(),
  }) {
    if (successBackup != null) {
      return successBackup(this);
    }
    return orElse();
  }
}

abstract class _SuccessBackupDriveState extends DriveState {
  const factory _SuccessBackupDriveState() = _$_SuccessBackupDriveState;
  const _SuccessBackupDriveState._() : super._();
}

/// @nodoc
abstract class _$$SuccessRestoreDriveStateCopyWith<$Res> {
  factory _$$SuccessRestoreDriveStateCopyWith(_$SuccessRestoreDriveState value,
          $Res Function(_$SuccessRestoreDriveState) then) =
      __$$SuccessRestoreDriveStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessRestoreDriveStateCopyWithImpl<$Res>
    extends _$DriveStateCopyWithImpl<$Res, _$SuccessRestoreDriveState>
    implements _$$SuccessRestoreDriveStateCopyWith<$Res> {
  __$$SuccessRestoreDriveStateCopyWithImpl(_$SuccessRestoreDriveState _value,
      $Res Function(_$SuccessRestoreDriveState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessRestoreDriveState extends SuccessRestoreDriveState {
  const _$SuccessRestoreDriveState() : super._();

  @override
  String toString() {
    return 'DriveState.successRestore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessRestoreDriveState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function() failure,
    required TResult Function() successBackup,
    required TResult Function() successRestore,
  }) {
    return successRestore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function()? failure,
    TResult? Function()? successBackup,
    TResult? Function()? successRestore,
  }) {
    return successRestore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function()? failure,
    TResult Function()? successBackup,
    TResult Function()? successRestore,
    required TResult orElse(),
  }) {
    if (successRestore != null) {
      return successRestore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialDriveState value) initial,
    required TResult Function(_InProgressDriveState value) inProgress,
    required TResult Function(_FailureDriveState value) failure,
    required TResult Function(_SuccessBackupDriveState value) successBackup,
    required TResult Function(SuccessRestoreDriveState value) successRestore,
  }) {
    return successRestore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialDriveState value)? initial,
    TResult? Function(_InProgressDriveState value)? inProgress,
    TResult? Function(_FailureDriveState value)? failure,
    TResult? Function(_SuccessBackupDriveState value)? successBackup,
    TResult? Function(SuccessRestoreDriveState value)? successRestore,
  }) {
    return successRestore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialDriveState value)? initial,
    TResult Function(_InProgressDriveState value)? inProgress,
    TResult Function(_FailureDriveState value)? failure,
    TResult Function(_SuccessBackupDriveState value)? successBackup,
    TResult Function(SuccessRestoreDriveState value)? successRestore,
    required TResult orElse(),
  }) {
    if (successRestore != null) {
      return successRestore(this);
    }
    return orElse();
  }
}

abstract class SuccessRestoreDriveState extends DriveState {
  const factory SuccessRestoreDriveState() = _$SuccessRestoreDriveState;
  const SuccessRestoreDriveState._() : super._();
}
