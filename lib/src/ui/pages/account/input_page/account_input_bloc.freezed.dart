// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_input_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountInputEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountInputEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountInputEvent()';
}


}

/// @nodoc
class $AccountInputEventCopyWith<$Res>  {
$AccountInputEventCopyWith(AccountInputEvent _, $Res Function(AccountInputEvent) __);
}


/// Adds pattern-matching-related methods to [AccountInputEvent].
extension AccountInputEventPatterns on AccountInputEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FetchAccountInputEvent value)?  fetch,TResult Function( _InputAccountInputEvent value)?  input,TResult Function( _ChangeTitleAccountInputEvent value)?  changeTitle,TResult Function( _ChangeUserAccountInputEvent value)?  changeUser,TResult Function( _SaveAccountInputEvent value)?  save,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FetchAccountInputEvent() when fetch != null:
return fetch(_that);case _InputAccountInputEvent() when input != null:
return input(_that);case _ChangeTitleAccountInputEvent() when changeTitle != null:
return changeTitle(_that);case _ChangeUserAccountInputEvent() when changeUser != null:
return changeUser(_that);case _SaveAccountInputEvent() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FetchAccountInputEvent value)  fetch,required TResult Function( _InputAccountInputEvent value)  input,required TResult Function( _ChangeTitleAccountInputEvent value)  changeTitle,required TResult Function( _ChangeUserAccountInputEvent value)  changeUser,required TResult Function( _SaveAccountInputEvent value)  save,}){
final _that = this;
switch (_that) {
case _FetchAccountInputEvent():
return fetch(_that);case _InputAccountInputEvent():
return input(_that);case _ChangeTitleAccountInputEvent():
return changeTitle(_that);case _ChangeUserAccountInputEvent():
return changeUser(_that);case _SaveAccountInputEvent():
return save(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FetchAccountInputEvent value)?  fetch,TResult? Function( _InputAccountInputEvent value)?  input,TResult? Function( _ChangeTitleAccountInputEvent value)?  changeTitle,TResult? Function( _ChangeUserAccountInputEvent value)?  changeUser,TResult? Function( _SaveAccountInputEvent value)?  save,}){
final _that = this;
switch (_that) {
case _FetchAccountInputEvent() when fetch != null:
return fetch(_that);case _InputAccountInputEvent() when input != null:
return input(_that);case _ChangeTitleAccountInputEvent() when changeTitle != null:
return changeTitle(_that);case _ChangeUserAccountInputEvent() when changeUser != null:
return changeUser(_that);case _SaveAccountInputEvent() when save != null:
return save(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int accountId)?  fetch,TResult Function( bool isDebt)?  input,TResult Function( String title)?  changeTitle,TResult Function( User? user)?  changeUser,TResult Function()?  save,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FetchAccountInputEvent() when fetch != null:
return fetch(_that.accountId);case _InputAccountInputEvent() when input != null:
return input(_that.isDebt);case _ChangeTitleAccountInputEvent() when changeTitle != null:
return changeTitle(_that.title);case _ChangeUserAccountInputEvent() when changeUser != null:
return changeUser(_that.user);case _SaveAccountInputEvent() when save != null:
return save();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int accountId)  fetch,required TResult Function( bool isDebt)  input,required TResult Function( String title)  changeTitle,required TResult Function( User? user)  changeUser,required TResult Function()  save,}) {final _that = this;
switch (_that) {
case _FetchAccountInputEvent():
return fetch(_that.accountId);case _InputAccountInputEvent():
return input(_that.isDebt);case _ChangeTitleAccountInputEvent():
return changeTitle(_that.title);case _ChangeUserAccountInputEvent():
return changeUser(_that.user);case _SaveAccountInputEvent():
return save();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int accountId)?  fetch,TResult? Function( bool isDebt)?  input,TResult? Function( String title)?  changeTitle,TResult? Function( User? user)?  changeUser,TResult? Function()?  save,}) {final _that = this;
switch (_that) {
case _FetchAccountInputEvent() when fetch != null:
return fetch(_that.accountId);case _InputAccountInputEvent() when input != null:
return input(_that.isDebt);case _ChangeTitleAccountInputEvent() when changeTitle != null:
return changeTitle(_that.title);case _ChangeUserAccountInputEvent() when changeUser != null:
return changeUser(_that.user);case _SaveAccountInputEvent() when save != null:
return save();case _:
  return null;

}
}

}

/// @nodoc


class _FetchAccountInputEvent implements AccountInputEvent {
  const _FetchAccountInputEvent({required this.accountId});
  

 final  int accountId;

/// Create a copy of AccountInputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FetchAccountInputEventCopyWith<_FetchAccountInputEvent> get copyWith => __$FetchAccountInputEventCopyWithImpl<_FetchAccountInputEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchAccountInputEvent&&(identical(other.accountId, accountId) || other.accountId == accountId));
}


@override
int get hashCode => Object.hash(runtimeType,accountId);

@override
String toString() {
  return 'AccountInputEvent.fetch(accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class _$FetchAccountInputEventCopyWith<$Res> implements $AccountInputEventCopyWith<$Res> {
  factory _$FetchAccountInputEventCopyWith(_FetchAccountInputEvent value, $Res Function(_FetchAccountInputEvent) _then) = __$FetchAccountInputEventCopyWithImpl;
@useResult
$Res call({
 int accountId
});




}
/// @nodoc
class __$FetchAccountInputEventCopyWithImpl<$Res>
    implements _$FetchAccountInputEventCopyWith<$Res> {
  __$FetchAccountInputEventCopyWithImpl(this._self, this._then);

  final _FetchAccountInputEvent _self;
  final $Res Function(_FetchAccountInputEvent) _then;

/// Create a copy of AccountInputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accountId = null,}) {
  return _then(_FetchAccountInputEvent(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _InputAccountInputEvent implements AccountInputEvent {
  const _InputAccountInputEvent({required this.isDebt});
  

 final  bool isDebt;

/// Create a copy of AccountInputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InputAccountInputEventCopyWith<_InputAccountInputEvent> get copyWith => __$InputAccountInputEventCopyWithImpl<_InputAccountInputEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InputAccountInputEvent&&(identical(other.isDebt, isDebt) || other.isDebt == isDebt));
}


@override
int get hashCode => Object.hash(runtimeType,isDebt);

@override
String toString() {
  return 'AccountInputEvent.input(isDebt: $isDebt)';
}


}

/// @nodoc
abstract mixin class _$InputAccountInputEventCopyWith<$Res> implements $AccountInputEventCopyWith<$Res> {
  factory _$InputAccountInputEventCopyWith(_InputAccountInputEvent value, $Res Function(_InputAccountInputEvent) _then) = __$InputAccountInputEventCopyWithImpl;
@useResult
$Res call({
 bool isDebt
});




}
/// @nodoc
class __$InputAccountInputEventCopyWithImpl<$Res>
    implements _$InputAccountInputEventCopyWith<$Res> {
  __$InputAccountInputEventCopyWithImpl(this._self, this._then);

  final _InputAccountInputEvent _self;
  final $Res Function(_InputAccountInputEvent) _then;

/// Create a copy of AccountInputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isDebt = null,}) {
  return _then(_InputAccountInputEvent(
isDebt: null == isDebt ? _self.isDebt : isDebt // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ChangeTitleAccountInputEvent implements AccountInputEvent {
  const _ChangeTitleAccountInputEvent(this.title);
  

 final  String title;

/// Create a copy of AccountInputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeTitleAccountInputEventCopyWith<_ChangeTitleAccountInputEvent> get copyWith => __$ChangeTitleAccountInputEventCopyWithImpl<_ChangeTitleAccountInputEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeTitleAccountInputEvent&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'AccountInputEvent.changeTitle(title: $title)';
}


}

/// @nodoc
abstract mixin class _$ChangeTitleAccountInputEventCopyWith<$Res> implements $AccountInputEventCopyWith<$Res> {
  factory _$ChangeTitleAccountInputEventCopyWith(_ChangeTitleAccountInputEvent value, $Res Function(_ChangeTitleAccountInputEvent) _then) = __$ChangeTitleAccountInputEventCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class __$ChangeTitleAccountInputEventCopyWithImpl<$Res>
    implements _$ChangeTitleAccountInputEventCopyWith<$Res> {
  __$ChangeTitleAccountInputEventCopyWithImpl(this._self, this._then);

  final _ChangeTitleAccountInputEvent _self;
  final $Res Function(_ChangeTitleAccountInputEvent) _then;

/// Create a copy of AccountInputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(_ChangeTitleAccountInputEvent(
null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ChangeUserAccountInputEvent implements AccountInputEvent {
  const _ChangeUserAccountInputEvent(this.user);
  

 final  User? user;

/// Create a copy of AccountInputEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeUserAccountInputEventCopyWith<_ChangeUserAccountInputEvent> get copyWith => __$ChangeUserAccountInputEventCopyWithImpl<_ChangeUserAccountInputEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeUserAccountInputEvent&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AccountInputEvent.changeUser(user: $user)';
}


}

/// @nodoc
abstract mixin class _$ChangeUserAccountInputEventCopyWith<$Res> implements $AccountInputEventCopyWith<$Res> {
  factory _$ChangeUserAccountInputEventCopyWith(_ChangeUserAccountInputEvent value, $Res Function(_ChangeUserAccountInputEvent) _then) = __$ChangeUserAccountInputEventCopyWithImpl;
@useResult
$Res call({
 User? user
});


$UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$ChangeUserAccountInputEventCopyWithImpl<$Res>
    implements _$ChangeUserAccountInputEventCopyWith<$Res> {
  __$ChangeUserAccountInputEventCopyWithImpl(this._self, this._then);

  final _ChangeUserAccountInputEvent _self;
  final $Res Function(_ChangeUserAccountInputEvent) _then;

/// Create a copy of AccountInputEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = freezed,}) {
  return _then(_ChangeUserAccountInputEvent(
freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of AccountInputEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class _SaveAccountInputEvent implements AccountInputEvent {
  const _SaveAccountInputEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveAccountInputEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountInputEvent.save()';
}


}




/// @nodoc
mixin _$AccountInputState {

 String get title; bool get isDebt; int? get userId; List<User> get users; BaseAccount? get account; bool get isSaved;
/// Create a copy of AccountInputState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountInputStateCopyWith<AccountInputState> get copyWith => _$AccountInputStateCopyWithImpl<AccountInputState>(this as AccountInputState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountInputState&&(identical(other.title, title) || other.title == title)&&(identical(other.isDebt, isDebt) || other.isDebt == isDebt)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.account, account) || other.account == account)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved));
}


@override
int get hashCode => Object.hash(runtimeType,title,isDebt,userId,const DeepCollectionEquality().hash(users),account,isSaved);

@override
String toString() {
  return 'AccountInputState(title: $title, isDebt: $isDebt, userId: $userId, users: $users, account: $account, isSaved: $isSaved)';
}


}

/// @nodoc
abstract mixin class $AccountInputStateCopyWith<$Res>  {
  factory $AccountInputStateCopyWith(AccountInputState value, $Res Function(AccountInputState) _then) = _$AccountInputStateCopyWithImpl;
@useResult
$Res call({
 String title, bool isDebt, int? userId, List<User> users, BaseAccount? account, bool isSaved
});




}
/// @nodoc
class _$AccountInputStateCopyWithImpl<$Res>
    implements $AccountInputStateCopyWith<$Res> {
  _$AccountInputStateCopyWithImpl(this._self, this._then);

  final AccountInputState _self;
  final $Res Function(AccountInputState) _then;

/// Create a copy of AccountInputState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? isDebt = null,Object? userId = freezed,Object? users = null,Object? account = freezed,Object? isSaved = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isDebt: null == isDebt ? _self.isDebt : isDebt // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<User>,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as BaseAccount?,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountInputState].
extension AccountInputStatePatterns on AccountInputState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountInputState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountInputState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountInputState value)  $default,){
final _that = this;
switch (_that) {
case _AccountInputState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountInputState value)?  $default,){
final _that = this;
switch (_that) {
case _AccountInputState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  bool isDebt,  int? userId,  List<User> users,  BaseAccount? account,  bool isSaved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountInputState() when $default != null:
return $default(_that.title,_that.isDebt,_that.userId,_that.users,_that.account,_that.isSaved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  bool isDebt,  int? userId,  List<User> users,  BaseAccount? account,  bool isSaved)  $default,) {final _that = this;
switch (_that) {
case _AccountInputState():
return $default(_that.title,_that.isDebt,_that.userId,_that.users,_that.account,_that.isSaved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  bool isDebt,  int? userId,  List<User> users,  BaseAccount? account,  bool isSaved)?  $default,) {final _that = this;
switch (_that) {
case _AccountInputState() when $default != null:
return $default(_that.title,_that.isDebt,_that.userId,_that.users,_that.account,_that.isSaved);case _:
  return null;

}
}

}

/// @nodoc


class _AccountInputState implements AccountInputState {
  const _AccountInputState({required this.title, required this.isDebt, required this.userId, required final  List<User> users, this.account, required this.isSaved}): _users = users;
  

@override final  String title;
@override final  bool isDebt;
@override final  int? userId;
 final  List<User> _users;
@override List<User> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override final  BaseAccount? account;
@override final  bool isSaved;

/// Create a copy of AccountInputState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountInputStateCopyWith<_AccountInputState> get copyWith => __$AccountInputStateCopyWithImpl<_AccountInputState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountInputState&&(identical(other.title, title) || other.title == title)&&(identical(other.isDebt, isDebt) || other.isDebt == isDebt)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.account, account) || other.account == account)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved));
}


@override
int get hashCode => Object.hash(runtimeType,title,isDebt,userId,const DeepCollectionEquality().hash(_users),account,isSaved);

@override
String toString() {
  return 'AccountInputState(title: $title, isDebt: $isDebt, userId: $userId, users: $users, account: $account, isSaved: $isSaved)';
}


}

/// @nodoc
abstract mixin class _$AccountInputStateCopyWith<$Res> implements $AccountInputStateCopyWith<$Res> {
  factory _$AccountInputStateCopyWith(_AccountInputState value, $Res Function(_AccountInputState) _then) = __$AccountInputStateCopyWithImpl;
@override @useResult
$Res call({
 String title, bool isDebt, int? userId, List<User> users, BaseAccount? account, bool isSaved
});




}
/// @nodoc
class __$AccountInputStateCopyWithImpl<$Res>
    implements _$AccountInputStateCopyWith<$Res> {
  __$AccountInputStateCopyWithImpl(this._self, this._then);

  final _AccountInputState _self;
  final $Res Function(_AccountInputState) _then;

/// Create a copy of AccountInputState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? isDebt = null,Object? userId = freezed,Object? users = null,Object? account = freezed,Object? isSaved = null,}) {
  return _then(_AccountInputState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isDebt: null == isDebt ? _self.isDebt : isDebt // ignore: cast_nullable_to_non_nullable
as bool,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<User>,account: freezed == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as BaseAccount?,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
