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
abstract class _$$CreateCloudDatabaseSyncEventImplCopyWith<$Res> {
  factory _$$CreateCloudDatabaseSyncEventImplCopyWith(
          _$CreateCloudDatabaseSyncEventImpl value,
          $Res Function(_$CreateCloudDatabaseSyncEventImpl) then) =
      __$$CreateCloudDatabaseSyncEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateCloudDatabaseSyncEventImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$CreateCloudDatabaseSyncEventImpl>
    implements _$$CreateCloudDatabaseSyncEventImplCopyWith<$Res> {
  __$$CreateCloudDatabaseSyncEventImplCopyWithImpl(
      _$CreateCloudDatabaseSyncEventImpl _value,
      $Res Function(_$CreateCloudDatabaseSyncEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateCloudDatabaseSyncEventImpl extends _CreateCloudDatabaseSyncEvent {
  const _$CreateCloudDatabaseSyncEventImpl() : super._();

  @override
  String toString() {
    return 'SyncEvent.createCloudDatabase()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCloudDatabaseSyncEventImpl);
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
      _$CreateCloudDatabaseSyncEventImpl;
  const _CreateCloudDatabaseSyncEvent._() : super._();
}

/// @nodoc
abstract class _$$RefreshConnectionSyncEventImplCopyWith<$Res> {
  factory _$$RefreshConnectionSyncEventImplCopyWith(
          _$RefreshConnectionSyncEventImpl value,
          $Res Function(_$RefreshConnectionSyncEventImpl) then) =
      __$$RefreshConnectionSyncEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshConnectionSyncEventImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$RefreshConnectionSyncEventImpl>
    implements _$$RefreshConnectionSyncEventImplCopyWith<$Res> {
  __$$RefreshConnectionSyncEventImplCopyWithImpl(
      _$RefreshConnectionSyncEventImpl _value,
      $Res Function(_$RefreshConnectionSyncEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshConnectionSyncEventImpl extends _RefreshConnectionSyncEvent {
  const _$RefreshConnectionSyncEventImpl() : super._();

  @override
  String toString() {
    return 'SyncEvent.refreshConnection()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshConnectionSyncEventImpl);
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
  const factory _RefreshConnectionSyncEvent() =
      _$RefreshConnectionSyncEventImpl;
  const _RefreshConnectionSyncEvent._() : super._();
}

/// @nodoc
abstract class _$$SyncNowSyncEventImplCopyWith<$Res> {
  factory _$$SyncNowSyncEventImplCopyWith(_$SyncNowSyncEventImpl value,
          $Res Function(_$SyncNowSyncEventImpl) then) =
      __$$SyncNowSyncEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncNowSyncEventImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$SyncNowSyncEventImpl>
    implements _$$SyncNowSyncEventImplCopyWith<$Res> {
  __$$SyncNowSyncEventImplCopyWithImpl(_$SyncNowSyncEventImpl _value,
      $Res Function(_$SyncNowSyncEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncNowSyncEventImpl extends _SyncNowSyncEvent {
  const _$SyncNowSyncEventImpl() : super._();

  @override
  String toString() {
    return 'SyncEvent.syncNow()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncNowSyncEventImpl);
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
  const factory _SyncNowSyncEvent() = _$SyncNowSyncEventImpl;
  const _SyncNowSyncEvent._() : super._();
}

/// @nodoc
abstract class _$$SyncLastDaySyncEventImplCopyWith<$Res> {
  factory _$$SyncLastDaySyncEventImplCopyWith(_$SyncLastDaySyncEventImpl value,
          $Res Function(_$SyncLastDaySyncEventImpl) then) =
      __$$SyncLastDaySyncEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncLastDaySyncEventImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$SyncLastDaySyncEventImpl>
    implements _$$SyncLastDaySyncEventImplCopyWith<$Res> {
  __$$SyncLastDaySyncEventImplCopyWithImpl(_$SyncLastDaySyncEventImpl _value,
      $Res Function(_$SyncLastDaySyncEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncLastDaySyncEventImpl extends _SyncLastDaySyncEvent {
  const _$SyncLastDaySyncEventImpl() : super._();

  @override
  String toString() {
    return 'SyncEvent.syncLastDay()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncLastDaySyncEventImpl);
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
  const factory _SyncLastDaySyncEvent() = _$SyncLastDaySyncEventImpl;
  const _SyncLastDaySyncEvent._() : super._();
}

/// @nodoc
abstract class _$$SyncLastMonthSyncEventImplCopyWith<$Res> {
  factory _$$SyncLastMonthSyncEventImplCopyWith(
          _$SyncLastMonthSyncEventImpl value,
          $Res Function(_$SyncLastMonthSyncEventImpl) then) =
      __$$SyncLastMonthSyncEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncLastMonthSyncEventImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$SyncLastMonthSyncEventImpl>
    implements _$$SyncLastMonthSyncEventImplCopyWith<$Res> {
  __$$SyncLastMonthSyncEventImplCopyWithImpl(
      _$SyncLastMonthSyncEventImpl _value,
      $Res Function(_$SyncLastMonthSyncEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncLastMonthSyncEventImpl extends _SyncLastMonthSyncEvent {
  const _$SyncLastMonthSyncEventImpl() : super._();

  @override
  String toString() {
    return 'SyncEvent.syncLastMonth()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncLastMonthSyncEventImpl);
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
  const factory _SyncLastMonthSyncEvent() = _$SyncLastMonthSyncEventImpl;
  const _SyncLastMonthSyncEvent._() : super._();
}

/// @nodoc
abstract class _$$SyncAllSyncEventImplCopyWith<$Res> {
  factory _$$SyncAllSyncEventImplCopyWith(_$SyncAllSyncEventImpl value,
          $Res Function(_$SyncAllSyncEventImpl) then) =
      __$$SyncAllSyncEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncAllSyncEventImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$SyncAllSyncEventImpl>
    implements _$$SyncAllSyncEventImplCopyWith<$Res> {
  __$$SyncAllSyncEventImplCopyWithImpl(_$SyncAllSyncEventImpl _value,
      $Res Function(_$SyncAllSyncEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncAllSyncEventImpl extends _SyncAllSyncEvent {
  const _$SyncAllSyncEventImpl() : super._();

  @override
  String toString() {
    return 'SyncEvent.syncAll()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncAllSyncEventImpl);
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
  const factory _SyncAllSyncEvent() = _$SyncAllSyncEventImpl;
  const _SyncAllSyncEvent._() : super._();
}

/// @nodoc
abstract class _$$AddUserSyncEventImplCopyWith<$Res> {
  factory _$$AddUserSyncEventImplCopyWith(_$AddUserSyncEventImpl value,
          $Res Function(_$AddUserSyncEventImpl) then) =
      __$$AddUserSyncEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AddUserSyncEventImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$AddUserSyncEventImpl>
    implements _$$AddUserSyncEventImplCopyWith<$Res> {
  __$$AddUserSyncEventImplCopyWithImpl(_$AddUserSyncEventImpl _value,
      $Res Function(_$AddUserSyncEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AddUserSyncEventImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AddUserSyncEventImpl extends _AddUserSyncEvent {
  const _$AddUserSyncEventImpl({required this.user}) : super._();

  @override
  final User user;

  @override
  String toString() {
    return 'SyncEvent.addUser(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddUserSyncEventImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddUserSyncEventImplCopyWith<_$AddUserSyncEventImpl> get copyWith =>
      __$$AddUserSyncEventImplCopyWithImpl<_$AddUserSyncEventImpl>(
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
      _$AddUserSyncEventImpl;
  const _AddUserSyncEvent._() : super._();

  User get user;
  @JsonKey(ignore: true)
  _$$AddUserSyncEventImplCopyWith<_$AddUserSyncEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthProgressSyncEventImplCopyWith<$Res> {
  factory _$$AuthProgressSyncEventImplCopyWith(
          _$AuthProgressSyncEventImpl value,
          $Res Function(_$AuthProgressSyncEventImpl) then) =
      __$$AuthProgressSyncEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthProgressSyncEventImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$AuthProgressSyncEventImpl>
    implements _$$AuthProgressSyncEventImplCopyWith<$Res> {
  __$$AuthProgressSyncEventImplCopyWithImpl(_$AuthProgressSyncEventImpl _value,
      $Res Function(_$AuthProgressSyncEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthProgressSyncEventImpl extends _AuthProgressSyncEvent {
  const _$AuthProgressSyncEventImpl() : super._();

  @override
  String toString() {
    return 'SyncEvent.authProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthProgressSyncEventImpl);
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
  const factory _AuthProgressSyncEvent() = _$AuthProgressSyncEventImpl;
  const _AuthProgressSyncEvent._() : super._();
}

/// @nodoc
abstract class _$$AuthAuthenticatedSyncEventImplCopyWith<$Res> {
  factory _$$AuthAuthenticatedSyncEventImplCopyWith(
          _$AuthAuthenticatedSyncEventImpl value,
          $Res Function(_$AuthAuthenticatedSyncEventImpl) then) =
      __$$AuthAuthenticatedSyncEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthAuthenticatedSyncEventImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$AuthAuthenticatedSyncEventImpl>
    implements _$$AuthAuthenticatedSyncEventImplCopyWith<$Res> {
  __$$AuthAuthenticatedSyncEventImplCopyWithImpl(
      _$AuthAuthenticatedSyncEventImpl _value,
      $Res Function(_$AuthAuthenticatedSyncEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthAuthenticatedSyncEventImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthAuthenticatedSyncEventImpl extends _AuthAuthenticatedSyncEvent {
  const _$AuthAuthenticatedSyncEventImpl({required this.user}) : super._();

  @override
  final User user;

  @override
  String toString() {
    return 'SyncEvent.authAuthenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthAuthenticatedSyncEventImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthAuthenticatedSyncEventImplCopyWith<_$AuthAuthenticatedSyncEventImpl>
      get copyWith => __$$AuthAuthenticatedSyncEventImplCopyWithImpl<
          _$AuthAuthenticatedSyncEventImpl>(this, _$identity);

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
      _$AuthAuthenticatedSyncEventImpl;
  const _AuthAuthenticatedSyncEvent._() : super._();

  User get user;
  @JsonKey(ignore: true)
  _$$AuthAuthenticatedSyncEventImplCopyWith<_$AuthAuthenticatedSyncEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotAuthSyncEventImplCopyWith<$Res> {
  factory _$$NotAuthSyncEventImplCopyWith(_$NotAuthSyncEventImpl value,
          $Res Function(_$NotAuthSyncEventImpl) then) =
      __$$NotAuthSyncEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotAuthSyncEventImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$NotAuthSyncEventImpl>
    implements _$$NotAuthSyncEventImplCopyWith<$Res> {
  __$$NotAuthSyncEventImplCopyWithImpl(_$NotAuthSyncEventImpl _value,
      $Res Function(_$NotAuthSyncEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotAuthSyncEventImpl extends _NotAuthSyncEvent {
  const _$NotAuthSyncEventImpl() : super._();

  @override
  String toString() {
    return 'SyncEvent.notAuth()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotAuthSyncEventImpl);
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
  const factory _NotAuthSyncEvent() = _$NotAuthSyncEventImpl;
  const _NotAuthSyncEvent._() : super._();
}

/// @nodoc
abstract class _$$SyncDataSyncEventImplCopyWith<$Res> {
  factory _$$SyncDataSyncEventImplCopyWith(_$SyncDataSyncEventImpl value,
          $Res Function(_$SyncDataSyncEventImpl) then) =
      __$$SyncDataSyncEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime syncDate});
}

/// @nodoc
class __$$SyncDataSyncEventImplCopyWithImpl<$Res>
    extends _$SyncEventCopyWithImpl<$Res, _$SyncDataSyncEventImpl>
    implements _$$SyncDataSyncEventImplCopyWith<$Res> {
  __$$SyncDataSyncEventImplCopyWithImpl(_$SyncDataSyncEventImpl _value,
      $Res Function(_$SyncDataSyncEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syncDate = null,
  }) {
    return _then(_$SyncDataSyncEventImpl(
      syncDate: null == syncDate
          ? _value.syncDate
          : syncDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SyncDataSyncEventImpl extends _SyncDataSyncEvent {
  const _$SyncDataSyncEventImpl({required this.syncDate}) : super._();

  @override
  final DateTime syncDate;

  @override
  String toString() {
    return 'SyncEvent.syncData(syncDate: $syncDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncDataSyncEventImpl &&
            (identical(other.syncDate, syncDate) ||
                other.syncDate == syncDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, syncDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncDataSyncEventImplCopyWith<_$SyncDataSyncEventImpl> get copyWith =>
      __$$SyncDataSyncEventImplCopyWithImpl<_$SyncDataSyncEventImpl>(
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
      _$SyncDataSyncEventImpl;
  const _SyncDataSyncEvent._() : super._();

  DateTime get syncDate;
  @JsonKey(ignore: true)
  _$$SyncDataSyncEventImplCopyWith<_$SyncDataSyncEventImpl> get copyWith =>
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
    required TResult Function(String message) notSynced,
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
    TResult? Function(String message)? notSynced,
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
    TResult Function(String message)? notSynced,
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
abstract class _$$InProgressSyncStateImplCopyWith<$Res> {
  factory _$$InProgressSyncStateImplCopyWith(_$InProgressSyncStateImpl value,
          $Res Function(_$InProgressSyncStateImpl) then) =
      __$$InProgressSyncStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InProgressSyncStateImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$InProgressSyncStateImpl>
    implements _$$InProgressSyncStateImplCopyWith<$Res> {
  __$$InProgressSyncStateImplCopyWithImpl(_$InProgressSyncStateImpl _value,
      $Res Function(_$InProgressSyncStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InProgressSyncStateImpl extends _InProgressSyncState {
  const _$InProgressSyncStateImpl() : super._();

  @override
  String toString() {
    return 'SyncState.inProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InProgressSyncStateImpl);
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
    required TResult Function(String message) notSynced,
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
    TResult? Function(String message)? notSynced,
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
    TResult Function(String message)? notSynced,
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
  const factory _InProgressSyncState() = _$InProgressSyncStateImpl;
  const _InProgressSyncState._() : super._();
}

/// @nodoc
abstract class _$$LoadingToCloudSyncStateImplCopyWith<$Res> {
  factory _$$LoadingToCloudSyncStateImplCopyWith(
          _$LoadingToCloudSyncStateImpl value,
          $Res Function(_$LoadingToCloudSyncStateImpl) then) =
      __$$LoadingToCloudSyncStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int accountCount, int categoryCount, int operationCount});
}

/// @nodoc
class __$$LoadingToCloudSyncStateImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$LoadingToCloudSyncStateImpl>
    implements _$$LoadingToCloudSyncStateImplCopyWith<$Res> {
  __$$LoadingToCloudSyncStateImplCopyWithImpl(
      _$LoadingToCloudSyncStateImpl _value,
      $Res Function(_$LoadingToCloudSyncStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountCount = null,
    Object? categoryCount = null,
    Object? operationCount = null,
  }) {
    return _then(_$LoadingToCloudSyncStateImpl(
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

class _$LoadingToCloudSyncStateImpl extends _LoadingToCloudSyncState {
  const _$LoadingToCloudSyncStateImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingToCloudSyncStateImpl &&
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
  _$$LoadingToCloudSyncStateImplCopyWith<_$LoadingToCloudSyncStateImpl>
      get copyWith => __$$LoadingToCloudSyncStateImplCopyWithImpl<
          _$LoadingToCloudSyncStateImpl>(this, _$identity);

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
    required TResult Function(String message) notSynced,
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
    TResult? Function(String message)? notSynced,
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
    TResult Function(String message)? notSynced,
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
      required final int operationCount}) = _$LoadingToCloudSyncStateImpl;
  const _LoadingToCloudSyncState._() : super._();

  int get accountCount;
  int get categoryCount;
  int get operationCount;
  @JsonKey(ignore: true)
  _$$LoadingToCloudSyncStateImplCopyWith<_$LoadingToCloudSyncStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingFromCloudSyncStateImplCopyWith<$Res> {
  factory _$$LoadingFromCloudSyncStateImplCopyWith(
          _$LoadingFromCloudSyncStateImpl value,
          $Res Function(_$LoadingFromCloudSyncStateImpl) then) =
      __$$LoadingFromCloudSyncStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int accountCount, int categoryCount, int operationCount});
}

/// @nodoc
class __$$LoadingFromCloudSyncStateImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$LoadingFromCloudSyncStateImpl>
    implements _$$LoadingFromCloudSyncStateImplCopyWith<$Res> {
  __$$LoadingFromCloudSyncStateImplCopyWithImpl(
      _$LoadingFromCloudSyncStateImpl _value,
      $Res Function(_$LoadingFromCloudSyncStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountCount = null,
    Object? categoryCount = null,
    Object? operationCount = null,
  }) {
    return _then(_$LoadingFromCloudSyncStateImpl(
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

class _$LoadingFromCloudSyncStateImpl extends _LoadingFromCloudSyncState {
  const _$LoadingFromCloudSyncStateImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingFromCloudSyncStateImpl &&
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
  _$$LoadingFromCloudSyncStateImplCopyWith<_$LoadingFromCloudSyncStateImpl>
      get copyWith => __$$LoadingFromCloudSyncStateImplCopyWithImpl<
          _$LoadingFromCloudSyncStateImpl>(this, _$identity);

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
    required TResult Function(String message) notSynced,
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
    TResult? Function(String message)? notSynced,
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
    TResult Function(String message)? notSynced,
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
      required final int operationCount}) = _$LoadingFromCloudSyncStateImpl;
  const _LoadingFromCloudSyncState._() : super._();

  int get accountCount;
  int get categoryCount;
  int get operationCount;
  @JsonKey(ignore: true)
  _$$LoadingFromCloudSyncStateImplCopyWith<_$LoadingFromCloudSyncStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncedSyncStateImplCopyWith<$Res> {
  factory _$$SyncedSyncStateImplCopyWith(_$SyncedSyncStateImpl value,
          $Res Function(_$SyncedSyncStateImpl) then) =
      __$$SyncedSyncStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime syncDate, bool isAdmin});
}

/// @nodoc
class __$$SyncedSyncStateImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$SyncedSyncStateImpl>
    implements _$$SyncedSyncStateImplCopyWith<$Res> {
  __$$SyncedSyncStateImplCopyWithImpl(
      _$SyncedSyncStateImpl _value, $Res Function(_$SyncedSyncStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? syncDate = null,
    Object? isAdmin = null,
  }) {
    return _then(_$SyncedSyncStateImpl(
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

class _$SyncedSyncStateImpl extends _SyncedSyncState {
  const _$SyncedSyncStateImpl({required this.syncDate, required this.isAdmin})
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncedSyncStateImpl &&
            (identical(other.syncDate, syncDate) ||
                other.syncDate == syncDate) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, syncDate, isAdmin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncedSyncStateImplCopyWith<_$SyncedSyncStateImpl> get copyWith =>
      __$$SyncedSyncStateImplCopyWithImpl<_$SyncedSyncStateImpl>(
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
    required TResult Function(String message) notSynced,
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
    TResult? Function(String message)? notSynced,
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
    TResult Function(String message)? notSynced,
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
      required final bool isAdmin}) = _$SyncedSyncStateImpl;
  const _SyncedSyncState._() : super._();

  DateTime get syncDate;
  bool get isAdmin;
  @JsonKey(ignore: true)
  _$$SyncedSyncStateImplCopyWith<_$SyncedSyncStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotSyncedSyncStateImplCopyWith<$Res> {
  factory _$$NotSyncedSyncStateImplCopyWith(_$NotSyncedSyncStateImpl value,
          $Res Function(_$NotSyncedSyncStateImpl) then) =
      __$$NotSyncedSyncStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotSyncedSyncStateImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$NotSyncedSyncStateImpl>
    implements _$$NotSyncedSyncStateImplCopyWith<$Res> {
  __$$NotSyncedSyncStateImplCopyWithImpl(_$NotSyncedSyncStateImpl _value,
      $Res Function(_$NotSyncedSyncStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotSyncedSyncStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotSyncedSyncStateImpl extends _NotSyncedSyncState {
  const _$NotSyncedSyncStateImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'SyncState.notSynced(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotSyncedSyncStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotSyncedSyncStateImplCopyWith<_$NotSyncedSyncStateImpl> get copyWith =>
      __$$NotSyncedSyncStateImplCopyWithImpl<_$NotSyncedSyncStateImpl>(
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
    required TResult Function(String message) notSynced,
    required TResult Function() failure,
    required TResult Function() noDB,
  }) {
    return notSynced(message);
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
    TResult? Function(String message)? notSynced,
    TResult? Function()? failure,
    TResult? Function()? noDB,
  }) {
    return notSynced?.call(message);
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
    TResult Function(String message)? notSynced,
    TResult Function()? failure,
    TResult Function()? noDB,
    required TResult orElse(),
  }) {
    if (notSynced != null) {
      return notSynced(message);
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
  const factory _NotSyncedSyncState({required final String message}) =
      _$NotSyncedSyncStateImpl;
  const _NotSyncedSyncState._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$NotSyncedSyncStateImplCopyWith<_$NotSyncedSyncStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureSyncStateImplCopyWith<$Res> {
  factory _$$FailureSyncStateImplCopyWith(_$FailureSyncStateImpl value,
          $Res Function(_$FailureSyncStateImpl) then) =
      __$$FailureSyncStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailureSyncStateImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$FailureSyncStateImpl>
    implements _$$FailureSyncStateImplCopyWith<$Res> {
  __$$FailureSyncStateImplCopyWithImpl(_$FailureSyncStateImpl _value,
      $Res Function(_$FailureSyncStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FailureSyncStateImpl extends _FailureSyncState {
  const _$FailureSyncStateImpl() : super._();

  @override
  String toString() {
    return 'SyncState.failure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailureSyncStateImpl);
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
    required TResult Function(String message) notSynced,
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
    TResult? Function(String message)? notSynced,
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
    TResult Function(String message)? notSynced,
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
  const factory _FailureSyncState() = _$FailureSyncStateImpl;
  const _FailureSyncState._() : super._();
}

/// @nodoc
abstract class _$$NoDBSyncStateImplCopyWith<$Res> {
  factory _$$NoDBSyncStateImplCopyWith(
          _$NoDBSyncStateImpl value, $Res Function(_$NoDBSyncStateImpl) then) =
      __$$NoDBSyncStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoDBSyncStateImplCopyWithImpl<$Res>
    extends _$SyncStateCopyWithImpl<$Res, _$NoDBSyncStateImpl>
    implements _$$NoDBSyncStateImplCopyWith<$Res> {
  __$$NoDBSyncStateImplCopyWithImpl(
      _$NoDBSyncStateImpl _value, $Res Function(_$NoDBSyncStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoDBSyncStateImpl extends _NoDBSyncState {
  const _$NoDBSyncStateImpl() : super._();

  @override
  String toString() {
    return 'SyncState.noDB()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoDBSyncStateImpl);
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
    required TResult Function(String message) notSynced,
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
    TResult? Function(String message)? notSynced,
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
    TResult Function(String message)? notSynced,
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
  const factory _NoDBSyncState() = _$NoDBSyncStateImpl;
  const _NoDBSyncState._() : super._();
}
