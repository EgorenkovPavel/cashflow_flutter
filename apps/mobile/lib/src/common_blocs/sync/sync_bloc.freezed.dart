// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SyncEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent()';
}


}

/// @nodoc
class $SyncEventCopyWith<$Res>  {
$SyncEventCopyWith(SyncEvent _, $Res Function(SyncEvent) __);
}


/// Adds pattern-matching-related methods to [SyncEvent].
extension SyncEventPatterns on SyncEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreateCloudDatabaseSyncEvent value)?  createCloudDatabase,TResult Function( _RefreshConnectionSyncEvent value)?  refreshConnection,TResult Function( _SyncNowSyncEvent value)?  syncNow,TResult Function( _SyncLastDaySyncEvent value)?  syncLastDay,TResult Function( _SyncLastMonthSyncEvent value)?  syncLastMonth,TResult Function( _SyncAllSyncEvent value)?  syncAll,TResult Function( _AddUserSyncEvent value)?  addUser,TResult Function( _AuthProgressSyncEvent value)?  authProgress,TResult Function( _AuthAuthenticatedSyncEvent value)?  authAuthenticated,TResult Function( _NotAuthSyncEvent value)?  notAuth,TResult Function( _SyncDataSyncEvent value)?  syncData,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCloudDatabaseSyncEvent() when createCloudDatabase != null:
return createCloudDatabase(_that);case _RefreshConnectionSyncEvent() when refreshConnection != null:
return refreshConnection(_that);case _SyncNowSyncEvent() when syncNow != null:
return syncNow(_that);case _SyncLastDaySyncEvent() when syncLastDay != null:
return syncLastDay(_that);case _SyncLastMonthSyncEvent() when syncLastMonth != null:
return syncLastMonth(_that);case _SyncAllSyncEvent() when syncAll != null:
return syncAll(_that);case _AddUserSyncEvent() when addUser != null:
return addUser(_that);case _AuthProgressSyncEvent() when authProgress != null:
return authProgress(_that);case _AuthAuthenticatedSyncEvent() when authAuthenticated != null:
return authAuthenticated(_that);case _NotAuthSyncEvent() when notAuth != null:
return notAuth(_that);case _SyncDataSyncEvent() when syncData != null:
return syncData(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreateCloudDatabaseSyncEvent value)  createCloudDatabase,required TResult Function( _RefreshConnectionSyncEvent value)  refreshConnection,required TResult Function( _SyncNowSyncEvent value)  syncNow,required TResult Function( _SyncLastDaySyncEvent value)  syncLastDay,required TResult Function( _SyncLastMonthSyncEvent value)  syncLastMonth,required TResult Function( _SyncAllSyncEvent value)  syncAll,required TResult Function( _AddUserSyncEvent value)  addUser,required TResult Function( _AuthProgressSyncEvent value)  authProgress,required TResult Function( _AuthAuthenticatedSyncEvent value)  authAuthenticated,required TResult Function( _NotAuthSyncEvent value)  notAuth,required TResult Function( _SyncDataSyncEvent value)  syncData,}){
final _that = this;
switch (_that) {
case _CreateCloudDatabaseSyncEvent():
return createCloudDatabase(_that);case _RefreshConnectionSyncEvent():
return refreshConnection(_that);case _SyncNowSyncEvent():
return syncNow(_that);case _SyncLastDaySyncEvent():
return syncLastDay(_that);case _SyncLastMonthSyncEvent():
return syncLastMonth(_that);case _SyncAllSyncEvent():
return syncAll(_that);case _AddUserSyncEvent():
return addUser(_that);case _AuthProgressSyncEvent():
return authProgress(_that);case _AuthAuthenticatedSyncEvent():
return authAuthenticated(_that);case _NotAuthSyncEvent():
return notAuth(_that);case _SyncDataSyncEvent():
return syncData(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreateCloudDatabaseSyncEvent value)?  createCloudDatabase,TResult? Function( _RefreshConnectionSyncEvent value)?  refreshConnection,TResult? Function( _SyncNowSyncEvent value)?  syncNow,TResult? Function( _SyncLastDaySyncEvent value)?  syncLastDay,TResult? Function( _SyncLastMonthSyncEvent value)?  syncLastMonth,TResult? Function( _SyncAllSyncEvent value)?  syncAll,TResult? Function( _AddUserSyncEvent value)?  addUser,TResult? Function( _AuthProgressSyncEvent value)?  authProgress,TResult? Function( _AuthAuthenticatedSyncEvent value)?  authAuthenticated,TResult? Function( _NotAuthSyncEvent value)?  notAuth,TResult? Function( _SyncDataSyncEvent value)?  syncData,}){
final _that = this;
switch (_that) {
case _CreateCloudDatabaseSyncEvent() when createCloudDatabase != null:
return createCloudDatabase(_that);case _RefreshConnectionSyncEvent() when refreshConnection != null:
return refreshConnection(_that);case _SyncNowSyncEvent() when syncNow != null:
return syncNow(_that);case _SyncLastDaySyncEvent() when syncLastDay != null:
return syncLastDay(_that);case _SyncLastMonthSyncEvent() when syncLastMonth != null:
return syncLastMonth(_that);case _SyncAllSyncEvent() when syncAll != null:
return syncAll(_that);case _AddUserSyncEvent() when addUser != null:
return addUser(_that);case _AuthProgressSyncEvent() when authProgress != null:
return authProgress(_that);case _AuthAuthenticatedSyncEvent() when authAuthenticated != null:
return authAuthenticated(_that);case _NotAuthSyncEvent() when notAuth != null:
return notAuth(_that);case _SyncDataSyncEvent() when syncData != null:
return syncData(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  createCloudDatabase,TResult Function()?  refreshConnection,TResult Function()?  syncNow,TResult Function()?  syncLastDay,TResult Function()?  syncLastMonth,TResult Function()?  syncAll,TResult Function( User user)?  addUser,TResult Function()?  authProgress,TResult Function( User user)?  authAuthenticated,TResult Function()?  notAuth,TResult Function( DateTime syncDate)?  syncData,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCloudDatabaseSyncEvent() when createCloudDatabase != null:
return createCloudDatabase();case _RefreshConnectionSyncEvent() when refreshConnection != null:
return refreshConnection();case _SyncNowSyncEvent() when syncNow != null:
return syncNow();case _SyncLastDaySyncEvent() when syncLastDay != null:
return syncLastDay();case _SyncLastMonthSyncEvent() when syncLastMonth != null:
return syncLastMonth();case _SyncAllSyncEvent() when syncAll != null:
return syncAll();case _AddUserSyncEvent() when addUser != null:
return addUser(_that.user);case _AuthProgressSyncEvent() when authProgress != null:
return authProgress();case _AuthAuthenticatedSyncEvent() when authAuthenticated != null:
return authAuthenticated(_that.user);case _NotAuthSyncEvent() when notAuth != null:
return notAuth();case _SyncDataSyncEvent() when syncData != null:
return syncData(_that.syncDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  createCloudDatabase,required TResult Function()  refreshConnection,required TResult Function()  syncNow,required TResult Function()  syncLastDay,required TResult Function()  syncLastMonth,required TResult Function()  syncAll,required TResult Function( User user)  addUser,required TResult Function()  authProgress,required TResult Function( User user)  authAuthenticated,required TResult Function()  notAuth,required TResult Function( DateTime syncDate)  syncData,}) {final _that = this;
switch (_that) {
case _CreateCloudDatabaseSyncEvent():
return createCloudDatabase();case _RefreshConnectionSyncEvent():
return refreshConnection();case _SyncNowSyncEvent():
return syncNow();case _SyncLastDaySyncEvent():
return syncLastDay();case _SyncLastMonthSyncEvent():
return syncLastMonth();case _SyncAllSyncEvent():
return syncAll();case _AddUserSyncEvent():
return addUser(_that.user);case _AuthProgressSyncEvent():
return authProgress();case _AuthAuthenticatedSyncEvent():
return authAuthenticated(_that.user);case _NotAuthSyncEvent():
return notAuth();case _SyncDataSyncEvent():
return syncData(_that.syncDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  createCloudDatabase,TResult? Function()?  refreshConnection,TResult? Function()?  syncNow,TResult? Function()?  syncLastDay,TResult? Function()?  syncLastMonth,TResult? Function()?  syncAll,TResult? Function( User user)?  addUser,TResult? Function()?  authProgress,TResult? Function( User user)?  authAuthenticated,TResult? Function()?  notAuth,TResult? Function( DateTime syncDate)?  syncData,}) {final _that = this;
switch (_that) {
case _CreateCloudDatabaseSyncEvent() when createCloudDatabase != null:
return createCloudDatabase();case _RefreshConnectionSyncEvent() when refreshConnection != null:
return refreshConnection();case _SyncNowSyncEvent() when syncNow != null:
return syncNow();case _SyncLastDaySyncEvent() when syncLastDay != null:
return syncLastDay();case _SyncLastMonthSyncEvent() when syncLastMonth != null:
return syncLastMonth();case _SyncAllSyncEvent() when syncAll != null:
return syncAll();case _AddUserSyncEvent() when addUser != null:
return addUser(_that.user);case _AuthProgressSyncEvent() when authProgress != null:
return authProgress();case _AuthAuthenticatedSyncEvent() when authAuthenticated != null:
return authAuthenticated(_that.user);case _NotAuthSyncEvent() when notAuth != null:
return notAuth();case _SyncDataSyncEvent() when syncData != null:
return syncData(_that.syncDate);case _:
  return null;

}
}

}

/// @nodoc


class _CreateCloudDatabaseSyncEvent extends SyncEvent {
  const _CreateCloudDatabaseSyncEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCloudDatabaseSyncEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent.createCloudDatabase()';
}


}




/// @nodoc


class _RefreshConnectionSyncEvent extends SyncEvent {
  const _RefreshConnectionSyncEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshConnectionSyncEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent.refreshConnection()';
}


}




/// @nodoc


class _SyncNowSyncEvent extends SyncEvent {
  const _SyncNowSyncEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncNowSyncEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent.syncNow()';
}


}




/// @nodoc


class _SyncLastDaySyncEvent extends SyncEvent {
  const _SyncLastDaySyncEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncLastDaySyncEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent.syncLastDay()';
}


}




/// @nodoc


class _SyncLastMonthSyncEvent extends SyncEvent {
  const _SyncLastMonthSyncEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncLastMonthSyncEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent.syncLastMonth()';
}


}




/// @nodoc


class _SyncAllSyncEvent extends SyncEvent {
  const _SyncAllSyncEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncAllSyncEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent.syncAll()';
}


}




/// @nodoc


class _AddUserSyncEvent extends SyncEvent {
  const _AddUserSyncEvent({required this.user}): super._();
  

 final  User user;

/// Create a copy of SyncEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddUserSyncEventCopyWith<_AddUserSyncEvent> get copyWith => __$AddUserSyncEventCopyWithImpl<_AddUserSyncEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddUserSyncEvent&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'SyncEvent.addUser(user: $user)';
}


}

/// @nodoc
abstract mixin class _$AddUserSyncEventCopyWith<$Res> implements $SyncEventCopyWith<$Res> {
  factory _$AddUserSyncEventCopyWith(_AddUserSyncEvent value, $Res Function(_AddUserSyncEvent) _then) = __$AddUserSyncEventCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$AddUserSyncEventCopyWithImpl<$Res>
    implements _$AddUserSyncEventCopyWith<$Res> {
  __$AddUserSyncEventCopyWithImpl(this._self, this._then);

  final _AddUserSyncEvent _self;
  final $Res Function(_AddUserSyncEvent) _then;

/// Create a copy of SyncEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_AddUserSyncEvent(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of SyncEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _AuthProgressSyncEvent extends SyncEvent {
  const _AuthProgressSyncEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthProgressSyncEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent.authProgress()';
}


}




/// @nodoc


class _AuthAuthenticatedSyncEvent extends SyncEvent {
  const _AuthAuthenticatedSyncEvent({required this.user}): super._();
  

 final  User user;

/// Create a copy of SyncEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthAuthenticatedSyncEventCopyWith<_AuthAuthenticatedSyncEvent> get copyWith => __$AuthAuthenticatedSyncEventCopyWithImpl<_AuthAuthenticatedSyncEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthAuthenticatedSyncEvent&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'SyncEvent.authAuthenticated(user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthAuthenticatedSyncEventCopyWith<$Res> implements $SyncEventCopyWith<$Res> {
  factory _$AuthAuthenticatedSyncEventCopyWith(_AuthAuthenticatedSyncEvent value, $Res Function(_AuthAuthenticatedSyncEvent) _then) = __$AuthAuthenticatedSyncEventCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$AuthAuthenticatedSyncEventCopyWithImpl<$Res>
    implements _$AuthAuthenticatedSyncEventCopyWith<$Res> {
  __$AuthAuthenticatedSyncEventCopyWithImpl(this._self, this._then);

  final _AuthAuthenticatedSyncEvent _self;
  final $Res Function(_AuthAuthenticatedSyncEvent) _then;

/// Create a copy of SyncEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_AuthAuthenticatedSyncEvent(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of SyncEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _NotAuthSyncEvent extends SyncEvent {
  const _NotAuthSyncEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotAuthSyncEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent.notAuth()';
}


}




/// @nodoc


class _SyncDataSyncEvent extends SyncEvent {
  const _SyncDataSyncEvent({required this.syncDate}): super._();
  

 final  DateTime syncDate;

/// Create a copy of SyncEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncDataSyncEventCopyWith<_SyncDataSyncEvent> get copyWith => __$SyncDataSyncEventCopyWithImpl<_SyncDataSyncEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncDataSyncEvent&&(identical(other.syncDate, syncDate) || other.syncDate == syncDate));
}


@override
int get hashCode => Object.hash(runtimeType,syncDate);

@override
String toString() {
  return 'SyncEvent.syncData(syncDate: $syncDate)';
}


}

/// @nodoc
abstract mixin class _$SyncDataSyncEventCopyWith<$Res> implements $SyncEventCopyWith<$Res> {
  factory _$SyncDataSyncEventCopyWith(_SyncDataSyncEvent value, $Res Function(_SyncDataSyncEvent) _then) = __$SyncDataSyncEventCopyWithImpl;
@useResult
$Res call({
 DateTime syncDate
});




}
/// @nodoc
class __$SyncDataSyncEventCopyWithImpl<$Res>
    implements _$SyncDataSyncEventCopyWith<$Res> {
  __$SyncDataSyncEventCopyWithImpl(this._self, this._then);

  final _SyncDataSyncEvent _self;
  final $Res Function(_SyncDataSyncEvent) _then;

/// Create a copy of SyncEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? syncDate = null,}) {
  return _then(_SyncDataSyncEvent(
syncDate: null == syncDate ? _self.syncDate : syncDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$SyncState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncState()';
}


}

/// @nodoc
class $SyncStateCopyWith<$Res>  {
$SyncStateCopyWith(SyncState _, $Res Function(SyncState) __);
}


/// Adds pattern-matching-related methods to [SyncState].
extension SyncStatePatterns on SyncState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NoDBSyncState value)?  noDB,TResult Function( _NotSyncedSyncState value)?  notSynced,TResult Function( _LoadingToCloudSyncState value)?  loadingToCloud,TResult Function( _LoadingFromCloudSyncState value)?  loadingFromCloud,TResult Function( _SyncedSyncState value)?  synced,TResult Function( _FailureSyncState value)?  failure,TResult Function( _InProgressSyncState value)?  inProgress,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoDBSyncState() when noDB != null:
return noDB(_that);case _NotSyncedSyncState() when notSynced != null:
return notSynced(_that);case _LoadingToCloudSyncState() when loadingToCloud != null:
return loadingToCloud(_that);case _LoadingFromCloudSyncState() when loadingFromCloud != null:
return loadingFromCloud(_that);case _SyncedSyncState() when synced != null:
return synced(_that);case _FailureSyncState() when failure != null:
return failure(_that);case _InProgressSyncState() when inProgress != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NoDBSyncState value)  noDB,required TResult Function( _NotSyncedSyncState value)  notSynced,required TResult Function( _LoadingToCloudSyncState value)  loadingToCloud,required TResult Function( _LoadingFromCloudSyncState value)  loadingFromCloud,required TResult Function( _SyncedSyncState value)  synced,required TResult Function( _FailureSyncState value)  failure,required TResult Function( _InProgressSyncState value)  inProgress,}){
final _that = this;
switch (_that) {
case _NoDBSyncState():
return noDB(_that);case _NotSyncedSyncState():
return notSynced(_that);case _LoadingToCloudSyncState():
return loadingToCloud(_that);case _LoadingFromCloudSyncState():
return loadingFromCloud(_that);case _SyncedSyncState():
return synced(_that);case _FailureSyncState():
return failure(_that);case _InProgressSyncState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NoDBSyncState value)?  noDB,TResult? Function( _NotSyncedSyncState value)?  notSynced,TResult? Function( _LoadingToCloudSyncState value)?  loadingToCloud,TResult? Function( _LoadingFromCloudSyncState value)?  loadingFromCloud,TResult? Function( _SyncedSyncState value)?  synced,TResult? Function( _FailureSyncState value)?  failure,TResult? Function( _InProgressSyncState value)?  inProgress,}){
final _that = this;
switch (_that) {
case _NoDBSyncState() when noDB != null:
return noDB(_that);case _NotSyncedSyncState() when notSynced != null:
return notSynced(_that);case _LoadingToCloudSyncState() when loadingToCloud != null:
return loadingToCloud(_that);case _LoadingFromCloudSyncState() when loadingFromCloud != null:
return loadingFromCloud(_that);case _SyncedSyncState() when synced != null:
return synced(_that);case _FailureSyncState() when failure != null:
return failure(_that);case _InProgressSyncState() when inProgress != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  noDB,TResult Function( String message)?  notSynced,TResult Function( int accountCount,  int categoryCount,  int operationCount)?  loadingToCloud,TResult Function( int accountCount,  int categoryCount,  int operationCount)?  loadingFromCloud,TResult Function( DateTime syncDate,  bool isAdmin)?  synced,TResult Function()?  failure,TResult Function()?  inProgress,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoDBSyncState() when noDB != null:
return noDB();case _NotSyncedSyncState() when notSynced != null:
return notSynced(_that.message);case _LoadingToCloudSyncState() when loadingToCloud != null:
return loadingToCloud(_that.accountCount,_that.categoryCount,_that.operationCount);case _LoadingFromCloudSyncState() when loadingFromCloud != null:
return loadingFromCloud(_that.accountCount,_that.categoryCount,_that.operationCount);case _SyncedSyncState() when synced != null:
return synced(_that.syncDate,_that.isAdmin);case _FailureSyncState() when failure != null:
return failure();case _InProgressSyncState() when inProgress != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  noDB,required TResult Function( String message)  notSynced,required TResult Function( int accountCount,  int categoryCount,  int operationCount)  loadingToCloud,required TResult Function( int accountCount,  int categoryCount,  int operationCount)  loadingFromCloud,required TResult Function( DateTime syncDate,  bool isAdmin)  synced,required TResult Function()  failure,required TResult Function()  inProgress,}) {final _that = this;
switch (_that) {
case _NoDBSyncState():
return noDB();case _NotSyncedSyncState():
return notSynced(_that.message);case _LoadingToCloudSyncState():
return loadingToCloud(_that.accountCount,_that.categoryCount,_that.operationCount);case _LoadingFromCloudSyncState():
return loadingFromCloud(_that.accountCount,_that.categoryCount,_that.operationCount);case _SyncedSyncState():
return synced(_that.syncDate,_that.isAdmin);case _FailureSyncState():
return failure();case _InProgressSyncState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  noDB,TResult? Function( String message)?  notSynced,TResult? Function( int accountCount,  int categoryCount,  int operationCount)?  loadingToCloud,TResult? Function( int accountCount,  int categoryCount,  int operationCount)?  loadingFromCloud,TResult? Function( DateTime syncDate,  bool isAdmin)?  synced,TResult? Function()?  failure,TResult? Function()?  inProgress,}) {final _that = this;
switch (_that) {
case _NoDBSyncState() when noDB != null:
return noDB();case _NotSyncedSyncState() when notSynced != null:
return notSynced(_that.message);case _LoadingToCloudSyncState() when loadingToCloud != null:
return loadingToCloud(_that.accountCount,_that.categoryCount,_that.operationCount);case _LoadingFromCloudSyncState() when loadingFromCloud != null:
return loadingFromCloud(_that.accountCount,_that.categoryCount,_that.operationCount);case _SyncedSyncState() when synced != null:
return synced(_that.syncDate,_that.isAdmin);case _FailureSyncState() when failure != null:
return failure();case _InProgressSyncState() when inProgress != null:
return inProgress();case _:
  return null;

}
}

}

/// @nodoc


class _NoDBSyncState extends SyncState {
  const _NoDBSyncState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoDBSyncState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncState.noDB()';
}


}




/// @nodoc


class _NotSyncedSyncState extends SyncState {
  const _NotSyncedSyncState({required this.message}): super._();
  

 final  String message;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotSyncedSyncStateCopyWith<_NotSyncedSyncState> get copyWith => __$NotSyncedSyncStateCopyWithImpl<_NotSyncedSyncState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotSyncedSyncState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SyncState.notSynced(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NotSyncedSyncStateCopyWith<$Res> implements $SyncStateCopyWith<$Res> {
  factory _$NotSyncedSyncStateCopyWith(_NotSyncedSyncState value, $Res Function(_NotSyncedSyncState) _then) = __$NotSyncedSyncStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$NotSyncedSyncStateCopyWithImpl<$Res>
    implements _$NotSyncedSyncStateCopyWith<$Res> {
  __$NotSyncedSyncStateCopyWithImpl(this._self, this._then);

  final _NotSyncedSyncState _self;
  final $Res Function(_NotSyncedSyncState) _then;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NotSyncedSyncState(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LoadingToCloudSyncState extends SyncState {
  const _LoadingToCloudSyncState({required this.accountCount, required this.categoryCount, required this.operationCount}): super._();
  

 final  int accountCount;
 final  int categoryCount;
 final  int operationCount;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingToCloudSyncStateCopyWith<_LoadingToCloudSyncState> get copyWith => __$LoadingToCloudSyncStateCopyWithImpl<_LoadingToCloudSyncState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingToCloudSyncState&&(identical(other.accountCount, accountCount) || other.accountCount == accountCount)&&(identical(other.categoryCount, categoryCount) || other.categoryCount == categoryCount)&&(identical(other.operationCount, operationCount) || other.operationCount == operationCount));
}


@override
int get hashCode => Object.hash(runtimeType,accountCount,categoryCount,operationCount);

@override
String toString() {
  return 'SyncState.loadingToCloud(accountCount: $accountCount, categoryCount: $categoryCount, operationCount: $operationCount)';
}


}

/// @nodoc
abstract mixin class _$LoadingToCloudSyncStateCopyWith<$Res> implements $SyncStateCopyWith<$Res> {
  factory _$LoadingToCloudSyncStateCopyWith(_LoadingToCloudSyncState value, $Res Function(_LoadingToCloudSyncState) _then) = __$LoadingToCloudSyncStateCopyWithImpl;
@useResult
$Res call({
 int accountCount, int categoryCount, int operationCount
});




}
/// @nodoc
class __$LoadingToCloudSyncStateCopyWithImpl<$Res>
    implements _$LoadingToCloudSyncStateCopyWith<$Res> {
  __$LoadingToCloudSyncStateCopyWithImpl(this._self, this._then);

  final _LoadingToCloudSyncState _self;
  final $Res Function(_LoadingToCloudSyncState) _then;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accountCount = null,Object? categoryCount = null,Object? operationCount = null,}) {
  return _then(_LoadingToCloudSyncState(
accountCount: null == accountCount ? _self.accountCount : accountCount // ignore: cast_nullable_to_non_nullable
as int,categoryCount: null == categoryCount ? _self.categoryCount : categoryCount // ignore: cast_nullable_to_non_nullable
as int,operationCount: null == operationCount ? _self.operationCount : operationCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _LoadingFromCloudSyncState extends SyncState {
  const _LoadingFromCloudSyncState({required this.accountCount, required this.categoryCount, required this.operationCount}): super._();
  

 final  int accountCount;
 final  int categoryCount;
 final  int operationCount;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingFromCloudSyncStateCopyWith<_LoadingFromCloudSyncState> get copyWith => __$LoadingFromCloudSyncStateCopyWithImpl<_LoadingFromCloudSyncState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingFromCloudSyncState&&(identical(other.accountCount, accountCount) || other.accountCount == accountCount)&&(identical(other.categoryCount, categoryCount) || other.categoryCount == categoryCount)&&(identical(other.operationCount, operationCount) || other.operationCount == operationCount));
}


@override
int get hashCode => Object.hash(runtimeType,accountCount,categoryCount,operationCount);

@override
String toString() {
  return 'SyncState.loadingFromCloud(accountCount: $accountCount, categoryCount: $categoryCount, operationCount: $operationCount)';
}


}

/// @nodoc
abstract mixin class _$LoadingFromCloudSyncStateCopyWith<$Res> implements $SyncStateCopyWith<$Res> {
  factory _$LoadingFromCloudSyncStateCopyWith(_LoadingFromCloudSyncState value, $Res Function(_LoadingFromCloudSyncState) _then) = __$LoadingFromCloudSyncStateCopyWithImpl;
@useResult
$Res call({
 int accountCount, int categoryCount, int operationCount
});




}
/// @nodoc
class __$LoadingFromCloudSyncStateCopyWithImpl<$Res>
    implements _$LoadingFromCloudSyncStateCopyWith<$Res> {
  __$LoadingFromCloudSyncStateCopyWithImpl(this._self, this._then);

  final _LoadingFromCloudSyncState _self;
  final $Res Function(_LoadingFromCloudSyncState) _then;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accountCount = null,Object? categoryCount = null,Object? operationCount = null,}) {
  return _then(_LoadingFromCloudSyncState(
accountCount: null == accountCount ? _self.accountCount : accountCount // ignore: cast_nullable_to_non_nullable
as int,categoryCount: null == categoryCount ? _self.categoryCount : categoryCount // ignore: cast_nullable_to_non_nullable
as int,operationCount: null == operationCount ? _self.operationCount : operationCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SyncedSyncState extends SyncState {
  const _SyncedSyncState({required this.syncDate, required this.isAdmin}): super._();
  

 final  DateTime syncDate;
 final  bool isAdmin;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncedSyncStateCopyWith<_SyncedSyncState> get copyWith => __$SyncedSyncStateCopyWithImpl<_SyncedSyncState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncedSyncState&&(identical(other.syncDate, syncDate) || other.syncDate == syncDate)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
}


@override
int get hashCode => Object.hash(runtimeType,syncDate,isAdmin);

@override
String toString() {
  return 'SyncState.synced(syncDate: $syncDate, isAdmin: $isAdmin)';
}


}

/// @nodoc
abstract mixin class _$SyncedSyncStateCopyWith<$Res> implements $SyncStateCopyWith<$Res> {
  factory _$SyncedSyncStateCopyWith(_SyncedSyncState value, $Res Function(_SyncedSyncState) _then) = __$SyncedSyncStateCopyWithImpl;
@useResult
$Res call({
 DateTime syncDate, bool isAdmin
});




}
/// @nodoc
class __$SyncedSyncStateCopyWithImpl<$Res>
    implements _$SyncedSyncStateCopyWith<$Res> {
  __$SyncedSyncStateCopyWithImpl(this._self, this._then);

  final _SyncedSyncState _self;
  final $Res Function(_SyncedSyncState) _then;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? syncDate = null,Object? isAdmin = null,}) {
  return _then(_SyncedSyncState(
syncDate: null == syncDate ? _self.syncDate : syncDate // ignore: cast_nullable_to_non_nullable
as DateTime,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _FailureSyncState extends SyncState {
  const _FailureSyncState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailureSyncState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncState.failure()';
}


}




/// @nodoc


class _InProgressSyncState extends SyncState {
  const _InProgressSyncState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InProgressSyncState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncState.inProgress()';
}


}




// dart format on
