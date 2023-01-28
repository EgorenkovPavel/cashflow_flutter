// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drive_dialog_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DialogDriveEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadFolders,
    required TResult Function(DriveFile file) onFileTap,
    required TResult Function() backPressed,
    required TResult Function() choose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadFolders,
    TResult? Function(DriveFile file)? onFileTap,
    TResult? Function()? backPressed,
    TResult? Function()? choose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadFolders,
    TResult Function(DriveFile file)? onFileTap,
    TResult Function()? backPressed,
    TResult Function()? choose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitDialogDriveEvent value) init,
    required TResult Function(_LoadFoldersDialogDriveEvent value) loadFolders,
    required TResult Function(_OnFileTapDialogDriveEvent value) onFileTap,
    required TResult Function(_BackPressedDialogDriveEvent value) backPressed,
    required TResult Function(_ChooseDialogDriveEvent value) choose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitDialogDriveEvent value)? init,
    TResult? Function(_LoadFoldersDialogDriveEvent value)? loadFolders,
    TResult? Function(_OnFileTapDialogDriveEvent value)? onFileTap,
    TResult? Function(_BackPressedDialogDriveEvent value)? backPressed,
    TResult? Function(_ChooseDialogDriveEvent value)? choose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitDialogDriveEvent value)? init,
    TResult Function(_LoadFoldersDialogDriveEvent value)? loadFolders,
    TResult Function(_OnFileTapDialogDriveEvent value)? onFileTap,
    TResult Function(_BackPressedDialogDriveEvent value)? backPressed,
    TResult Function(_ChooseDialogDriveEvent value)? choose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogDriveEventCopyWith<$Res> {
  factory $DialogDriveEventCopyWith(
          DialogDriveEvent value, $Res Function(DialogDriveEvent) then) =
      _$DialogDriveEventCopyWithImpl<$Res, DialogDriveEvent>;
}

/// @nodoc
class _$DialogDriveEventCopyWithImpl<$Res, $Val extends DialogDriveEvent>
    implements $DialogDriveEventCopyWith<$Res> {
  _$DialogDriveEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitDialogDriveEventCopyWith<$Res> {
  factory _$$_InitDialogDriveEventCopyWith(_$_InitDialogDriveEvent value,
          $Res Function(_$_InitDialogDriveEvent) then) =
      __$$_InitDialogDriveEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitDialogDriveEventCopyWithImpl<$Res>
    extends _$DialogDriveEventCopyWithImpl<$Res, _$_InitDialogDriveEvent>
    implements _$$_InitDialogDriveEventCopyWith<$Res> {
  __$$_InitDialogDriveEventCopyWithImpl(_$_InitDialogDriveEvent _value,
      $Res Function(_$_InitDialogDriveEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitDialogDriveEvent implements _InitDialogDriveEvent {
  const _$_InitDialogDriveEvent();

  @override
  String toString() {
    return 'DialogDriveEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InitDialogDriveEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadFolders,
    required TResult Function(DriveFile file) onFileTap,
    required TResult Function() backPressed,
    required TResult Function() choose,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadFolders,
    TResult? Function(DriveFile file)? onFileTap,
    TResult? Function()? backPressed,
    TResult? Function()? choose,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadFolders,
    TResult Function(DriveFile file)? onFileTap,
    TResult Function()? backPressed,
    TResult Function()? choose,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitDialogDriveEvent value) init,
    required TResult Function(_LoadFoldersDialogDriveEvent value) loadFolders,
    required TResult Function(_OnFileTapDialogDriveEvent value) onFileTap,
    required TResult Function(_BackPressedDialogDriveEvent value) backPressed,
    required TResult Function(_ChooseDialogDriveEvent value) choose,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitDialogDriveEvent value)? init,
    TResult? Function(_LoadFoldersDialogDriveEvent value)? loadFolders,
    TResult? Function(_OnFileTapDialogDriveEvent value)? onFileTap,
    TResult? Function(_BackPressedDialogDriveEvent value)? backPressed,
    TResult? Function(_ChooseDialogDriveEvent value)? choose,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitDialogDriveEvent value)? init,
    TResult Function(_LoadFoldersDialogDriveEvent value)? loadFolders,
    TResult Function(_OnFileTapDialogDriveEvent value)? onFileTap,
    TResult Function(_BackPressedDialogDriveEvent value)? backPressed,
    TResult Function(_ChooseDialogDriveEvent value)? choose,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _InitDialogDriveEvent implements DialogDriveEvent {
  const factory _InitDialogDriveEvent() = _$_InitDialogDriveEvent;
}

/// @nodoc
abstract class _$$_LoadFoldersDialogDriveEventCopyWith<$Res> {
  factory _$$_LoadFoldersDialogDriveEventCopyWith(
          _$_LoadFoldersDialogDriveEvent value,
          $Res Function(_$_LoadFoldersDialogDriveEvent) then) =
      __$$_LoadFoldersDialogDriveEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadFoldersDialogDriveEventCopyWithImpl<$Res>
    extends _$DialogDriveEventCopyWithImpl<$Res, _$_LoadFoldersDialogDriveEvent>
    implements _$$_LoadFoldersDialogDriveEventCopyWith<$Res> {
  __$$_LoadFoldersDialogDriveEventCopyWithImpl(
      _$_LoadFoldersDialogDriveEvent _value,
      $Res Function(_$_LoadFoldersDialogDriveEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadFoldersDialogDriveEvent implements _LoadFoldersDialogDriveEvent {
  const _$_LoadFoldersDialogDriveEvent();

  @override
  String toString() {
    return 'DialogDriveEvent.loadFolders()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadFoldersDialogDriveEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadFolders,
    required TResult Function(DriveFile file) onFileTap,
    required TResult Function() backPressed,
    required TResult Function() choose,
  }) {
    return loadFolders();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadFolders,
    TResult? Function(DriveFile file)? onFileTap,
    TResult? Function()? backPressed,
    TResult? Function()? choose,
  }) {
    return loadFolders?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadFolders,
    TResult Function(DriveFile file)? onFileTap,
    TResult Function()? backPressed,
    TResult Function()? choose,
    required TResult orElse(),
  }) {
    if (loadFolders != null) {
      return loadFolders();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitDialogDriveEvent value) init,
    required TResult Function(_LoadFoldersDialogDriveEvent value) loadFolders,
    required TResult Function(_OnFileTapDialogDriveEvent value) onFileTap,
    required TResult Function(_BackPressedDialogDriveEvent value) backPressed,
    required TResult Function(_ChooseDialogDriveEvent value) choose,
  }) {
    return loadFolders(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitDialogDriveEvent value)? init,
    TResult? Function(_LoadFoldersDialogDriveEvent value)? loadFolders,
    TResult? Function(_OnFileTapDialogDriveEvent value)? onFileTap,
    TResult? Function(_BackPressedDialogDriveEvent value)? backPressed,
    TResult? Function(_ChooseDialogDriveEvent value)? choose,
  }) {
    return loadFolders?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitDialogDriveEvent value)? init,
    TResult Function(_LoadFoldersDialogDriveEvent value)? loadFolders,
    TResult Function(_OnFileTapDialogDriveEvent value)? onFileTap,
    TResult Function(_BackPressedDialogDriveEvent value)? backPressed,
    TResult Function(_ChooseDialogDriveEvent value)? choose,
    required TResult orElse(),
  }) {
    if (loadFolders != null) {
      return loadFolders(this);
    }
    return orElse();
  }
}

abstract class _LoadFoldersDialogDriveEvent implements DialogDriveEvent {
  const factory _LoadFoldersDialogDriveEvent() = _$_LoadFoldersDialogDriveEvent;
}

/// @nodoc
abstract class _$$_OnFileTapDialogDriveEventCopyWith<$Res> {
  factory _$$_OnFileTapDialogDriveEventCopyWith(
          _$_OnFileTapDialogDriveEvent value,
          $Res Function(_$_OnFileTapDialogDriveEvent) then) =
      __$$_OnFileTapDialogDriveEventCopyWithImpl<$Res>;
  @useResult
  $Res call({DriveFile file});
}

/// @nodoc
class __$$_OnFileTapDialogDriveEventCopyWithImpl<$Res>
    extends _$DialogDriveEventCopyWithImpl<$Res, _$_OnFileTapDialogDriveEvent>
    implements _$$_OnFileTapDialogDriveEventCopyWith<$Res> {
  __$$_OnFileTapDialogDriveEventCopyWithImpl(
      _$_OnFileTapDialogDriveEvent _value,
      $Res Function(_$_OnFileTapDialogDriveEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$_OnFileTapDialogDriveEvent(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as DriveFile,
    ));
  }
}

/// @nodoc

class _$_OnFileTapDialogDriveEvent implements _OnFileTapDialogDriveEvent {
  const _$_OnFileTapDialogDriveEvent({required this.file});

  @override
  final DriveFile file;

  @override
  String toString() {
    return 'DialogDriveEvent.onFileTap(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnFileTapDialogDriveEvent &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnFileTapDialogDriveEventCopyWith<_$_OnFileTapDialogDriveEvent>
      get copyWith => __$$_OnFileTapDialogDriveEventCopyWithImpl<
          _$_OnFileTapDialogDriveEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadFolders,
    required TResult Function(DriveFile file) onFileTap,
    required TResult Function() backPressed,
    required TResult Function() choose,
  }) {
    return onFileTap(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadFolders,
    TResult? Function(DriveFile file)? onFileTap,
    TResult? Function()? backPressed,
    TResult? Function()? choose,
  }) {
    return onFileTap?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadFolders,
    TResult Function(DriveFile file)? onFileTap,
    TResult Function()? backPressed,
    TResult Function()? choose,
    required TResult orElse(),
  }) {
    if (onFileTap != null) {
      return onFileTap(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitDialogDriveEvent value) init,
    required TResult Function(_LoadFoldersDialogDriveEvent value) loadFolders,
    required TResult Function(_OnFileTapDialogDriveEvent value) onFileTap,
    required TResult Function(_BackPressedDialogDriveEvent value) backPressed,
    required TResult Function(_ChooseDialogDriveEvent value) choose,
  }) {
    return onFileTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitDialogDriveEvent value)? init,
    TResult? Function(_LoadFoldersDialogDriveEvent value)? loadFolders,
    TResult? Function(_OnFileTapDialogDriveEvent value)? onFileTap,
    TResult? Function(_BackPressedDialogDriveEvent value)? backPressed,
    TResult? Function(_ChooseDialogDriveEvent value)? choose,
  }) {
    return onFileTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitDialogDriveEvent value)? init,
    TResult Function(_LoadFoldersDialogDriveEvent value)? loadFolders,
    TResult Function(_OnFileTapDialogDriveEvent value)? onFileTap,
    TResult Function(_BackPressedDialogDriveEvent value)? backPressed,
    TResult Function(_ChooseDialogDriveEvent value)? choose,
    required TResult orElse(),
  }) {
    if (onFileTap != null) {
      return onFileTap(this);
    }
    return orElse();
  }
}

abstract class _OnFileTapDialogDriveEvent implements DialogDriveEvent {
  const factory _OnFileTapDialogDriveEvent({required final DriveFile file}) =
      _$_OnFileTapDialogDriveEvent;

  DriveFile get file;
  @JsonKey(ignore: true)
  _$$_OnFileTapDialogDriveEventCopyWith<_$_OnFileTapDialogDriveEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BackPressedDialogDriveEventCopyWith<$Res> {
  factory _$$_BackPressedDialogDriveEventCopyWith(
          _$_BackPressedDialogDriveEvent value,
          $Res Function(_$_BackPressedDialogDriveEvent) then) =
      __$$_BackPressedDialogDriveEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_BackPressedDialogDriveEventCopyWithImpl<$Res>
    extends _$DialogDriveEventCopyWithImpl<$Res, _$_BackPressedDialogDriveEvent>
    implements _$$_BackPressedDialogDriveEventCopyWith<$Res> {
  __$$_BackPressedDialogDriveEventCopyWithImpl(
      _$_BackPressedDialogDriveEvent _value,
      $Res Function(_$_BackPressedDialogDriveEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_BackPressedDialogDriveEvent implements _BackPressedDialogDriveEvent {
  const _$_BackPressedDialogDriveEvent();

  @override
  String toString() {
    return 'DialogDriveEvent.backPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BackPressedDialogDriveEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadFolders,
    required TResult Function(DriveFile file) onFileTap,
    required TResult Function() backPressed,
    required TResult Function() choose,
  }) {
    return backPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadFolders,
    TResult? Function(DriveFile file)? onFileTap,
    TResult? Function()? backPressed,
    TResult? Function()? choose,
  }) {
    return backPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadFolders,
    TResult Function(DriveFile file)? onFileTap,
    TResult Function()? backPressed,
    TResult Function()? choose,
    required TResult orElse(),
  }) {
    if (backPressed != null) {
      return backPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitDialogDriveEvent value) init,
    required TResult Function(_LoadFoldersDialogDriveEvent value) loadFolders,
    required TResult Function(_OnFileTapDialogDriveEvent value) onFileTap,
    required TResult Function(_BackPressedDialogDriveEvent value) backPressed,
    required TResult Function(_ChooseDialogDriveEvent value) choose,
  }) {
    return backPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitDialogDriveEvent value)? init,
    TResult? Function(_LoadFoldersDialogDriveEvent value)? loadFolders,
    TResult? Function(_OnFileTapDialogDriveEvent value)? onFileTap,
    TResult? Function(_BackPressedDialogDriveEvent value)? backPressed,
    TResult? Function(_ChooseDialogDriveEvent value)? choose,
  }) {
    return backPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitDialogDriveEvent value)? init,
    TResult Function(_LoadFoldersDialogDriveEvent value)? loadFolders,
    TResult Function(_OnFileTapDialogDriveEvent value)? onFileTap,
    TResult Function(_BackPressedDialogDriveEvent value)? backPressed,
    TResult Function(_ChooseDialogDriveEvent value)? choose,
    required TResult orElse(),
  }) {
    if (backPressed != null) {
      return backPressed(this);
    }
    return orElse();
  }
}

abstract class _BackPressedDialogDriveEvent implements DialogDriveEvent {
  const factory _BackPressedDialogDriveEvent() = _$_BackPressedDialogDriveEvent;
}

/// @nodoc
abstract class _$$_ChooseDialogDriveEventCopyWith<$Res> {
  factory _$$_ChooseDialogDriveEventCopyWith(_$_ChooseDialogDriveEvent value,
          $Res Function(_$_ChooseDialogDriveEvent) then) =
      __$$_ChooseDialogDriveEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ChooseDialogDriveEventCopyWithImpl<$Res>
    extends _$DialogDriveEventCopyWithImpl<$Res, _$_ChooseDialogDriveEvent>
    implements _$$_ChooseDialogDriveEventCopyWith<$Res> {
  __$$_ChooseDialogDriveEventCopyWithImpl(_$_ChooseDialogDriveEvent _value,
      $Res Function(_$_ChooseDialogDriveEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ChooseDialogDriveEvent implements _ChooseDialogDriveEvent {
  const _$_ChooseDialogDriveEvent();

  @override
  String toString() {
    return 'DialogDriveEvent.choose()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChooseDialogDriveEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadFolders,
    required TResult Function(DriveFile file) onFileTap,
    required TResult Function() backPressed,
    required TResult Function() choose,
  }) {
    return choose();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadFolders,
    TResult? Function(DriveFile file)? onFileTap,
    TResult? Function()? backPressed,
    TResult? Function()? choose,
  }) {
    return choose?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadFolders,
    TResult Function(DriveFile file)? onFileTap,
    TResult Function()? backPressed,
    TResult Function()? choose,
    required TResult orElse(),
  }) {
    if (choose != null) {
      return choose();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitDialogDriveEvent value) init,
    required TResult Function(_LoadFoldersDialogDriveEvent value) loadFolders,
    required TResult Function(_OnFileTapDialogDriveEvent value) onFileTap,
    required TResult Function(_BackPressedDialogDriveEvent value) backPressed,
    required TResult Function(_ChooseDialogDriveEvent value) choose,
  }) {
    return choose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitDialogDriveEvent value)? init,
    TResult? Function(_LoadFoldersDialogDriveEvent value)? loadFolders,
    TResult? Function(_OnFileTapDialogDriveEvent value)? onFileTap,
    TResult? Function(_BackPressedDialogDriveEvent value)? backPressed,
    TResult? Function(_ChooseDialogDriveEvent value)? choose,
  }) {
    return choose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitDialogDriveEvent value)? init,
    TResult Function(_LoadFoldersDialogDriveEvent value)? loadFolders,
    TResult Function(_OnFileTapDialogDriveEvent value)? onFileTap,
    TResult Function(_BackPressedDialogDriveEvent value)? backPressed,
    TResult Function(_ChooseDialogDriveEvent value)? choose,
    required TResult orElse(),
  }) {
    if (choose != null) {
      return choose(this);
    }
    return orElse();
  }
}

abstract class _ChooseDialogDriveEvent implements DialogDriveEvent {
  const factory _ChooseDialogDriveEvent() = _$_ChooseDialogDriveEvent;
}

/// @nodoc
mixin _$DialogDriveState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DriveFile? result, DialogDriveAction action,
            List<DriveFile> folderList)
        success,
    required TResult Function() failure,
    required TResult Function() inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DriveFile? result, DialogDriveAction action,
            List<DriveFile> folderList)?
        success,
    TResult? Function()? failure,
    TResult? Function()? inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DriveFile? result, DialogDriveAction action,
            List<DriveFile> folderList)?
        success,
    TResult Function()? failure,
    TResult Function()? inProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuccessDialogDriveState value) success,
    required TResult Function(_FailureDialogDriveState value) failure,
    required TResult Function(_InProgressDialogDriveState value) inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuccessDialogDriveState value)? success,
    TResult? Function(_FailureDialogDriveState value)? failure,
    TResult? Function(_InProgressDialogDriveState value)? inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuccessDialogDriveState value)? success,
    TResult Function(_FailureDialogDriveState value)? failure,
    TResult Function(_InProgressDialogDriveState value)? inProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogDriveStateCopyWith<$Res> {
  factory $DialogDriveStateCopyWith(
          DialogDriveState value, $Res Function(DialogDriveState) then) =
      _$DialogDriveStateCopyWithImpl<$Res, DialogDriveState>;
}

/// @nodoc
class _$DialogDriveStateCopyWithImpl<$Res, $Val extends DialogDriveState>
    implements $DialogDriveStateCopyWith<$Res> {
  _$DialogDriveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SuccessDialogDriveStateCopyWith<$Res> {
  factory _$$_SuccessDialogDriveStateCopyWith(_$_SuccessDialogDriveState value,
          $Res Function(_$_SuccessDialogDriveState) then) =
      __$$_SuccessDialogDriveStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DriveFile? result,
      DialogDriveAction action,
      List<DriveFile> folderList});
}

/// @nodoc
class __$$_SuccessDialogDriveStateCopyWithImpl<$Res>
    extends _$DialogDriveStateCopyWithImpl<$Res, _$_SuccessDialogDriveState>
    implements _$$_SuccessDialogDriveStateCopyWith<$Res> {
  __$$_SuccessDialogDriveStateCopyWithImpl(_$_SuccessDialogDriveState _value,
      $Res Function(_$_SuccessDialogDriveState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? action = null,
    Object? folderList = null,
  }) {
    return _then(_$_SuccessDialogDriveState(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as DriveFile?,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as DialogDriveAction,
      folderList: null == folderList
          ? _value._folderList
          : folderList // ignore: cast_nullable_to_non_nullable
              as List<DriveFile>,
    ));
  }
}

/// @nodoc

class _$_SuccessDialogDriveState implements _SuccessDialogDriveState {
  const _$_SuccessDialogDriveState(
      {this.result,
      required this.action,
      required final List<DriveFile> folderList})
      : _folderList = folderList;

  @override
  final DriveFile? result;
  @override
  final DialogDriveAction action;
  final List<DriveFile> _folderList;
  @override
  List<DriveFile> get folderList {
    if (_folderList is EqualUnmodifiableListView) return _folderList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_folderList);
  }

  @override
  String toString() {
    return 'DialogDriveState.success(result: $result, action: $action, folderList: $folderList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuccessDialogDriveState &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality()
                .equals(other._folderList, _folderList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result, action,
      const DeepCollectionEquality().hash(_folderList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuccessDialogDriveStateCopyWith<_$_SuccessDialogDriveState>
      get copyWith =>
          __$$_SuccessDialogDriveStateCopyWithImpl<_$_SuccessDialogDriveState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DriveFile? result, DialogDriveAction action,
            List<DriveFile> folderList)
        success,
    required TResult Function() failure,
    required TResult Function() inProgress,
  }) {
    return success(result, action, folderList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DriveFile? result, DialogDriveAction action,
            List<DriveFile> folderList)?
        success,
    TResult? Function()? failure,
    TResult? Function()? inProgress,
  }) {
    return success?.call(result, action, folderList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DriveFile? result, DialogDriveAction action,
            List<DriveFile> folderList)?
        success,
    TResult Function()? failure,
    TResult Function()? inProgress,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(result, action, folderList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SuccessDialogDriveState value) success,
    required TResult Function(_FailureDialogDriveState value) failure,
    required TResult Function(_InProgressDialogDriveState value) inProgress,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuccessDialogDriveState value)? success,
    TResult? Function(_FailureDialogDriveState value)? failure,
    TResult? Function(_InProgressDialogDriveState value)? inProgress,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuccessDialogDriveState value)? success,
    TResult Function(_FailureDialogDriveState value)? failure,
    TResult Function(_InProgressDialogDriveState value)? inProgress,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessDialogDriveState implements DialogDriveState {
  const factory _SuccessDialogDriveState(
      {final DriveFile? result,
      required final DialogDriveAction action,
      required final List<DriveFile> folderList}) = _$_SuccessDialogDriveState;

  DriveFile? get result;
  DialogDriveAction get action;
  List<DriveFile> get folderList;
  @JsonKey(ignore: true)
  _$$_SuccessDialogDriveStateCopyWith<_$_SuccessDialogDriveState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureDialogDriveStateCopyWith<$Res> {
  factory _$$_FailureDialogDriveStateCopyWith(_$_FailureDialogDriveState value,
          $Res Function(_$_FailureDialogDriveState) then) =
      __$$_FailureDialogDriveStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FailureDialogDriveStateCopyWithImpl<$Res>
    extends _$DialogDriveStateCopyWithImpl<$Res, _$_FailureDialogDriveState>
    implements _$$_FailureDialogDriveStateCopyWith<$Res> {
  __$$_FailureDialogDriveStateCopyWithImpl(_$_FailureDialogDriveState _value,
      $Res Function(_$_FailureDialogDriveState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FailureDialogDriveState implements _FailureDialogDriveState {
  const _$_FailureDialogDriveState();

  @override
  String toString() {
    return 'DialogDriveState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FailureDialogDriveState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DriveFile? result, DialogDriveAction action,
            List<DriveFile> folderList)
        success,
    required TResult Function() failure,
    required TResult Function() inProgress,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DriveFile? result, DialogDriveAction action,
            List<DriveFile> folderList)?
        success,
    TResult? Function()? failure,
    TResult? Function()? inProgress,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DriveFile? result, DialogDriveAction action,
            List<DriveFile> folderList)?
        success,
    TResult Function()? failure,
    TResult Function()? inProgress,
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
    required TResult Function(_SuccessDialogDriveState value) success,
    required TResult Function(_FailureDialogDriveState value) failure,
    required TResult Function(_InProgressDialogDriveState value) inProgress,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuccessDialogDriveState value)? success,
    TResult? Function(_FailureDialogDriveState value)? failure,
    TResult? Function(_InProgressDialogDriveState value)? inProgress,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuccessDialogDriveState value)? success,
    TResult Function(_FailureDialogDriveState value)? failure,
    TResult Function(_InProgressDialogDriveState value)? inProgress,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _FailureDialogDriveState implements DialogDriveState {
  const factory _FailureDialogDriveState() = _$_FailureDialogDriveState;
}

/// @nodoc
abstract class _$$_InProgressDialogDriveStateCopyWith<$Res> {
  factory _$$_InProgressDialogDriveStateCopyWith(
          _$_InProgressDialogDriveState value,
          $Res Function(_$_InProgressDialogDriveState) then) =
      __$$_InProgressDialogDriveStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InProgressDialogDriveStateCopyWithImpl<$Res>
    extends _$DialogDriveStateCopyWithImpl<$Res, _$_InProgressDialogDriveState>
    implements _$$_InProgressDialogDriveStateCopyWith<$Res> {
  __$$_InProgressDialogDriveStateCopyWithImpl(
      _$_InProgressDialogDriveState _value,
      $Res Function(_$_InProgressDialogDriveState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InProgressDialogDriveState implements _InProgressDialogDriveState {
  const _$_InProgressDialogDriveState();

  @override
  String toString() {
    return 'DialogDriveState.inProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InProgressDialogDriveState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DriveFile? result, DialogDriveAction action,
            List<DriveFile> folderList)
        success,
    required TResult Function() failure,
    required TResult Function() inProgress,
  }) {
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DriveFile? result, DialogDriveAction action,
            List<DriveFile> folderList)?
        success,
    TResult? Function()? failure,
    TResult? Function()? inProgress,
  }) {
    return inProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DriveFile? result, DialogDriveAction action,
            List<DriveFile> folderList)?
        success,
    TResult Function()? failure,
    TResult Function()? inProgress,
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
    required TResult Function(_SuccessDialogDriveState value) success,
    required TResult Function(_FailureDialogDriveState value) failure,
    required TResult Function(_InProgressDialogDriveState value) inProgress,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SuccessDialogDriveState value)? success,
    TResult? Function(_FailureDialogDriveState value)? failure,
    TResult? Function(_InProgressDialogDriveState value)? inProgress,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SuccessDialogDriveState value)? success,
    TResult Function(_FailureDialogDriveState value)? failure,
    TResult Function(_InProgressDialogDriveState value)? inProgress,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _InProgressDialogDriveState implements DialogDriveState {
  const factory _InProgressDialogDriveState() = _$_InProgressDialogDriveState;
}
