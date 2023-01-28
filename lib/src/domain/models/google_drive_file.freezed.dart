// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_drive_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DriveFile {
  String get title => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  bool get isFolder => throw _privateConstructorUsedError;
  DateTime get lastChanges => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DriveFileCopyWith<DriveFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriveFileCopyWith<$Res> {
  factory $DriveFileCopyWith(DriveFile value, $Res Function(DriveFile) then) =
      _$DriveFileCopyWithImpl<$Res, DriveFile>;
  @useResult
  $Res call(
      {String title,
      String id,
      bool isFolder,
      DateTime lastChanges,
      bool enabled});
}

/// @nodoc
class _$DriveFileCopyWithImpl<$Res, $Val extends DriveFile>
    implements $DriveFileCopyWith<$Res> {
  _$DriveFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
    Object? isFolder = null,
    Object? lastChanges = null,
    Object? enabled = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isFolder: null == isFolder
          ? _value.isFolder
          : isFolder // ignore: cast_nullable_to_non_nullable
              as bool,
      lastChanges: null == lastChanges
          ? _value.lastChanges
          : lastChanges // ignore: cast_nullable_to_non_nullable
              as DateTime,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DriveFileCopyWith<$Res> implements $DriveFileCopyWith<$Res> {
  factory _$$_DriveFileCopyWith(
          _$_DriveFile value, $Res Function(_$_DriveFile) then) =
      __$$_DriveFileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String id,
      bool isFolder,
      DateTime lastChanges,
      bool enabled});
}

/// @nodoc
class __$$_DriveFileCopyWithImpl<$Res>
    extends _$DriveFileCopyWithImpl<$Res, _$_DriveFile>
    implements _$$_DriveFileCopyWith<$Res> {
  __$$_DriveFileCopyWithImpl(
      _$_DriveFile _value, $Res Function(_$_DriveFile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? id = null,
    Object? isFolder = null,
    Object? lastChanges = null,
    Object? enabled = null,
  }) {
    return _then(_$_DriveFile(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isFolder: null == isFolder
          ? _value.isFolder
          : isFolder // ignore: cast_nullable_to_non_nullable
              as bool,
      lastChanges: null == lastChanges
          ? _value.lastChanges
          : lastChanges // ignore: cast_nullable_to_non_nullable
              as DateTime,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DriveFile implements _DriveFile {
  const _$_DriveFile(
      {required this.title,
      required this.id,
      required this.isFolder,
      required this.lastChanges,
      required this.enabled});

  @override
  final String title;
  @override
  final String id;
  @override
  final bool isFolder;
  @override
  final DateTime lastChanges;
  @override
  final bool enabled;

  @override
  String toString() {
    return 'DriveFile(title: $title, id: $id, isFolder: $isFolder, lastChanges: $lastChanges, enabled: $enabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DriveFile &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isFolder, isFolder) ||
                other.isFolder == isFolder) &&
            (identical(other.lastChanges, lastChanges) ||
                other.lastChanges == lastChanges) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, id, isFolder, lastChanges, enabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DriveFileCopyWith<_$_DriveFile> get copyWith =>
      __$$_DriveFileCopyWithImpl<_$_DriveFile>(this, _$identity);
}

abstract class _DriveFile implements DriveFile {
  const factory _DriveFile(
      {required final String title,
      required final String id,
      required final bool isFolder,
      required final DateTime lastChanges,
      required final bool enabled}) = _$_DriveFile;

  @override
  String get title;
  @override
  String get id;
  @override
  bool get isFolder;
  @override
  DateTime get lastChanges;
  @override
  bool get enabled;
  @override
  @JsonKey(ignore: true)
  _$$_DriveFileCopyWith<_$_DriveFile> get copyWith =>
      throw _privateConstructorUsedError;
}
