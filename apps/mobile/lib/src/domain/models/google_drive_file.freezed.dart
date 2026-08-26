// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_drive_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DriveFile {

 String get title; String get id; bool get isFolder; DateTime get lastChanges; bool get enabled;
/// Create a copy of DriveFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriveFileCopyWith<DriveFile> get copyWith => _$DriveFileCopyWithImpl<DriveFile>(this as DriveFile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriveFile&&(identical(other.title, title) || other.title == title)&&(identical(other.id, id) || other.id == id)&&(identical(other.isFolder, isFolder) || other.isFolder == isFolder)&&(identical(other.lastChanges, lastChanges) || other.lastChanges == lastChanges)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,title,id,isFolder,lastChanges,enabled);

@override
String toString() {
  return 'DriveFile(title: $title, id: $id, isFolder: $isFolder, lastChanges: $lastChanges, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $DriveFileCopyWith<$Res>  {
  factory $DriveFileCopyWith(DriveFile value, $Res Function(DriveFile) _then) = _$DriveFileCopyWithImpl;
@useResult
$Res call({
 String title, String id, bool isFolder, DateTime lastChanges, bool enabled
});




}
/// @nodoc
class _$DriveFileCopyWithImpl<$Res>
    implements $DriveFileCopyWith<$Res> {
  _$DriveFileCopyWithImpl(this._self, this._then);

  final DriveFile _self;
  final $Res Function(DriveFile) _then;

/// Create a copy of DriveFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? id = null,Object? isFolder = null,Object? lastChanges = null,Object? enabled = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isFolder: null == isFolder ? _self.isFolder : isFolder // ignore: cast_nullable_to_non_nullable
as bool,lastChanges: null == lastChanges ? _self.lastChanges : lastChanges // ignore: cast_nullable_to_non_nullable
as DateTime,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DriveFile].
extension DriveFilePatterns on DriveFile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriveFile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriveFile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriveFile value)  $default,){
final _that = this;
switch (_that) {
case _DriveFile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriveFile value)?  $default,){
final _that = this;
switch (_that) {
case _DriveFile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String id,  bool isFolder,  DateTime lastChanges,  bool enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriveFile() when $default != null:
return $default(_that.title,_that.id,_that.isFolder,_that.lastChanges,_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String id,  bool isFolder,  DateTime lastChanges,  bool enabled)  $default,) {final _that = this;
switch (_that) {
case _DriveFile():
return $default(_that.title,_that.id,_that.isFolder,_that.lastChanges,_that.enabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String id,  bool isFolder,  DateTime lastChanges,  bool enabled)?  $default,) {final _that = this;
switch (_that) {
case _DriveFile() when $default != null:
return $default(_that.title,_that.id,_that.isFolder,_that.lastChanges,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc


class _DriveFile implements DriveFile {
  const _DriveFile({required this.title, required this.id, required this.isFolder, required this.lastChanges, required this.enabled});
  

@override final  String title;
@override final  String id;
@override final  bool isFolder;
@override final  DateTime lastChanges;
@override final  bool enabled;

/// Create a copy of DriveFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriveFileCopyWith<_DriveFile> get copyWith => __$DriveFileCopyWithImpl<_DriveFile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriveFile&&(identical(other.title, title) || other.title == title)&&(identical(other.id, id) || other.id == id)&&(identical(other.isFolder, isFolder) || other.isFolder == isFolder)&&(identical(other.lastChanges, lastChanges) || other.lastChanges == lastChanges)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,title,id,isFolder,lastChanges,enabled);

@override
String toString() {
  return 'DriveFile(title: $title, id: $id, isFolder: $isFolder, lastChanges: $lastChanges, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$DriveFileCopyWith<$Res> implements $DriveFileCopyWith<$Res> {
  factory _$DriveFileCopyWith(_DriveFile value, $Res Function(_DriveFile) _then) = __$DriveFileCopyWithImpl;
@override @useResult
$Res call({
 String title, String id, bool isFolder, DateTime lastChanges, bool enabled
});




}
/// @nodoc
class __$DriveFileCopyWithImpl<$Res>
    implements _$DriveFileCopyWith<$Res> {
  __$DriveFileCopyWithImpl(this._self, this._then);

  final _DriveFile _self;
  final $Res Function(_DriveFile) _then;

/// Create a copy of DriveFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? id = null,Object? isFolder = null,Object? lastChanges = null,Object? enabled = null,}) {
  return _then(_DriveFile(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isFolder: null == isFolder ? _self.isFolder : isFolder // ignore: cast_nullable_to_non_nullable
as bool,lastChanges: null == lastChanges ? _self.lastChanges : lastChanges // ignore: cast_nullable_to_non_nullable
as DateTime,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
