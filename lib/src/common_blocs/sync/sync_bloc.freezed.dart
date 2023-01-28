// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SyncEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createCloudDatabase,
    required TResult Function() refreshConnection,
    required TResult Function() syncNow,
    required TResult Function() syncLastDay,
    required TResult Function() syncLastMonth,
    required TResult Function() syncAll,
    required TResult Function(User user) addUser,
    required TResult Function() authProgress,
    required TResult Function(User user) authAuthenticated,
    required TResult Function() notAuth,
    required TResult Function(DateTime syncDate) syncData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createCloudDatabase,
    TResult? Function()? refreshConnection,
    TResult? Function()? syncNow,
    TResult? Function()? syncLastDay,
    TResult? Function()? syncLastMonth,
    TResult? Function()? syncAll,
    TResult? Function(User user)? addUser,
    TResult? Function()? authProgress,
    TResult? Function(User user)? authAuthenticated,
    TResult? Function()? notAuth,
    TResult? Function(DateTime syncDate)? syncData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createCloudDatabase,
    TResult Function()? refreshConnection,
    TResult Function()? syncNow,
    TResult Function()? syncLastDay,
    TResult Function()? syncLastMonth,
    TResult Function()? syncAll,
    TResult Function(User user)? addUser,
    TResult Function()? authProgress,
    TResult Function(User user)? authAuthenticated,
    TResult Function()? notAuth,
    TResult Function(DateTime syncDate)? syncData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateCloudDatabaseSyncEvent value)
        createCloudDatabase,
    required TResult Function(_RefreshConnectionSyncEvent value)
        refreshConnection,
    required TResult Function(_SyncNowSyncEvent value) syncNow,
    required TResult Function(_SyncLastDaySyncEvent value) syncLastDay,
    required TResult Function(_SyncLastMonthSyncEvent value) syncLastMonth,
    required TResult Function(_SyncAllSyncEvent value) syncAll,
    required TResult Function(_AddUserSyncEvent value) addUser,
    required TResult Function(_AuthProgressSyncEvent value) authProgress,
    required TResult Function(_AuthAuthenticatedSyncEvent value)
        authAuthenticated,
    required TResult Function(_NotAuthSyncEvent value) notAuth,
    required TResult Function(_SyncDataSyncEvent value) syncData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult? Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult? Function(_SyncNowSyncEvent value)? syncNow,
    TResult? Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult? Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult? Function(_SyncAllSyncEvent value)? syncAll,
    TResult? Function(_AddUserSyncEvent value)? addUser,
    TResult? Function(_AuthProgressSyncEvent value)? authProgress,
    TResult? Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult? Function(_NotAuthSyncEvent value)? notAuth,
    TResult? Function(_SyncDataSyncEvent value)? syncData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult Function(_SyncNowSyncEvent value)? syncNow,
    TResult Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult Function(_SyncAllSyncEvent value)? syncAll,
    TResult Function(_AddUserSyncEvent value)? addUser,
    TResult Function(_AuthProgressSyncEvent value)? authProgress,
    TResult Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult Function(_NotAuthSyncEvent value)? notAuth,
    TResult Function(_SyncDataSyncEvent value)? syncData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncEventCopyWith<$Res> {
  factory $SyncEventCopyWith(SyncEvent value, $Res Function(SyncEvent) then) =
      _$SyncEventCopyWithImpl<$Res, SyncEvent>;
}

/// @nodoc
class _$SyncEventCopyWithImpl<$Res, $Val extends SyncEvent>
    implements $SyncEventCopyWith<$Res> {
  _$SyncEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CreateCloudDatabaseSyncEventCopyWith<$Res> {
  factory _$$_CreateCloudDatabaseSyncEventCopyWith(
          _$_CreateCloudDatabaseSyncEvent value,
          $Res Function(_$_CreateCloudDatabaseSyncEvent) then) =
      __$$_CreateCloudDatabaseSyncEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CreateCloudDatabaseSyncEventCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$_CreateCloudDatabaseSyncEvent>
    implements _$$_CreateCloudDatabaseSyncEventCopyWith<$Res> {
  __$$_CreateCloudDatabaseSyncEventCopyWithImpl(
      _$_CreateCloudDatabaseSyncEvent _value,
      $Res Function(_$_CreateCloudDatabaseSyncEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_CreateCloudDatabaseSyncEvent extends _CreateCloudDatabaseSyncEvent {
  const _$_CreateCloudDatabaseSyncEvent() : super._();

  @override
  String toString() {
    return 'SyncEvent.createCloudDatabase()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateCloudDatabaseSyncEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createCloudDatabase,
    required TResult Function() refreshConnection,
    required TResult Function() syncNow,
    required TResult Function() syncLastDay,
    required TResult Function() syncLastMonth,
    required TResult Function() syncAll,
    required TResult Function(User user) addUser,
    required TResult Function() authProgress,
    required TResult Function(User user) authAuthenticated,
    required TResult Function() notAuth,
    required TResult Function(DateTime syncDate) syncData,
  }) {
    return createCloudDatabase();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createCloudDatabase,
    TResult? Function()? refreshConnection,
    TResult? Function()? syncNow,
    TResult? Function()? syncLastDay,
    TResult? Function()? syncLastMonth,
    TResult? Function()? syncAll,
    TResult? Function(User user)? addUser,
    TResult? Function()? authProgress,
    TResult? Function(User user)? authAuthenticated,
    TResult? Function()? notAuth,
    TResult? Function(DateTime syncDate)? syncData,
  }) {
    return createCloudDatabase?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createCloudDatabase,
    TResult Function()? refreshConnection,
    TResult Function()? syncNow,
    TResult Function()? syncLastDay,
    TResult Function()? syncLastMonth,
    TResult Function()? syncAll,
    TResult Function(User user)? addUser,
    TResult Function()? authProgress,
    TResult Function(User user)? authAuthenticated,
    TResult Function()? notAuth,
    TResult Function(DateTime syncDate)? syncData,
    required TResult orElse(),
  }) {
    if (createCloudDatabase != null) {
      return createCloudDatabase();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateCloudDatabaseSyncEvent value)
        createCloudDatabase,
    required TResult Function(_RefreshConnectionSyncEvent value)
        refreshConnection,
    required TResult Function(_SyncNowSyncEvent value) syncNow,
    required TResult Function(_SyncLastDaySyncEvent value) syncLastDay,
    required TResult Function(_SyncLastMonthSyncEvent value) syncLastMonth,
    required TResult Function(_SyncAllSyncEvent value) syncAll,
    required TResult Function(_AddUserSyncEvent value) addUser,
    required TResult Function(_AuthProgressSyncEvent value) authProgress,
    required TResult Function(_AuthAuthenticatedSyncEvent value)
        authAuthenticated,
    required TResult Function(_NotAuthSyncEvent value) notAuth,
    required TResult Function(_SyncDataSyncEvent value) syncData,
  }) {
    return createCloudDatabase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult? Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult? Function(_SyncNowSyncEvent value)? syncNow,
    TResult? Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult? Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult? Function(_SyncAllSyncEvent value)? syncAll,
    TResult? Function(_AddUserSyncEvent value)? addUser,
    TResult? Function(_AuthProgressSyncEvent value)? authProgress,
    TResult? Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult? Function(_NotAuthSyncEvent value)? notAuth,
    TResult? Function(_SyncDataSyncEvent value)? syncData,
  }) {
    return createCloudDatabase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult Function(_SyncNowSyncEvent value)? syncNow,
    TResult Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult Function(_SyncAllSyncEvent value)? syncAll,
    TResult Function(_AddUserSyncEvent value)? addUser,
    TResult Function(_AuthProgressSyncEvent value)? authProgress,
    TResult Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult Function(_NotAuthSyncEvent value)? notAuth,
    TResult Function(_SyncDataSyncEvent value)? syncData,
    required TResult orElse(),
  }) {
    if (createCloudDatabase != null) {
      return createCloudDatabase(this);
    }
    return orElse();
  }
}

abstract class _CreateCloudDatabaseSyncEvent extends SyncEvent {
  const factory _CreateCloudDatabaseSyncEvent() =
      _$_CreateCloudDatabaseSyncEvent;
  const _CreateCloudDatabaseSyncEvent._() : super._();
}

/// @nodoc
abstract class _$$_RefreshConnectionSyncEventCopyWith<$Res> {
  factory _$$_RefreshConnectionSyncEventCopyWith(
          _$_RefreshConnectionSyncEvent value,
          $Res Function(_$_RefreshConnectionSyncEvent) then) =
      __$$_RefreshConnectionSyncEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RefreshConnectionSyncEventCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$_RefreshConnectionSyncEvent>
    implements _$$_RefreshConnectionSyncEventCopyWith<$Res> {
  __$$_RefreshConnectionSyncEventCopyWithImpl(
      _$_RefreshConnectionSyncEvent _value,
      $Res Function(_$_RefreshConnectionSyncEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RefreshConnectionSyncEvent extends _RefreshConnectionSyncEvent {
  const _$_RefreshConnectionSyncEvent() : super._();

  @override
  String toString() {
    return 'SyncEvent.refreshConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RefreshConnectionSyncEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createCloudDatabase,
    required TResult Function() refreshConnection,
    required TResult Function() syncNow,
    required TResult Function() syncLastDay,
    required TResult Function() syncLastMonth,
    required TResult Function() syncAll,
    required TResult Function(User user) addUser,
    required TResult Function() authProgress,
    required TResult Function(User user) authAuthenticated,
    required TResult Function() notAuth,
    required TResult Function(DateTime syncDate) syncData,
  }) {
    return refreshConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createCloudDatabase,
    TResult? Function()? refreshConnection,
    TResult? Function()? syncNow,
    TResult? Function()? syncLastDay,
    TResult? Function()? syncLastMonth,
    TResult? Function()? syncAll,
    TResult? Function(User user)? addUser,
    TResult? Function()? authProgress,
    TResult? Function(User user)? authAuthenticated,
    TResult? Function()? notAuth,
    TResult? Function(DateTime syncDate)? syncData,
  }) {
    return refreshConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createCloudDatabase,
    TResult Function()? refreshConnection,
    TResult Function()? syncNow,
    TResult Function()? syncLastDay,
    TResult Function()? syncLastMonth,
    TResult Function()? syncAll,
    TResult Function(User user)? addUser,
    TResult Function()? authProgress,
    TResult Function(User user)? authAuthenticated,
    TResult Function()? notAuth,
    TResult Function(DateTime syncDate)? syncData,
    required TResult orElse(),
  }) {
    if (refreshConnection != null) {
      return refreshConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateCloudDatabaseSyncEvent value)
        createCloudDatabase,
    required TResult Function(_RefreshConnectionSyncEvent value)
        refreshConnection,
    required TResult Function(_SyncNowSyncEvent value) syncNow,
    required TResult Function(_SyncLastDaySyncEvent value) syncLastDay,
    required TResult Function(_SyncLastMonthSyncEvent value) syncLastMonth,
    required TResult Function(_SyncAllSyncEvent value) syncAll,
    required TResult Function(_AddUserSyncEvent value) addUser,
    required TResult Function(_AuthProgressSyncEvent value) authProgress,
    required TResult Function(_AuthAuthenticatedSyncEvent value)
        authAuthenticated,
    required TResult Function(_NotAuthSyncEvent value) notAuth,
    required TResult Function(_SyncDataSyncEvent value) syncData,
  }) {
    return refreshConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult? Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult? Function(_SyncNowSyncEvent value)? syncNow,
    TResult? Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult? Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult? Function(_SyncAllSyncEvent value)? syncAll,
    TResult? Function(_AddUserSyncEvent value)? addUser,
    TResult? Function(_AuthProgressSyncEvent value)? authProgress,
    TResult? Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult? Function(_NotAuthSyncEvent value)? notAuth,
    TResult? Function(_SyncDataSyncEvent value)? syncData,
  }) {
    return refreshConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult Function(_SyncNowSyncEvent value)? syncNow,
    TResult Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult Function(_SyncAllSyncEvent value)? syncAll,
    TResult Function(_AddUserSyncEvent value)? addUser,
    TResult Function(_AuthProgressSyncEvent value)? authProgress,
    TResult Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult Function(_NotAuthSyncEvent value)? notAuth,
    TResult Function(_SyncDataSyncEvent value)? syncData,
    required TResult orElse(),
  }) {
    if (refreshConnection != null) {
      return refreshConnection(this);
    }
    return orElse();
  }
}

abstract class _RefreshConnectionSyncEvent extends SyncEvent {
  const factory _RefreshConnectionSyncEvent() = _$_RefreshConnectionSyncEvent;
  const _RefreshConnectionSyncEvent._() : super._();
}

/// @nodoc
abstract class _$$_SyncNowSyncEventCopyWith<$Res> {
  factory _$$_SyncNowSyncEventCopyWith(
          _$_SyncNowSyncEvent value, $Res Function(_$_SyncNowSyncEvent) then) =
      __$$_SyncNowSyncEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SyncNowSyncEventCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$_SyncNowSyncEvent>
    implements _$$_SyncNowSyncEventCopyWith<$Res> {
  __$$_SyncNowSyncEventCopyWithImpl(
      _$_SyncNowSyncEvent _value, $Res Function(_$_SyncNowSyncEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SyncNowSyncEvent extends _SyncNowSyncEvent {
  const _$_SyncNowSyncEvent() : super._();

  @override
  String toString() {
    return 'SyncEvent.syncNow()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SyncNowSyncEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createCloudDatabase,
    required TResult Function() refreshConnection,
    required TResult Function() syncNow,
    required TResult Function() syncLastDay,
    required TResult Function() syncLastMonth,
    required TResult Function() syncAll,
    required TResult Function(User user) addUser,
    required TResult Function() authProgress,
    required TResult Function(User user) authAuthenticated,
    required TResult Function() notAuth,
    required TResult Function(DateTime syncDate) syncData,
  }) {
    return syncNow();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createCloudDatabase,
    TResult? Function()? refreshConnection,
    TResult? Function()? syncNow,
    TResult? Function()? syncLastDay,
    TResult? Function()? syncLastMonth,
    TResult? Function()? syncAll,
    TResult? Function(User user)? addUser,
    TResult? Function()? authProgress,
    TResult? Function(User user)? authAuthenticated,
    TResult? Function()? notAuth,
    TResult? Function(DateTime syncDate)? syncData,
  }) {
    return syncNow?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createCloudDatabase,
    TResult Function()? refreshConnection,
    TResult Function()? syncNow,
    TResult Function()? syncLastDay,
    TResult Function()? syncLastMonth,
    TResult Function()? syncAll,
    TResult Function(User user)? addUser,
    TResult Function()? authProgress,
    TResult Function(User user)? authAuthenticated,
    TResult Function()? notAuth,
    TResult Function(DateTime syncDate)? syncData,
    required TResult orElse(),
  }) {
    if (syncNow != null) {
      return syncNow();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateCloudDatabaseSyncEvent value)
        createCloudDatabase,
    required TResult Function(_RefreshConnectionSyncEvent value)
        refreshConnection,
    required TResult Function(_SyncNowSyncEvent value) syncNow,
    required TResult Function(_SyncLastDaySyncEvent value) syncLastDay,
    required TResult Function(_SyncLastMonthSyncEvent value) syncLastMonth,
    required TResult Function(_SyncAllSyncEvent value) syncAll,
    required TResult Function(_AddUserSyncEvent value) addUser,
    required TResult Function(_AuthProgressSyncEvent value) authProgress,
    required TResult Function(_AuthAuthenticatedSyncEvent value)
        authAuthenticated,
    required TResult Function(_NotAuthSyncEvent value) notAuth,
    required TResult Function(_SyncDataSyncEvent value) syncData,
  }) {
    return syncNow(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult? Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult? Function(_SyncNowSyncEvent value)? syncNow,
    TResult? Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult? Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult? Function(_SyncAllSyncEvent value)? syncAll,
    TResult? Function(_AddUserSyncEvent value)? addUser,
    TResult? Function(_AuthProgressSyncEvent value)? authProgress,
    TResult? Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult? Function(_NotAuthSyncEvent value)? notAuth,
    TResult? Function(_SyncDataSyncEvent value)? syncData,
  }) {
    return syncNow?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult Function(_SyncNowSyncEvent value)? syncNow,
    TResult Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult Function(_SyncAllSyncEvent value)? syncAll,
    TResult Function(_AddUserSyncEvent value)? addUser,
    TResult Function(_AuthProgressSyncEvent value)? authProgress,
    TResult Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult Function(_NotAuthSyncEvent value)? notAuth,
    TResult Function(_SyncDataSyncEvent value)? syncData,
    required TResult orElse(),
  }) {
    if (syncNow != null) {
      return syncNow(this);
    }
    return orElse();
  }
}

abstract class _SyncNowSyncEvent extends SyncEvent {
  const factory _SyncNowSyncEvent() = _$_SyncNowSyncEvent;
  const _SyncNowSyncEvent._() : super._();
}

/// @nodoc
abstract class _$$_SyncLastDaySyncEventCopyWith<$Res> {
  factory _$$_SyncLastDaySyncEventCopyWith(_$_SyncLastDaySyncEvent value,
          $Res Function(_$_SyncLastDaySyncEvent) then) =
      __$$_SyncLastDaySyncEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SyncLastDaySyncEventCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$_SyncLastDaySyncEvent>
    implements _$$_SyncLastDaySyncEventCopyWith<$Res> {
  __$$_SyncLastDaySyncEventCopyWithImpl(_$_SyncLastDaySyncEvent _value,
      $Res Function(_$_SyncLastDaySyncEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SyncLastDaySyncEvent extends _SyncLastDaySyncEvent {
  const _$_SyncLastDaySyncEvent() : super._();

  @override
  String toString() {
    return 'SyncEvent.syncLastDay()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SyncLastDaySyncEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createCloudDatabase,
    required TResult Function() refreshConnection,
    required TResult Function() syncNow,
    required TResult Function() syncLastDay,
    required TResult Function() syncLastMonth,
    required TResult Function() syncAll,
    required TResult Function(User user) addUser,
    required TResult Function() authProgress,
    required TResult Function(User user) authAuthenticated,
    required TResult Function() notAuth,
    required TResult Function(DateTime syncDate) syncData,
  }) {
    return syncLastDay();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createCloudDatabase,
    TResult? Function()? refreshConnection,
    TResult? Function()? syncNow,
    TResult? Function()? syncLastDay,
    TResult? Function()? syncLastMonth,
    TResult? Function()? syncAll,
    TResult? Function(User user)? addUser,
    TResult? Function()? authProgress,
    TResult? Function(User user)? authAuthenticated,
    TResult? Function()? notAuth,
    TResult? Function(DateTime syncDate)? syncData,
  }) {
    return syncLastDay?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createCloudDatabase,
    TResult Function()? refreshConnection,
    TResult Function()? syncNow,
    TResult Function()? syncLastDay,
    TResult Function()? syncLastMonth,
    TResult Function()? syncAll,
    TResult Function(User user)? addUser,
    TResult Function()? authProgress,
    TResult Function(User user)? authAuthenticated,
    TResult Function()? notAuth,
    TResult Function(DateTime syncDate)? syncData,
    required TResult orElse(),
  }) {
    if (syncLastDay != null) {
      return syncLastDay();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateCloudDatabaseSyncEvent value)
        createCloudDatabase,
    required TResult Function(_RefreshConnectionSyncEvent value)
        refreshConnection,
    required TResult Function(_SyncNowSyncEvent value) syncNow,
    required TResult Function(_SyncLastDaySyncEvent value) syncLastDay,
    required TResult Function(_SyncLastMonthSyncEvent value) syncLastMonth,
    required TResult Function(_SyncAllSyncEvent value) syncAll,
    required TResult Function(_AddUserSyncEvent value) addUser,
    required TResult Function(_AuthProgressSyncEvent value) authProgress,
    required TResult Function(_AuthAuthenticatedSyncEvent value)
        authAuthenticated,
    required TResult Function(_NotAuthSyncEvent value) notAuth,
    required TResult Function(_SyncDataSyncEvent value) syncData,
  }) {
    return syncLastDay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult? Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult? Function(_SyncNowSyncEvent value)? syncNow,
    TResult? Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult? Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult? Function(_SyncAllSyncEvent value)? syncAll,
    TResult? Function(_AddUserSyncEvent value)? addUser,
    TResult? Function(_AuthProgressSyncEvent value)? authProgress,
    TResult? Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult? Function(_NotAuthSyncEvent value)? notAuth,
    TResult? Function(_SyncDataSyncEvent value)? syncData,
  }) {
    return syncLastDay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult Function(_SyncNowSyncEvent value)? syncNow,
    TResult Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult Function(_SyncAllSyncEvent value)? syncAll,
    TResult Function(_AddUserSyncEvent value)? addUser,
    TResult Function(_AuthProgressSyncEvent value)? authProgress,
    TResult Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult Function(_NotAuthSyncEvent value)? notAuth,
    TResult Function(_SyncDataSyncEvent value)? syncData,
    required TResult orElse(),
  }) {
    if (syncLastDay != null) {
      return syncLastDay(this);
    }
    return orElse();
  }
}

abstract class _SyncLastDaySyncEvent extends SyncEvent {
  const factory _SyncLastDaySyncEvent() = _$_SyncLastDaySyncEvent;
  const _SyncLastDaySyncEvent._() : super._();
}

/// @nodoc
abstract class _$$_SyncLastMonthSyncEventCopyWith<$Res> {
  factory _$$_SyncLastMonthSyncEventCopyWith(_$_SyncLastMonthSyncEvent value,
          $Res Function(_$_SyncLastMonthSyncEvent) then) =
      __$$_SyncLastMonthSyncEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SyncLastMonthSyncEventCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$_SyncLastMonthSyncEvent>
    implements _$$_SyncLastMonthSyncEventCopyWith<$Res> {
  __$$_SyncLastMonthSyncEventCopyWithImpl(_$_SyncLastMonthSyncEvent _value,
      $Res Function(_$_SyncLastMonthSyncEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SyncLastMonthSyncEvent extends _SyncLastMonthSyncEvent {
  const _$_SyncLastMonthSyncEvent() : super._();

  @override
  String toString() {
    return 'SyncEvent.syncLastMonth()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SyncLastMonthSyncEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createCloudDatabase,
    required TResult Function() refreshConnection,
    required TResult Function() syncNow,
    required TResult Function() syncLastDay,
    required TResult Function() syncLastMonth,
    required TResult Function() syncAll,
    required TResult Function(User user) addUser,
    required TResult Function() authProgress,
    required TResult Function(User user) authAuthenticated,
    required TResult Function() notAuth,
    required TResult Function(DateTime syncDate) syncData,
  }) {
    return syncLastMonth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createCloudDatabase,
    TResult? Function()? refreshConnection,
    TResult? Function()? syncNow,
    TResult? Function()? syncLastDay,
    TResult? Function()? syncLastMonth,
    TResult? Function()? syncAll,
    TResult? Function(User user)? addUser,
    TResult? Function()? authProgress,
    TResult? Function(User user)? authAuthenticated,
    TResult? Function()? notAuth,
    TResult? Function(DateTime syncDate)? syncData,
  }) {
    return syncLastMonth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createCloudDatabase,
    TResult Function()? refreshConnection,
    TResult Function()? syncNow,
    TResult Function()? syncLastDay,
    TResult Function()? syncLastMonth,
    TResult Function()? syncAll,
    TResult Function(User user)? addUser,
    TResult Function()? authProgress,
    TResult Function(User user)? authAuthenticated,
    TResult Function()? notAuth,
    TResult Function(DateTime syncDate)? syncData,
    required TResult orElse(),
  }) {
    if (syncLastMonth != null) {
      return syncLastMonth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateCloudDatabaseSyncEvent value)
        createCloudDatabase,
    required TResult Function(_RefreshConnectionSyncEvent value)
        refreshConnection,
    required TResult Function(_SyncNowSyncEvent value) syncNow,
    required TResult Function(_SyncLastDaySyncEvent value) syncLastDay,
    required TResult Function(_SyncLastMonthSyncEvent value) syncLastMonth,
    required TResult Function(_SyncAllSyncEvent value) syncAll,
    required TResult Function(_AddUserSyncEvent value) addUser,
    required TResult Function(_AuthProgressSyncEvent value) authProgress,
    required TResult Function(_AuthAuthenticatedSyncEvent value)
        authAuthenticated,
    required TResult Function(_NotAuthSyncEvent value) notAuth,
    required TResult Function(_SyncDataSyncEvent value) syncData,
  }) {
    return syncLastMonth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult? Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult? Function(_SyncNowSyncEvent value)? syncNow,
    TResult? Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult? Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult? Function(_SyncAllSyncEvent value)? syncAll,
    TResult? Function(_AddUserSyncEvent value)? addUser,
    TResult? Function(_AuthProgressSyncEvent value)? authProgress,
    TResult? Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult? Function(_NotAuthSyncEvent value)? notAuth,
    TResult? Function(_SyncDataSyncEvent value)? syncData,
  }) {
    return syncLastMonth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult Function(_SyncNowSyncEvent value)? syncNow,
    TResult Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult Function(_SyncAllSyncEvent value)? syncAll,
    TResult Function(_AddUserSyncEvent value)? addUser,
    TResult Function(_AuthProgressSyncEvent value)? authProgress,
    TResult Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult Function(_NotAuthSyncEvent value)? notAuth,
    TResult Function(_SyncDataSyncEvent value)? syncData,
    required TResult orElse(),
  }) {
    if (syncLastMonth != null) {
      return syncLastMonth(this);
    }
    return orElse();
  }
}

abstract class _SyncLastMonthSyncEvent extends SyncEvent {
  const factory _SyncLastMonthSyncEvent() = _$_SyncLastMonthSyncEvent;
  const _SyncLastMonthSyncEvent._() : super._();
}

/// @nodoc
abstract class _$$_SyncAllSyncEventCopyWith<$Res> {
  factory _$$_SyncAllSyncEventCopyWith(
          _$_SyncAllSyncEvent value, $Res Function(_$_SyncAllSyncEvent) then) =
      __$$_SyncAllSyncEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SyncAllSyncEventCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$_SyncAllSyncEvent>
    implements _$$_SyncAllSyncEventCopyWith<$Res> {
  __$$_SyncAllSyncEventCopyWithImpl(
      _$_SyncAllSyncEvent _value, $Res Function(_$_SyncAllSyncEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SyncAllSyncEvent extends _SyncAllSyncEvent {
  const _$_SyncAllSyncEvent() : super._();

  @override
  String toString() {
    return 'SyncEvent.syncAll()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SyncAllSyncEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createCloudDatabase,
    required TResult Function() refreshConnection,
    required TResult Function() syncNow,
    required TResult Function() syncLastDay,
    required TResult Function() syncLastMonth,
    required TResult Function() syncAll,
    required TResult Function(User user) addUser,
    required TResult Function() authProgress,
    required TResult Function(User user) authAuthenticated,
    required TResult Function() notAuth,
    required TResult Function(DateTime syncDate) syncData,
  }) {
    return syncAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createCloudDatabase,
    TResult? Function()? refreshConnection,
    TResult? Function()? syncNow,
    TResult? Function()? syncLastDay,
    TResult? Function()? syncLastMonth,
    TResult? Function()? syncAll,
    TResult? Function(User user)? addUser,
    TResult? Function()? authProgress,
    TResult? Function(User user)? authAuthenticated,
    TResult? Function()? notAuth,
    TResult? Function(DateTime syncDate)? syncData,
  }) {
    return syncAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createCloudDatabase,
    TResult Function()? refreshConnection,
    TResult Function()? syncNow,
    TResult Function()? syncLastDay,
    TResult Function()? syncLastMonth,
    TResult Function()? syncAll,
    TResult Function(User user)? addUser,
    TResult Function()? authProgress,
    TResult Function(User user)? authAuthenticated,
    TResult Function()? notAuth,
    TResult Function(DateTime syncDate)? syncData,
    required TResult orElse(),
  }) {
    if (syncAll != null) {
      return syncAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateCloudDatabaseSyncEvent value)
        createCloudDatabase,
    required TResult Function(_RefreshConnectionSyncEvent value)
        refreshConnection,
    required TResult Function(_SyncNowSyncEvent value) syncNow,
    required TResult Function(_SyncLastDaySyncEvent value) syncLastDay,
    required TResult Function(_SyncLastMonthSyncEvent value) syncLastMonth,
    required TResult Function(_SyncAllSyncEvent value) syncAll,
    required TResult Function(_AddUserSyncEvent value) addUser,
    required TResult Function(_AuthProgressSyncEvent value) authProgress,
    required TResult Function(_AuthAuthenticatedSyncEvent value)
        authAuthenticated,
    required TResult Function(_NotAuthSyncEvent value) notAuth,
    required TResult Function(_SyncDataSyncEvent value) syncData,
  }) {
    return syncAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult? Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult? Function(_SyncNowSyncEvent value)? syncNow,
    TResult? Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult? Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult? Function(_SyncAllSyncEvent value)? syncAll,
    TResult? Function(_AddUserSyncEvent value)? addUser,
    TResult? Function(_AuthProgressSyncEvent value)? authProgress,
    TResult? Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult? Function(_NotAuthSyncEvent value)? notAuth,
    TResult? Function(_SyncDataSyncEvent value)? syncData,
  }) {
    return syncAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult Function(_SyncNowSyncEvent value)? syncNow,
    TResult Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult Function(_SyncAllSyncEvent value)? syncAll,
    TResult Function(_AddUserSyncEvent value)? addUser,
    TResult Function(_AuthProgressSyncEvent value)? authProgress,
    TResult Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult Function(_NotAuthSyncEvent value)? notAuth,
    TResult Function(_SyncDataSyncEvent value)? syncData,
    required TResult orElse(),
  }) {
    if (syncAll != null) {
      return syncAll(this);
    }
    return orElse();
  }
}

abstract class _SyncAllSyncEvent extends SyncEvent {
  const factory _SyncAllSyncEvent() = _$_SyncAllSyncEvent;
  const _SyncAllSyncEvent._() : super._();
}

/// @nodoc
abstract class _$$_AddUserSyncEventCopyWith<$Res> {
  factory _$$_AddUserSyncEventCopyWith(
          _$_AddUserSyncEvent value, $Res Function(_$_AddUserSyncEvent) then) =
      __$$_AddUserSyncEventCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$_AddUserSyncEventCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$_AddUserSyncEvent>
    implements _$$_AddUserSyncEventCopyWith<$Res> {
  __$$_AddUserSyncEventCopyWithImpl(
      _$_AddUserSyncEvent _value, $Res Function(_$_AddUserSyncEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_AddUserSyncEvent(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_AddUserSyncEvent extends _AddUserSyncEvent {
  const _$_AddUserSyncEvent({required this.user}) : super._();

  @override
  final User user;

  @override
  String toString() {
    return 'SyncEvent.addUser(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddUserSyncEvent &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddUserSyncEventCopyWith<_$_AddUserSyncEvent> get copyWith =>
      __$$_AddUserSyncEventCopyWithImpl<_$_AddUserSyncEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createCloudDatabase,
    required TResult Function() refreshConnection,
    required TResult Function() syncNow,
    required TResult Function() syncLastDay,
    required TResult Function() syncLastMonth,
    required TResult Function() syncAll,
    required TResult Function(User user) addUser,
    required TResult Function() authProgress,
    required TResult Function(User user) authAuthenticated,
    required TResult Function() notAuth,
    required TResult Function(DateTime syncDate) syncData,
  }) {
    return addUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createCloudDatabase,
    TResult? Function()? refreshConnection,
    TResult? Function()? syncNow,
    TResult? Function()? syncLastDay,
    TResult? Function()? syncLastMonth,
    TResult? Function()? syncAll,
    TResult? Function(User user)? addUser,
    TResult? Function()? authProgress,
    TResult? Function(User user)? authAuthenticated,
    TResult? Function()? notAuth,
    TResult? Function(DateTime syncDate)? syncData,
  }) {
    return addUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createCloudDatabase,
    TResult Function()? refreshConnection,
    TResult Function()? syncNow,
    TResult Function()? syncLastDay,
    TResult Function()? syncLastMonth,
    TResult Function()? syncAll,
    TResult Function(User user)? addUser,
    TResult Function()? authProgress,
    TResult Function(User user)? authAuthenticated,
    TResult Function()? notAuth,
    TResult Function(DateTime syncDate)? syncData,
    required TResult orElse(),
  }) {
    if (addUser != null) {
      return addUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateCloudDatabaseSyncEvent value)
        createCloudDatabase,
    required TResult Function(_RefreshConnectionSyncEvent value)
        refreshConnection,
    required TResult Function(_SyncNowSyncEvent value) syncNow,
    required TResult Function(_SyncLastDaySyncEvent value) syncLastDay,
    required TResult Function(_SyncLastMonthSyncEvent value) syncLastMonth,
    required TResult Function(_SyncAllSyncEvent value) syncAll,
    required TResult Function(_AddUserSyncEvent value) addUser,
    required TResult Function(_AuthProgressSyncEvent value) authProgress,
    required TResult Function(_AuthAuthenticatedSyncEvent value)
        authAuthenticated,
    required TResult Function(_NotAuthSyncEvent value) notAuth,
    required TResult Function(_SyncDataSyncEvent value) syncData,
  }) {
    return addUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult? Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult? Function(_SyncNowSyncEvent value)? syncNow,
    TResult? Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult? Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult? Function(_SyncAllSyncEvent value)? syncAll,
    TResult? Function(_AddUserSyncEvent value)? addUser,
    TResult? Function(_AuthProgressSyncEvent value)? authProgress,
    TResult? Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult? Function(_NotAuthSyncEvent value)? notAuth,
    TResult? Function(_SyncDataSyncEvent value)? syncData,
  }) {
    return addUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult Function(_SyncNowSyncEvent value)? syncNow,
    TResult Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult Function(_SyncAllSyncEvent value)? syncAll,
    TResult Function(_AddUserSyncEvent value)? addUser,
    TResult Function(_AuthProgressSyncEvent value)? authProgress,
    TResult Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult Function(_NotAuthSyncEvent value)? notAuth,
    TResult Function(_SyncDataSyncEvent value)? syncData,
    required TResult orElse(),
  }) {
    if (addUser != null) {
      return addUser(this);
    }
    return orElse();
  }
}

abstract class _AddUserSyncEvent extends SyncEvent {
  const factory _AddUserSyncEvent({required final User user}) =
      _$_AddUserSyncEvent;
  const _AddUserSyncEvent._() : super._();

  User get user;
  @JsonKey(ignore: true)
  _$$_AddUserSyncEventCopyWith<_$_AddUserSyncEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthProgressSyncEventCopyWith<$Res> {
  factory _$$_AuthProgressSyncEventCopyWith(_$_AuthProgressSyncEvent value,
          $Res Function(_$_AuthProgressSyncEvent) then) =
      __$$_AuthProgressSyncEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthProgressSyncEventCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$_AuthProgressSyncEvent>
    implements _$$_AuthProgressSyncEventCopyWith<$Res> {
  __$$_AuthProgressSyncEventCopyWithImpl(_$_AuthProgressSyncEvent _value,
      $Res Function(_$_AuthProgressSyncEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthProgressSyncEvent extends _AuthProgressSyncEvent {
  const _$_AuthProgressSyncEvent() : super._();

  @override
  String toString() {
    return 'SyncEvent.authProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AuthProgressSyncEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createCloudDatabase,
    required TResult Function() refreshConnection,
    required TResult Function() syncNow,
    required TResult Function() syncLastDay,
    required TResult Function() syncLastMonth,
    required TResult Function() syncAll,
    required TResult Function(User user) addUser,
    required TResult Function() authProgress,
    required TResult Function(User user) authAuthenticated,
    required TResult Function() notAuth,
    required TResult Function(DateTime syncDate) syncData,
  }) {
    return authProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createCloudDatabase,
    TResult? Function()? refreshConnection,
    TResult? Function()? syncNow,
    TResult? Function()? syncLastDay,
    TResult? Function()? syncLastMonth,
    TResult? Function()? syncAll,
    TResult? Function(User user)? addUser,
    TResult? Function()? authProgress,
    TResult? Function(User user)? authAuthenticated,
    TResult? Function()? notAuth,
    TResult? Function(DateTime syncDate)? syncData,
  }) {
    return authProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createCloudDatabase,
    TResult Function()? refreshConnection,
    TResult Function()? syncNow,
    TResult Function()? syncLastDay,
    TResult Function()? syncLastMonth,
    TResult Function()? syncAll,
    TResult Function(User user)? addUser,
    TResult Function()? authProgress,
    TResult Function(User user)? authAuthenticated,
    TResult Function()? notAuth,
    TResult Function(DateTime syncDate)? syncData,
    required TResult orElse(),
  }) {
    if (authProgress != null) {
      return authProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateCloudDatabaseSyncEvent value)
        createCloudDatabase,
    required TResult Function(_RefreshConnectionSyncEvent value)
        refreshConnection,
    required TResult Function(_SyncNowSyncEvent value) syncNow,
    required TResult Function(_SyncLastDaySyncEvent value) syncLastDay,
    required TResult Function(_SyncLastMonthSyncEvent value) syncLastMonth,
    required TResult Function(_SyncAllSyncEvent value) syncAll,
    required TResult Function(_AddUserSyncEvent value) addUser,
    required TResult Function(_AuthProgressSyncEvent value) authProgress,
    required TResult Function(_AuthAuthenticatedSyncEvent value)
        authAuthenticated,
    required TResult Function(_NotAuthSyncEvent value) notAuth,
    required TResult Function(_SyncDataSyncEvent value) syncData,
  }) {
    return authProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult? Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult? Function(_SyncNowSyncEvent value)? syncNow,
    TResult? Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult? Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult? Function(_SyncAllSyncEvent value)? syncAll,
    TResult? Function(_AddUserSyncEvent value)? addUser,
    TResult? Function(_AuthProgressSyncEvent value)? authProgress,
    TResult? Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult? Function(_NotAuthSyncEvent value)? notAuth,
    TResult? Function(_SyncDataSyncEvent value)? syncData,
  }) {
    return authProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult Function(_SyncNowSyncEvent value)? syncNow,
    TResult Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult Function(_SyncAllSyncEvent value)? syncAll,
    TResult Function(_AddUserSyncEvent value)? addUser,
    TResult Function(_AuthProgressSyncEvent value)? authProgress,
    TResult Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult Function(_NotAuthSyncEvent value)? notAuth,
    TResult Function(_SyncDataSyncEvent value)? syncData,
    required TResult orElse(),
  }) {
    if (authProgress != null) {
      return authProgress(this);
    }
    return orElse();
  }
}

abstract class _AuthProgressSyncEvent extends SyncEvent {
  const factory _AuthProgressSyncEvent() = _$_AuthProgressSyncEvent;
  const _AuthProgressSyncEvent._() : super._();
}

/// @nodoc
abstract class _$$_AuthAuthenticatedSyncEventCopyWith<$Res> {
  factory _$$_AuthAuthenticatedSyncEventCopyWith(
          _$_AuthAuthenticatedSyncEvent value,
          $Res Function(_$_AuthAuthenticatedSyncEvent) then) =
      __$$_AuthAuthenticatedSyncEventCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$_AuthAuthenticatedSyncEventCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$_AuthAuthenticatedSyncEvent>
    implements _$$_AuthAuthenticatedSyncEventCopyWith<$Res> {
  __$$_AuthAuthenticatedSyncEventCopyWithImpl(
      _$_AuthAuthenticatedSyncEvent _value,
      $Res Function(_$_AuthAuthenticatedSyncEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_AuthAuthenticatedSyncEvent(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_AuthAuthenticatedSyncEvent extends _AuthAuthenticatedSyncEvent {
  const _$_AuthAuthenticatedSyncEvent({required this.user}) : super._();

  @override
  final User user;

  @override
  String toString() {
    return 'SyncEvent.authAuthenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthAuthenticatedSyncEvent &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthAuthenticatedSyncEventCopyWith<_$_AuthAuthenticatedSyncEvent>
      get copyWith => __$$_AuthAuthenticatedSyncEventCopyWithImpl<
          _$_AuthAuthenticatedSyncEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createCloudDatabase,
    required TResult Function() refreshConnection,
    required TResult Function() syncNow,
    required TResult Function() syncLastDay,
    required TResult Function() syncLastMonth,
    required TResult Function() syncAll,
    required TResult Function(User user) addUser,
    required TResult Function() authProgress,
    required TResult Function(User user) authAuthenticated,
    required TResult Function() notAuth,
    required TResult Function(DateTime syncDate) syncData,
  }) {
    return authAuthenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createCloudDatabase,
    TResult? Function()? refreshConnection,
    TResult? Function()? syncNow,
    TResult? Function()? syncLastDay,
    TResult? Function()? syncLastMonth,
    TResult? Function()? syncAll,
    TResult? Function(User user)? addUser,
    TResult? Function()? authProgress,
    TResult? Function(User user)? authAuthenticated,
    TResult? Function()? notAuth,
    TResult? Function(DateTime syncDate)? syncData,
  }) {
    return authAuthenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createCloudDatabase,
    TResult Function()? refreshConnection,
    TResult Function()? syncNow,
    TResult Function()? syncLastDay,
    TResult Function()? syncLastMonth,
    TResult Function()? syncAll,
    TResult Function(User user)? addUser,
    TResult Function()? authProgress,
    TResult Function(User user)? authAuthenticated,
    TResult Function()? notAuth,
    TResult Function(DateTime syncDate)? syncData,
    required TResult orElse(),
  }) {
    if (authAuthenticated != null) {
      return authAuthenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateCloudDatabaseSyncEvent value)
        createCloudDatabase,
    required TResult Function(_RefreshConnectionSyncEvent value)
        refreshConnection,
    required TResult Function(_SyncNowSyncEvent value) syncNow,
    required TResult Function(_SyncLastDaySyncEvent value) syncLastDay,
    required TResult Function(_SyncLastMonthSyncEvent value) syncLastMonth,
    required TResult Function(_SyncAllSyncEvent value) syncAll,
    required TResult Function(_AddUserSyncEvent value) addUser,
    required TResult Function(_AuthProgressSyncEvent value) authProgress,
    required TResult Function(_AuthAuthenticatedSyncEvent value)
        authAuthenticated,
    required TResult Function(_NotAuthSyncEvent value) notAuth,
    required TResult Function(_SyncDataSyncEvent value) syncData,
  }) {
    return authAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult? Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult? Function(_SyncNowSyncEvent value)? syncNow,
    TResult? Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult? Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult? Function(_SyncAllSyncEvent value)? syncAll,
    TResult? Function(_AddUserSyncEvent value)? addUser,
    TResult? Function(_AuthProgressSyncEvent value)? authProgress,
    TResult? Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult? Function(_NotAuthSyncEvent value)? notAuth,
    TResult? Function(_SyncDataSyncEvent value)? syncData,
  }) {
    return authAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult Function(_SyncNowSyncEvent value)? syncNow,
    TResult Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult Function(_SyncAllSyncEvent value)? syncAll,
    TResult Function(_AddUserSyncEvent value)? addUser,
    TResult Function(_AuthProgressSyncEvent value)? authProgress,
    TResult Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult Function(_NotAuthSyncEvent value)? notAuth,
    TResult Function(_SyncDataSyncEvent value)? syncData,
    required TResult orElse(),
  }) {
    if (authAuthenticated != null) {
      return authAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthAuthenticatedSyncEvent extends SyncEvent {
  const factory _AuthAuthenticatedSyncEvent({required final User user}) =
      _$_AuthAuthenticatedSyncEvent;
  const _AuthAuthenticatedSyncEvent._() : super._();

  User get user;
  @JsonKey(ignore: true)
  _$$_AuthAuthenticatedSyncEventCopyWith<_$_AuthAuthenticatedSyncEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotAuthSyncEventCopyWith<$Res> {
  factory _$$_NotAuthSyncEventCopyWith(
          _$_NotAuthSyncEvent value, $Res Function(_$_NotAuthSyncEvent) then) =
      __$$_NotAuthSyncEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotAuthSyncEventCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$_NotAuthSyncEvent>
    implements _$$_NotAuthSyncEventCopyWith<$Res> {
  __$$_NotAuthSyncEventCopyWithImpl(
      _$_NotAuthSyncEvent _value, $Res Function(_$_NotAuthSyncEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NotAuthSyncEvent extends _NotAuthSyncEvent {
  const _$_NotAuthSyncEvent() : super._();

  @override
  String toString() {
    return 'SyncEvent.notAuth()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotAuthSyncEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createCloudDatabase,
    required TResult Function() refreshConnection,
    required TResult Function() syncNow,
    required TResult Function() syncLastDay,
    required TResult Function() syncLastMonth,
    required TResult Function() syncAll,
    required TResult Function(User user) addUser,
    required TResult Function() authProgress,
    required TResult Function(User user) authAuthenticated,
    required TResult Function() notAuth,
    required TResult Function(DateTime syncDate) syncData,
  }) {
    return notAuth();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createCloudDatabase,
    TResult? Function()? refreshConnection,
    TResult? Function()? syncNow,
    TResult? Function()? syncLastDay,
    TResult? Function()? syncLastMonth,
    TResult? Function()? syncAll,
    TResult? Function(User user)? addUser,
    TResult? Function()? authProgress,
    TResult? Function(User user)? authAuthenticated,
    TResult? Function()? notAuth,
    TResult? Function(DateTime syncDate)? syncData,
  }) {
    return notAuth?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createCloudDatabase,
    TResult Function()? refreshConnection,
    TResult Function()? syncNow,
    TResult Function()? syncLastDay,
    TResult Function()? syncLastMonth,
    TResult Function()? syncAll,
    TResult Function(User user)? addUser,
    TResult Function()? authProgress,
    TResult Function(User user)? authAuthenticated,
    TResult Function()? notAuth,
    TResult Function(DateTime syncDate)? syncData,
    required TResult orElse(),
  }) {
    if (notAuth != null) {
      return notAuth();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateCloudDatabaseSyncEvent value)
        createCloudDatabase,
    required TResult Function(_RefreshConnectionSyncEvent value)
        refreshConnection,
    required TResult Function(_SyncNowSyncEvent value) syncNow,
    required TResult Function(_SyncLastDaySyncEvent value) syncLastDay,
    required TResult Function(_SyncLastMonthSyncEvent value) syncLastMonth,
    required TResult Function(_SyncAllSyncEvent value) syncAll,
    required TResult Function(_AddUserSyncEvent value) addUser,
    required TResult Function(_AuthProgressSyncEvent value) authProgress,
    required TResult Function(_AuthAuthenticatedSyncEvent value)
        authAuthenticated,
    required TResult Function(_NotAuthSyncEvent value) notAuth,
    required TResult Function(_SyncDataSyncEvent value) syncData,
  }) {
    return notAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult? Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult? Function(_SyncNowSyncEvent value)? syncNow,
    TResult? Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult? Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult? Function(_SyncAllSyncEvent value)? syncAll,
    TResult? Function(_AddUserSyncEvent value)? addUser,
    TResult? Function(_AuthProgressSyncEvent value)? authProgress,
    TResult? Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult? Function(_NotAuthSyncEvent value)? notAuth,
    TResult? Function(_SyncDataSyncEvent value)? syncData,
  }) {
    return notAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult Function(_SyncNowSyncEvent value)? syncNow,
    TResult Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult Function(_SyncAllSyncEvent value)? syncAll,
    TResult Function(_AddUserSyncEvent value)? addUser,
    TResult Function(_AuthProgressSyncEvent value)? authProgress,
    TResult Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult Function(_NotAuthSyncEvent value)? notAuth,
    TResult Function(_SyncDataSyncEvent value)? syncData,
    required TResult orElse(),
  }) {
    if (notAuth != null) {
      return notAuth(this);
    }
    return orElse();
  }
}

abstract class _NotAuthSyncEvent extends SyncEvent {
  const factory _NotAuthSyncEvent() = _$_NotAuthSyncEvent;
  const _NotAuthSyncEvent._() : super._();
}

/// @nodoc
abstract class _$$_SyncDataSyncEventCopyWith<$Res> {
  factory _$$_SyncDataSyncEventCopyWith(_$_SyncDataSyncEvent value,
          $Res Function(_$_SyncDataSyncEvent) then) =
      __$$_SyncDataSyncEventCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime syncDate});
}

/// @nodoc
class __$$_SyncDataSyncEventCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$_SyncDataSyncEvent>
    implements _$$_SyncDataSyncEventCopyWith<$Res> {
  __$$_SyncDataSyncEventCopyWithImpl(
      _$_SyncDataSyncEvent _value, $Res Function(_$_SyncDataSyncEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syncDate = null,
  }) {
    return _then(_$_SyncDataSyncEvent(
      syncDate: null == syncDate
          ? _value.syncDate
          : syncDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_SyncDataSyncEvent extends _SyncDataSyncEvent {
  const _$_SyncDataSyncEvent({required this.syncDate}) : super._();

  @override
  final DateTime syncDate;

  @override
  String toString() {
    return 'SyncEvent.syncData(syncDate: $syncDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SyncDataSyncEvent &&
            (identical(other.syncDate, syncDate) ||
                other.syncDate == syncDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, syncDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SyncDataSyncEventCopyWith<_$_SyncDataSyncEvent> get copyWith =>
      __$$_SyncDataSyncEventCopyWithImpl<_$_SyncDataSyncEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() createCloudDatabase,
    required TResult Function() refreshConnection,
    required TResult Function() syncNow,
    required TResult Function() syncLastDay,
    required TResult Function() syncLastMonth,
    required TResult Function() syncAll,
    required TResult Function(User user) addUser,
    required TResult Function() authProgress,
    required TResult Function(User user) authAuthenticated,
    required TResult Function() notAuth,
    required TResult Function(DateTime syncDate) syncData,
  }) {
    return syncData(syncDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? createCloudDatabase,
    TResult? Function()? refreshConnection,
    TResult? Function()? syncNow,
    TResult? Function()? syncLastDay,
    TResult? Function()? syncLastMonth,
    TResult? Function()? syncAll,
    TResult? Function(User user)? addUser,
    TResult? Function()? authProgress,
    TResult? Function(User user)? authAuthenticated,
    TResult? Function()? notAuth,
    TResult? Function(DateTime syncDate)? syncData,
  }) {
    return syncData?.call(syncDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? createCloudDatabase,
    TResult Function()? refreshConnection,
    TResult Function()? syncNow,
    TResult Function()? syncLastDay,
    TResult Function()? syncLastMonth,
    TResult Function()? syncAll,
    TResult Function(User user)? addUser,
    TResult Function()? authProgress,
    TResult Function(User user)? authAuthenticated,
    TResult Function()? notAuth,
    TResult Function(DateTime syncDate)? syncData,
    required TResult orElse(),
  }) {
    if (syncData != null) {
      return syncData(syncDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateCloudDatabaseSyncEvent value)
        createCloudDatabase,
    required TResult Function(_RefreshConnectionSyncEvent value)
        refreshConnection,
    required TResult Function(_SyncNowSyncEvent value) syncNow,
    required TResult Function(_SyncLastDaySyncEvent value) syncLastDay,
    required TResult Function(_SyncLastMonthSyncEvent value) syncLastMonth,
    required TResult Function(_SyncAllSyncEvent value) syncAll,
    required TResult Function(_AddUserSyncEvent value) addUser,
    required TResult Function(_AuthProgressSyncEvent value) authProgress,
    required TResult Function(_AuthAuthenticatedSyncEvent value)
        authAuthenticated,
    required TResult Function(_NotAuthSyncEvent value) notAuth,
    required TResult Function(_SyncDataSyncEvent value) syncData,
  }) {
    return syncData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult? Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult? Function(_SyncNowSyncEvent value)? syncNow,
    TResult? Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult? Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult? Function(_SyncAllSyncEvent value)? syncAll,
    TResult? Function(_AddUserSyncEvent value)? addUser,
    TResult? Function(_AuthProgressSyncEvent value)? authProgress,
    TResult? Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult? Function(_NotAuthSyncEvent value)? notAuth,
    TResult? Function(_SyncDataSyncEvent value)? syncData,
  }) {
    return syncData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateCloudDatabaseSyncEvent value)? createCloudDatabase,
    TResult Function(_RefreshConnectionSyncEvent value)? refreshConnection,
    TResult Function(_SyncNowSyncEvent value)? syncNow,
    TResult Function(_SyncLastDaySyncEvent value)? syncLastDay,
    TResult Function(_SyncLastMonthSyncEvent value)? syncLastMonth,
    TResult Function(_SyncAllSyncEvent value)? syncAll,
    TResult Function(_AddUserSyncEvent value)? addUser,
    TResult Function(_AuthProgressSyncEvent value)? authProgress,
    TResult Function(_AuthAuthenticatedSyncEvent value)? authAuthenticated,
    TResult Function(_NotAuthSyncEvent value)? notAuth,
    TResult Function(_SyncDataSyncEvent value)? syncData,
    required TResult orElse(),
  }) {
    if (syncData != null) {
      return syncData(this);
    }
    return orElse();
  }
}

abstract class _SyncDataSyncEvent extends SyncEvent {
  const factory _SyncDataSyncEvent({required final DateTime syncDate}) =
      _$_SyncDataSyncEvent;
  const _SyncDataSyncEvent._() : super._();

  DateTime get syncDate;
  @JsonKey(ignore: true)
  _$$_SyncDataSyncEventCopyWith<_$_SyncDataSyncEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SyncState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inProgress,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingToCloud,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingFromCloud,
    required TResult Function(DateTime syncDate, bool isAdmin) synced,
    required TResult Function() notSynced,
    required TResult Function() failure,
    required TResult Function() noDB,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inProgress,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult? Function(DateTime syncDate, bool isAdmin)? synced,
    TResult? Function()? notSynced,
    TResult? Function()? failure,
    TResult? Function()? noDB,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inProgress,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult Function(DateTime syncDate, bool isAdmin)? synced,
    TResult Function()? notSynced,
    TResult Function()? failure,
    TResult Function()? noDB,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InProgressSyncState value) inProgress,
    required TResult Function(_LoadingToCloudSyncState value) loadingToCloud,
    required TResult Function(_LoadingFromCloudSyncState value)
        loadingFromCloud,
    required TResult Function(_SyncedSyncState value) synced,
    required TResult Function(_NotSyncedSyncState value) notSynced,
    required TResult Function(_FailureSyncState value) failure,
    required TResult Function(_NoDBSyncState value) noDB,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InProgressSyncState value)? inProgress,
    TResult? Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult? Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult? Function(_SyncedSyncState value)? synced,
    TResult? Function(_NotSyncedSyncState value)? notSynced,
    TResult? Function(_FailureSyncState value)? failure,
    TResult? Function(_NoDBSyncState value)? noDB,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InProgressSyncState value)? inProgress,
    TResult Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult Function(_SyncedSyncState value)? synced,
    TResult Function(_NotSyncedSyncState value)? notSynced,
    TResult Function(_FailureSyncState value)? failure,
    TResult Function(_NoDBSyncState value)? noDB,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncStateCopyWith<$Res> {
  factory $SyncStateCopyWith(SyncState value, $Res Function(SyncState) then) =
      _$SyncStateCopyWithImpl<$Res, SyncState>;
}

/// @nodoc
class _$SyncStateCopyWithImpl<$Res, $Val extends SyncState>
    implements $SyncStateCopyWith<$Res> {
  _$SyncStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InProgressSyncStateCopyWith<$Res> {
  factory _$$_InProgressSyncStateCopyWith(_$_InProgressSyncState value,
          $Res Function(_$_InProgressSyncState) then) =
      __$$_InProgressSyncStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InProgressSyncStateCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$_InProgressSyncState>
    implements _$$_InProgressSyncStateCopyWith<$Res> {
  __$$_InProgressSyncStateCopyWithImpl(_$_InProgressSyncState _value,
      $Res Function(_$_InProgressSyncState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InProgressSyncState extends _InProgressSyncState {
  const _$_InProgressSyncState() : super._();

  @override
  String toString() {
    return 'SyncState.inProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InProgressSyncState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inProgress,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingToCloud,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingFromCloud,
    required TResult Function(DateTime syncDate, bool isAdmin) synced,
    required TResult Function() notSynced,
    required TResult Function() failure,
    required TResult Function() noDB,
  }) {
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inProgress,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult? Function(DateTime syncDate, bool isAdmin)? synced,
    TResult? Function()? notSynced,
    TResult? Function()? failure,
    TResult? Function()? noDB,
  }) {
    return inProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inProgress,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult Function(DateTime syncDate, bool isAdmin)? synced,
    TResult Function()? notSynced,
    TResult Function()? failure,
    TResult Function()? noDB,
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
    required TResult Function(_InProgressSyncState value) inProgress,
    required TResult Function(_LoadingToCloudSyncState value) loadingToCloud,
    required TResult Function(_LoadingFromCloudSyncState value)
        loadingFromCloud,
    required TResult Function(_SyncedSyncState value) synced,
    required TResult Function(_NotSyncedSyncState value) notSynced,
    required TResult Function(_FailureSyncState value) failure,
    required TResult Function(_NoDBSyncState value) noDB,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InProgressSyncState value)? inProgress,
    TResult? Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult? Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult? Function(_SyncedSyncState value)? synced,
    TResult? Function(_NotSyncedSyncState value)? notSynced,
    TResult? Function(_FailureSyncState value)? failure,
    TResult? Function(_NoDBSyncState value)? noDB,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InProgressSyncState value)? inProgress,
    TResult Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult Function(_SyncedSyncState value)? synced,
    TResult Function(_NotSyncedSyncState value)? notSynced,
    TResult Function(_FailureSyncState value)? failure,
    TResult Function(_NoDBSyncState value)? noDB,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class _InProgressSyncState extends SyncState {
  const factory _InProgressSyncState() = _$_InProgressSyncState;
  const _InProgressSyncState._() : super._();
}

/// @nodoc
abstract class _$$_LoadingToCloudSyncStateCopyWith<$Res> {
  factory _$$_LoadingToCloudSyncStateCopyWith(_$_LoadingToCloudSyncState value,
          $Res Function(_$_LoadingToCloudSyncState) then) =
      __$$_LoadingToCloudSyncStateCopyWithImpl<$Res>;
  @useResult
  $Res call({int accountCount, int categoryCount, int operationCount});
}

/// @nodoc
class __$$_LoadingToCloudSyncStateCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$_LoadingToCloudSyncState>
    implements _$$_LoadingToCloudSyncStateCopyWith<$Res> {
  __$$_LoadingToCloudSyncStateCopyWithImpl(_$_LoadingToCloudSyncState _value,
      $Res Function(_$_LoadingToCloudSyncState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountCount = null,
    Object? categoryCount = null,
    Object? operationCount = null,
  }) {
    return _then(_$_LoadingToCloudSyncState(
      accountCount: null == accountCount
          ? _value.accountCount
          : accountCount // ignore: cast_nullable_to_non_nullable
              as int,
      categoryCount: null == categoryCount
          ? _value.categoryCount
          : categoryCount // ignore: cast_nullable_to_non_nullable
              as int,
      operationCount: null == operationCount
          ? _value.operationCount
          : operationCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LoadingToCloudSyncState extends _LoadingToCloudSyncState {
  const _$_LoadingToCloudSyncState(
      {required this.accountCount,
      required this.categoryCount,
      required this.operationCount})
      : super._();

  @override
  final int accountCount;
  @override
  final int categoryCount;
  @override
  final int operationCount;

  @override
  String toString() {
    return 'SyncState.loadingToCloud(accountCount: $accountCount, categoryCount: $categoryCount, operationCount: $operationCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadingToCloudSyncState &&
            (identical(other.accountCount, accountCount) ||
                other.accountCount == accountCount) &&
            (identical(other.categoryCount, categoryCount) ||
                other.categoryCount == categoryCount) &&
            (identical(other.operationCount, operationCount) ||
                other.operationCount == operationCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accountCount, categoryCount, operationCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingToCloudSyncStateCopyWith<_$_LoadingToCloudSyncState>
      get copyWith =>
          __$$_LoadingToCloudSyncStateCopyWithImpl<_$_LoadingToCloudSyncState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inProgress,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingToCloud,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingFromCloud,
    required TResult Function(DateTime syncDate, bool isAdmin) synced,
    required TResult Function() notSynced,
    required TResult Function() failure,
    required TResult Function() noDB,
  }) {
    return loadingToCloud(accountCount, categoryCount, operationCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inProgress,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult? Function(DateTime syncDate, bool isAdmin)? synced,
    TResult? Function()? notSynced,
    TResult? Function()? failure,
    TResult? Function()? noDB,
  }) {
    return loadingToCloud?.call(accountCount, categoryCount, operationCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inProgress,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult Function(DateTime syncDate, bool isAdmin)? synced,
    TResult Function()? notSynced,
    TResult Function()? failure,
    TResult Function()? noDB,
    required TResult orElse(),
  }) {
    if (loadingToCloud != null) {
      return loadingToCloud(accountCount, categoryCount, operationCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InProgressSyncState value) inProgress,
    required TResult Function(_LoadingToCloudSyncState value) loadingToCloud,
    required TResult Function(_LoadingFromCloudSyncState value)
        loadingFromCloud,
    required TResult Function(_SyncedSyncState value) synced,
    required TResult Function(_NotSyncedSyncState value) notSynced,
    required TResult Function(_FailureSyncState value) failure,
    required TResult Function(_NoDBSyncState value) noDB,
  }) {
    return loadingToCloud(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InProgressSyncState value)? inProgress,
    TResult? Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult? Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult? Function(_SyncedSyncState value)? synced,
    TResult? Function(_NotSyncedSyncState value)? notSynced,
    TResult? Function(_FailureSyncState value)? failure,
    TResult? Function(_NoDBSyncState value)? noDB,
  }) {
    return loadingToCloud?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InProgressSyncState value)? inProgress,
    TResult Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult Function(_SyncedSyncState value)? synced,
    TResult Function(_NotSyncedSyncState value)? notSynced,
    TResult Function(_FailureSyncState value)? failure,
    TResult Function(_NoDBSyncState value)? noDB,
    required TResult orElse(),
  }) {
    if (loadingToCloud != null) {
      return loadingToCloud(this);
    }
    return orElse();
  }
}

abstract class _LoadingToCloudSyncState extends SyncState {
  const factory _LoadingToCloudSyncState(
      {required final int accountCount,
      required final int categoryCount,
      required final int operationCount}) = _$_LoadingToCloudSyncState;
  const _LoadingToCloudSyncState._() : super._();

  int get accountCount;
  int get categoryCount;
  int get operationCount;
  @JsonKey(ignore: true)
  _$$_LoadingToCloudSyncStateCopyWith<_$_LoadingToCloudSyncState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingFromCloudSyncStateCopyWith<$Res> {
  factory _$$_LoadingFromCloudSyncStateCopyWith(
          _$_LoadingFromCloudSyncState value,
          $Res Function(_$_LoadingFromCloudSyncState) then) =
      __$$_LoadingFromCloudSyncStateCopyWithImpl<$Res>;
  @useResult
  $Res call({int accountCount, int categoryCount, int operationCount});
}

/// @nodoc
class __$$_LoadingFromCloudSyncStateCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$_LoadingFromCloudSyncState>
    implements _$$_LoadingFromCloudSyncStateCopyWith<$Res> {
  __$$_LoadingFromCloudSyncStateCopyWithImpl(
      _$_LoadingFromCloudSyncState _value,
      $Res Function(_$_LoadingFromCloudSyncState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountCount = null,
    Object? categoryCount = null,
    Object? operationCount = null,
  }) {
    return _then(_$_LoadingFromCloudSyncState(
      accountCount: null == accountCount
          ? _value.accountCount
          : accountCount // ignore: cast_nullable_to_non_nullable
              as int,
      categoryCount: null == categoryCount
          ? _value.categoryCount
          : categoryCount // ignore: cast_nullable_to_non_nullable
              as int,
      operationCount: null == operationCount
          ? _value.operationCount
          : operationCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LoadingFromCloudSyncState extends _LoadingFromCloudSyncState {
  const _$_LoadingFromCloudSyncState(
      {required this.accountCount,
      required this.categoryCount,
      required this.operationCount})
      : super._();

  @override
  final int accountCount;
  @override
  final int categoryCount;
  @override
  final int operationCount;

  @override
  String toString() {
    return 'SyncState.loadingFromCloud(accountCount: $accountCount, categoryCount: $categoryCount, operationCount: $operationCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadingFromCloudSyncState &&
            (identical(other.accountCount, accountCount) ||
                other.accountCount == accountCount) &&
            (identical(other.categoryCount, categoryCount) ||
                other.categoryCount == categoryCount) &&
            (identical(other.operationCount, operationCount) ||
                other.operationCount == operationCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accountCount, categoryCount, operationCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingFromCloudSyncStateCopyWith<_$_LoadingFromCloudSyncState>
      get copyWith => __$$_LoadingFromCloudSyncStateCopyWithImpl<
          _$_LoadingFromCloudSyncState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inProgress,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingToCloud,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingFromCloud,
    required TResult Function(DateTime syncDate, bool isAdmin) synced,
    required TResult Function() notSynced,
    required TResult Function() failure,
    required TResult Function() noDB,
  }) {
    return loadingFromCloud(accountCount, categoryCount, operationCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inProgress,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult? Function(DateTime syncDate, bool isAdmin)? synced,
    TResult? Function()? notSynced,
    TResult? Function()? failure,
    TResult? Function()? noDB,
  }) {
    return loadingFromCloud?.call(accountCount, categoryCount, operationCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inProgress,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult Function(DateTime syncDate, bool isAdmin)? synced,
    TResult Function()? notSynced,
    TResult Function()? failure,
    TResult Function()? noDB,
    required TResult orElse(),
  }) {
    if (loadingFromCloud != null) {
      return loadingFromCloud(accountCount, categoryCount, operationCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InProgressSyncState value) inProgress,
    required TResult Function(_LoadingToCloudSyncState value) loadingToCloud,
    required TResult Function(_LoadingFromCloudSyncState value)
        loadingFromCloud,
    required TResult Function(_SyncedSyncState value) synced,
    required TResult Function(_NotSyncedSyncState value) notSynced,
    required TResult Function(_FailureSyncState value) failure,
    required TResult Function(_NoDBSyncState value) noDB,
  }) {
    return loadingFromCloud(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InProgressSyncState value)? inProgress,
    TResult? Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult? Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult? Function(_SyncedSyncState value)? synced,
    TResult? Function(_NotSyncedSyncState value)? notSynced,
    TResult? Function(_FailureSyncState value)? failure,
    TResult? Function(_NoDBSyncState value)? noDB,
  }) {
    return loadingFromCloud?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InProgressSyncState value)? inProgress,
    TResult Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult Function(_SyncedSyncState value)? synced,
    TResult Function(_NotSyncedSyncState value)? notSynced,
    TResult Function(_FailureSyncState value)? failure,
    TResult Function(_NoDBSyncState value)? noDB,
    required TResult orElse(),
  }) {
    if (loadingFromCloud != null) {
      return loadingFromCloud(this);
    }
    return orElse();
  }
}

abstract class _LoadingFromCloudSyncState extends SyncState {
  const factory _LoadingFromCloudSyncState(
      {required final int accountCount,
      required final int categoryCount,
      required final int operationCount}) = _$_LoadingFromCloudSyncState;
  const _LoadingFromCloudSyncState._() : super._();

  int get accountCount;
  int get categoryCount;
  int get operationCount;
  @JsonKey(ignore: true)
  _$$_LoadingFromCloudSyncStateCopyWith<_$_LoadingFromCloudSyncState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SyncedSyncStateCopyWith<$Res> {
  factory _$$_SyncedSyncStateCopyWith(
          _$_SyncedSyncState value, $Res Function(_$_SyncedSyncState) then) =
      __$$_SyncedSyncStateCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime syncDate, bool isAdmin});
}

/// @nodoc
class __$$_SyncedSyncStateCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$_SyncedSyncState>
    implements _$$_SyncedSyncStateCopyWith<$Res> {
  __$$_SyncedSyncStateCopyWithImpl(
      _$_SyncedSyncState _value, $Res Function(_$_SyncedSyncState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syncDate = null,
    Object? isAdmin = null,
  }) {
    return _then(_$_SyncedSyncState(
      syncDate: null == syncDate
          ? _value.syncDate
          : syncDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SyncedSyncState extends _SyncedSyncState {
  const _$_SyncedSyncState({required this.syncDate, required this.isAdmin})
      : super._();

  @override
  final DateTime syncDate;
  @override
  final bool isAdmin;

  @override
  String toString() {
    return 'SyncState.synced(syncDate: $syncDate, isAdmin: $isAdmin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SyncedSyncState &&
            (identical(other.syncDate, syncDate) ||
                other.syncDate == syncDate) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, syncDate, isAdmin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SyncedSyncStateCopyWith<_$_SyncedSyncState> get copyWith =>
      __$$_SyncedSyncStateCopyWithImpl<_$_SyncedSyncState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inProgress,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingToCloud,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingFromCloud,
    required TResult Function(DateTime syncDate, bool isAdmin) synced,
    required TResult Function() notSynced,
    required TResult Function() failure,
    required TResult Function() noDB,
  }) {
    return synced(syncDate, isAdmin);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inProgress,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult? Function(DateTime syncDate, bool isAdmin)? synced,
    TResult? Function()? notSynced,
    TResult? Function()? failure,
    TResult? Function()? noDB,
  }) {
    return synced?.call(syncDate, isAdmin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inProgress,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult Function(DateTime syncDate, bool isAdmin)? synced,
    TResult Function()? notSynced,
    TResult Function()? failure,
    TResult Function()? noDB,
    required TResult orElse(),
  }) {
    if (synced != null) {
      return synced(syncDate, isAdmin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InProgressSyncState value) inProgress,
    required TResult Function(_LoadingToCloudSyncState value) loadingToCloud,
    required TResult Function(_LoadingFromCloudSyncState value)
        loadingFromCloud,
    required TResult Function(_SyncedSyncState value) synced,
    required TResult Function(_NotSyncedSyncState value) notSynced,
    required TResult Function(_FailureSyncState value) failure,
    required TResult Function(_NoDBSyncState value) noDB,
  }) {
    return synced(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InProgressSyncState value)? inProgress,
    TResult? Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult? Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult? Function(_SyncedSyncState value)? synced,
    TResult? Function(_NotSyncedSyncState value)? notSynced,
    TResult? Function(_FailureSyncState value)? failure,
    TResult? Function(_NoDBSyncState value)? noDB,
  }) {
    return synced?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InProgressSyncState value)? inProgress,
    TResult Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult Function(_SyncedSyncState value)? synced,
    TResult Function(_NotSyncedSyncState value)? notSynced,
    TResult Function(_FailureSyncState value)? failure,
    TResult Function(_NoDBSyncState value)? noDB,
    required TResult orElse(),
  }) {
    if (synced != null) {
      return synced(this);
    }
    return orElse();
  }
}

abstract class _SyncedSyncState extends SyncState {
  const factory _SyncedSyncState(
      {required final DateTime syncDate,
      required final bool isAdmin}) = _$_SyncedSyncState;
  const _SyncedSyncState._() : super._();

  DateTime get syncDate;
  bool get isAdmin;
  @JsonKey(ignore: true)
  _$$_SyncedSyncStateCopyWith<_$_SyncedSyncState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotSyncedSyncStateCopyWith<$Res> {
  factory _$$_NotSyncedSyncStateCopyWith(_$_NotSyncedSyncState value,
          $Res Function(_$_NotSyncedSyncState) then) =
      __$$_NotSyncedSyncStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotSyncedSyncStateCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$_NotSyncedSyncState>
    implements _$$_NotSyncedSyncStateCopyWith<$Res> {
  __$$_NotSyncedSyncStateCopyWithImpl(
      _$_NotSyncedSyncState _value, $Res Function(_$_NotSyncedSyncState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NotSyncedSyncState extends _NotSyncedSyncState {
  const _$_NotSyncedSyncState() : super._();

  @override
  String toString() {
    return 'SyncState.notSynced()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotSyncedSyncState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inProgress,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingToCloud,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingFromCloud,
    required TResult Function(DateTime syncDate, bool isAdmin) synced,
    required TResult Function() notSynced,
    required TResult Function() failure,
    required TResult Function() noDB,
  }) {
    return notSynced();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inProgress,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult? Function(DateTime syncDate, bool isAdmin)? synced,
    TResult? Function()? notSynced,
    TResult? Function()? failure,
    TResult? Function()? noDB,
  }) {
    return notSynced?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inProgress,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult Function(DateTime syncDate, bool isAdmin)? synced,
    TResult Function()? notSynced,
    TResult Function()? failure,
    TResult Function()? noDB,
    required TResult orElse(),
  }) {
    if (notSynced != null) {
      return notSynced();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InProgressSyncState value) inProgress,
    required TResult Function(_LoadingToCloudSyncState value) loadingToCloud,
    required TResult Function(_LoadingFromCloudSyncState value)
        loadingFromCloud,
    required TResult Function(_SyncedSyncState value) synced,
    required TResult Function(_NotSyncedSyncState value) notSynced,
    required TResult Function(_FailureSyncState value) failure,
    required TResult Function(_NoDBSyncState value) noDB,
  }) {
    return notSynced(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InProgressSyncState value)? inProgress,
    TResult? Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult? Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult? Function(_SyncedSyncState value)? synced,
    TResult? Function(_NotSyncedSyncState value)? notSynced,
    TResult? Function(_FailureSyncState value)? failure,
    TResult? Function(_NoDBSyncState value)? noDB,
  }) {
    return notSynced?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InProgressSyncState value)? inProgress,
    TResult Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult Function(_SyncedSyncState value)? synced,
    TResult Function(_NotSyncedSyncState value)? notSynced,
    TResult Function(_FailureSyncState value)? failure,
    TResult Function(_NoDBSyncState value)? noDB,
    required TResult orElse(),
  }) {
    if (notSynced != null) {
      return notSynced(this);
    }
    return orElse();
  }
}

abstract class _NotSyncedSyncState extends SyncState {
  const factory _NotSyncedSyncState() = _$_NotSyncedSyncState;
  const _NotSyncedSyncState._() : super._();
}

/// @nodoc
abstract class _$$_FailureSyncStateCopyWith<$Res> {
  factory _$$_FailureSyncStateCopyWith(
          _$_FailureSyncState value, $Res Function(_$_FailureSyncState) then) =
      __$$_FailureSyncStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FailureSyncStateCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$_FailureSyncState>
    implements _$$_FailureSyncStateCopyWith<$Res> {
  __$$_FailureSyncStateCopyWithImpl(
      _$_FailureSyncState _value, $Res Function(_$_FailureSyncState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FailureSyncState extends _FailureSyncState {
  const _$_FailureSyncState() : super._();

  @override
  String toString() {
    return 'SyncState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FailureSyncState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inProgress,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingToCloud,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingFromCloud,
    required TResult Function(DateTime syncDate, bool isAdmin) synced,
    required TResult Function() notSynced,
    required TResult Function() failure,
    required TResult Function() noDB,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inProgress,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult? Function(DateTime syncDate, bool isAdmin)? synced,
    TResult? Function()? notSynced,
    TResult? Function()? failure,
    TResult? Function()? noDB,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inProgress,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult Function(DateTime syncDate, bool isAdmin)? synced,
    TResult Function()? notSynced,
    TResult Function()? failure,
    TResult Function()? noDB,
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
    required TResult Function(_InProgressSyncState value) inProgress,
    required TResult Function(_LoadingToCloudSyncState value) loadingToCloud,
    required TResult Function(_LoadingFromCloudSyncState value)
        loadingFromCloud,
    required TResult Function(_SyncedSyncState value) synced,
    required TResult Function(_NotSyncedSyncState value) notSynced,
    required TResult Function(_FailureSyncState value) failure,
    required TResult Function(_NoDBSyncState value) noDB,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InProgressSyncState value)? inProgress,
    TResult? Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult? Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult? Function(_SyncedSyncState value)? synced,
    TResult? Function(_NotSyncedSyncState value)? notSynced,
    TResult? Function(_FailureSyncState value)? failure,
    TResult? Function(_NoDBSyncState value)? noDB,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InProgressSyncState value)? inProgress,
    TResult Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult Function(_SyncedSyncState value)? synced,
    TResult Function(_NotSyncedSyncState value)? notSynced,
    TResult Function(_FailureSyncState value)? failure,
    TResult Function(_NoDBSyncState value)? noDB,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _FailureSyncState extends SyncState {
  const factory _FailureSyncState() = _$_FailureSyncState;
  const _FailureSyncState._() : super._();
}

/// @nodoc
abstract class _$$_NoDBSyncStateCopyWith<$Res> {
  factory _$$_NoDBSyncStateCopyWith(
          _$_NoDBSyncState value, $Res Function(_$_NoDBSyncState) then) =
      __$$_NoDBSyncStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NoDBSyncStateCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$_NoDBSyncState>
    implements _$$_NoDBSyncStateCopyWith<$Res> {
  __$$_NoDBSyncStateCopyWithImpl(
      _$_NoDBSyncState _value, $Res Function(_$_NoDBSyncState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NoDBSyncState extends _NoDBSyncState {
  const _$_NoDBSyncState() : super._();

  @override
  String toString() {
    return 'SyncState.noDB()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NoDBSyncState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() inProgress,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingToCloud,
    required TResult Function(
            int accountCount, int categoryCount, int operationCount)
        loadingFromCloud,
    required TResult Function(DateTime syncDate, bool isAdmin) synced,
    required TResult Function() notSynced,
    required TResult Function() failure,
    required TResult Function() noDB,
  }) {
    return noDB();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? inProgress,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult? Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult? Function(DateTime syncDate, bool isAdmin)? synced,
    TResult? Function()? notSynced,
    TResult? Function()? failure,
    TResult? Function()? noDB,
  }) {
    return noDB?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? inProgress,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingToCloud,
    TResult Function(int accountCount, int categoryCount, int operationCount)?
        loadingFromCloud,
    TResult Function(DateTime syncDate, bool isAdmin)? synced,
    TResult Function()? notSynced,
    TResult Function()? failure,
    TResult Function()? noDB,
    required TResult orElse(),
  }) {
    if (noDB != null) {
      return noDB();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InProgressSyncState value) inProgress,
    required TResult Function(_LoadingToCloudSyncState value) loadingToCloud,
    required TResult Function(_LoadingFromCloudSyncState value)
        loadingFromCloud,
    required TResult Function(_SyncedSyncState value) synced,
    required TResult Function(_NotSyncedSyncState value) notSynced,
    required TResult Function(_FailureSyncState value) failure,
    required TResult Function(_NoDBSyncState value) noDB,
  }) {
    return noDB(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InProgressSyncState value)? inProgress,
    TResult? Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult? Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult? Function(_SyncedSyncState value)? synced,
    TResult? Function(_NotSyncedSyncState value)? notSynced,
    TResult? Function(_FailureSyncState value)? failure,
    TResult? Function(_NoDBSyncState value)? noDB,
  }) {
    return noDB?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InProgressSyncState value)? inProgress,
    TResult Function(_LoadingToCloudSyncState value)? loadingToCloud,
    TResult Function(_LoadingFromCloudSyncState value)? loadingFromCloud,
    TResult Function(_SyncedSyncState value)? synced,
    TResult Function(_NotSyncedSyncState value)? notSynced,
    TResult Function(_FailureSyncState value)? failure,
    TResult Function(_NoDBSyncState value)? noDB,
    required TResult orElse(),
  }) {
    if (noDB != null) {
      return noDB(this);
    }
    return orElse();
  }
}

abstract class _NoDBSyncState extends SyncState {
  const factory _NoDBSyncState() = _$_NoDBSyncState;
  const _NoDBSyncState._() : super._();
}
