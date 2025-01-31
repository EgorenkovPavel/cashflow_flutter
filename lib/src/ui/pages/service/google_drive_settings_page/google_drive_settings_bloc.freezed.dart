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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$BackupDriveEventImplCopyWith<$Res> {
  factory _$$BackupDriveEventImplCopyWith(_$BackupDriveEventImpl value,
          $Res Function(_$BackupDriveEventImpl) then) =
      __$$BackupDriveEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String catalogId, String fileName});
}

/// @nodoc
class __$$BackupDriveEventImplCopyWithImpl<$Res>
    extends _$DriveEventCopyWithImpl<$Res, _$BackupDriveEventImpl>
    implements _$$BackupDriveEventImplCopyWith<$Res> {
  __$$BackupDriveEventImplCopyWithImpl(_$BackupDriveEventImpl _value,
      $Res Function(_$BackupDriveEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? catalogId = null,
    Object? fileName = null,
  }) {
    return _then(_$BackupDriveEventImpl(
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

class _$BackupDriveEventImpl implements _BackupDriveEvent {
  const _$BackupDriveEventImpl(
      {required this.catalogId, required this.fileName});

  @override
  final String catalogId;
  @override
  final String fileName;

  @override
  String toString() {
    return 'DriveEvent.backup(catalogId: $catalogId, fileName: $fileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackupDriveEventImpl &&
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
  _$$BackupDriveEventImplCopyWith<_$BackupDriveEventImpl> get copyWith =>
      __$$BackupDriveEventImplCopyWithImpl<_$BackupDriveEventImpl>(
          this, _$identity);

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
      required final String fileName}) = _$BackupDriveEventImpl;

  String get catalogId;
  String get fileName;
  @JsonKey(ignore: true)
  _$$BackupDriveEventImplCopyWith<_$BackupDriveEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RestoreDriveEventImplCopyWith<$Res> {
  factory _$$RestoreDriveEventImplCopyWith(_$RestoreDriveEventImpl value,
          $Res Function(_$RestoreDriveEventImpl) then) =
      __$$RestoreDriveEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String fileId});
}

/// @nodoc
class __$$RestoreDriveEventImplCopyWithImpl<$Res>
    extends _$DriveEventCopyWithImpl<$Res, _$RestoreDriveEventImpl>
    implements _$$RestoreDriveEventImplCopyWith<$Res> {
  __$$RestoreDriveEventImplCopyWithImpl(_$RestoreDriveEventImpl _value,
      $Res Function(_$RestoreDriveEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileId = null,
  }) {
    return _then(_$RestoreDriveEventImpl(
      fileId: null == fileId
          ? _value.fileId
          : fileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RestoreDriveEventImpl implements _RestoreDriveEvent {
  const _$RestoreDriveEventImpl({required this.fileId});

  @override
  final String fileId;

  @override
  String toString() {
    return 'DriveEvent.restore(fileId: $fileId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestoreDriveEventImpl &&
            (identical(other.fileId, fileId) || other.fileId == fileId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestoreDriveEventImplCopyWith<_$RestoreDriveEventImpl> get copyWith =>
      __$$RestoreDriveEventImplCopyWithImpl<_$RestoreDriveEventImpl>(
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
      _$RestoreDriveEventImpl;

  String get fileId;
  @JsonKey(ignore: true)
  _$$RestoreDriveEventImplCopyWith<_$RestoreDriveEventImpl> get copyWith =>
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
abstract class _$$InitialDriveStateImplCopyWith<$Res> {
  factory _$$InitialDriveStateImplCopyWith(_$InitialDriveStateImpl value,
          $Res Function(_$InitialDriveStateImpl) then) =
      __$$InitialDriveStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialDriveStateImplCopyWithImpl<$Res>
    extends _$DriveStateCopyWithImpl<$Res, _$InitialDriveStateImpl>
    implements _$$InitialDriveStateImplCopyWith<$Res> {
  __$$InitialDriveStateImplCopyWithImpl(_$InitialDriveStateImpl _value,
      $Res Function(_$InitialDriveStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialDriveStateImpl extends _InitialDriveState {
  const _$InitialDriveStateImpl() : super._();

  @override
  String toString() {
    return 'DriveState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialDriveStateImpl);
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
  const factory _InitialDriveState() = _$InitialDriveStateImpl;
  const _InitialDriveState._() : super._();
}

/// @nodoc
abstract class _$$InProgressDriveStateImplCopyWith<$Res> {
  factory _$$InProgressDriveStateImplCopyWith(_$InProgressDriveStateImpl value,
          $Res Function(_$InProgressDriveStateImpl) then) =
      __$$InProgressDriveStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InProgressDriveStateImplCopyWithImpl<$Res>
    extends _$DriveStateCopyWithImpl<$Res, _$InProgressDriveStateImpl>
    implements _$$InProgressDriveStateImplCopyWith<$Res> {
  __$$InProgressDriveStateImplCopyWithImpl(_$InProgressDriveStateImpl _value,
      $Res Function(_$InProgressDriveStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InProgressDriveStateImpl extends _InProgressDriveState {
  const _$InProgressDriveStateImpl() : super._();

  @override
  String toString() {
    return 'DriveState.inProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InProgressDriveStateImpl);
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
  const factory _InProgressDriveState() = _$InProgressDriveStateImpl;
  const _InProgressDriveState._() : super._();
}

/// @nodoc
abstract class _$$FailureDriveStateImplCopyWith<$Res> {
  factory _$$FailureDriveStateImplCopyWith(_$FailureDriveStateImpl value,
          $Res Function(_$FailureDriveStateImpl) then) =
      __$$FailureDriveStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailureDriveStateImplCopyWithImpl<$Res>
    extends _$DriveStateCopyWithImpl<$Res, _$FailureDriveStateImpl>
    implements _$$FailureDriveStateImplCopyWith<$Res> {
  __$$FailureDriveStateImplCopyWithImpl(_$FailureDriveStateImpl _value,
      $Res Function(_$FailureDriveStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FailureDriveStateImpl extends _FailureDriveState {
  const _$FailureDriveStateImpl() : super._();

  @override
  String toString() {
    return 'DriveState.failure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailureDriveStateImpl);
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
  const factory _FailureDriveState() = _$FailureDriveStateImpl;
  const _FailureDriveState._() : super._();
}

/// @nodoc
abstract class _$$SuccessBackupDriveStateImplCopyWith<$Res> {
  factory _$$SuccessBackupDriveStateImplCopyWith(
          _$SuccessBackupDriveStateImpl value,
          $Res Function(_$SuccessBackupDriveStateImpl) then) =
      __$$SuccessBackupDriveStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessBackupDriveStateImplCopyWithImpl<$Res>
    extends _$DriveStateCopyWithImpl<$Res, _$SuccessBackupDriveStateImpl>
    implements _$$SuccessBackupDriveStateImplCopyWith<$Res> {
  __$$SuccessBackupDriveStateImplCopyWithImpl(
      _$SuccessBackupDriveStateImpl _value,
      $Res Function(_$SuccessBackupDriveStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessBackupDriveStateImpl extends _SuccessBackupDriveState {
  const _$SuccessBackupDriveStateImpl() : super._();

  @override
  String toString() {
    return 'DriveState.successBackup()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessBackupDriveStateImpl);
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
  const factory _SuccessBackupDriveState() = _$SuccessBackupDriveStateImpl;
  const _SuccessBackupDriveState._() : super._();
}

/// @nodoc
abstract class _$$SuccessRestoreDriveStateImplCopyWith<$Res> {
  factory _$$SuccessRestoreDriveStateImplCopyWith(
          _$SuccessRestoreDriveStateImpl value,
          $Res Function(_$SuccessRestoreDriveStateImpl) then) =
      __$$SuccessRestoreDriveStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessRestoreDriveStateImplCopyWithImpl<$Res>
    extends _$DriveStateCopyWithImpl<$Res, _$SuccessRestoreDriveStateImpl>
    implements _$$SuccessRestoreDriveStateImplCopyWith<$Res> {
  __$$SuccessRestoreDriveStateImplCopyWithImpl(
      _$SuccessRestoreDriveStateImpl _value,
      $Res Function(_$SuccessRestoreDriveStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessRestoreDriveStateImpl extends SuccessRestoreDriveState {
  const _$SuccessRestoreDriveStateImpl() : super._();

  @override
  String toString() {
    return 'DriveState.successRestore()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessRestoreDriveStateImpl);
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
  const factory SuccessRestoreDriveState() = _$SuccessRestoreDriveStateImpl;
  const SuccessRestoreDriveState._() : super._();
}
