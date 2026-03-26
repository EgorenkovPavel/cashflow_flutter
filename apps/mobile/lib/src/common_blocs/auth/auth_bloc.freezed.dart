// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ChangeAuthAuthEvent value)?  changeAuth,TResult Function( _SignInSilentlyAuthEvent value)?  signInSilently,TResult Function( _SignInAuthEvent value)?  signIn,TResult Function( _SignOutAuthEvent value)?  signOut,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeAuthAuthEvent() when changeAuth != null:
return changeAuth(_that);case _SignInSilentlyAuthEvent() when signInSilently != null:
return signInSilently(_that);case _SignInAuthEvent() when signIn != null:
return signIn(_that);case _SignOutAuthEvent() when signOut != null:
return signOut(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ChangeAuthAuthEvent value)  changeAuth,required TResult Function( _SignInSilentlyAuthEvent value)  signInSilently,required TResult Function( _SignInAuthEvent value)  signIn,required TResult Function( _SignOutAuthEvent value)  signOut,}){
final _that = this;
switch (_that) {
case _ChangeAuthAuthEvent():
return changeAuth(_that);case _SignInSilentlyAuthEvent():
return signInSilently(_that);case _SignInAuthEvent():
return signIn(_that);case _SignOutAuthEvent():
return signOut(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ChangeAuthAuthEvent value)?  changeAuth,TResult? Function( _SignInSilentlyAuthEvent value)?  signInSilently,TResult? Function( _SignInAuthEvent value)?  signIn,TResult? Function( _SignOutAuthEvent value)?  signOut,}){
final _that = this;
switch (_that) {
case _ChangeAuthAuthEvent() when changeAuth != null:
return changeAuth(_that);case _SignInSilentlyAuthEvent() when signInSilently != null:
return signInSilently(_that);case _SignInAuthEvent() when signIn != null:
return signIn(_that);case _SignOutAuthEvent() when signOut != null:
return signOut(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( User? user,  String idToken)?  changeAuth,TResult Function()?  signInSilently,TResult Function()?  signIn,TResult Function()?  signOut,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeAuthAuthEvent() when changeAuth != null:
return changeAuth(_that.user,_that.idToken);case _SignInSilentlyAuthEvent() when signInSilently != null:
return signInSilently();case _SignInAuthEvent() when signIn != null:
return signIn();case _SignOutAuthEvent() when signOut != null:
return signOut();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( User? user,  String idToken)  changeAuth,required TResult Function()  signInSilently,required TResult Function()  signIn,required TResult Function()  signOut,}) {final _that = this;
switch (_that) {
case _ChangeAuthAuthEvent():
return changeAuth(_that.user,_that.idToken);case _SignInSilentlyAuthEvent():
return signInSilently();case _SignInAuthEvent():
return signIn();case _SignOutAuthEvent():
return signOut();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( User? user,  String idToken)?  changeAuth,TResult? Function()?  signInSilently,TResult? Function()?  signIn,TResult? Function()?  signOut,}) {final _that = this;
switch (_that) {
case _ChangeAuthAuthEvent() when changeAuth != null:
return changeAuth(_that.user,_that.idToken);case _SignInSilentlyAuthEvent() when signInSilently != null:
return signInSilently();case _SignInAuthEvent() when signIn != null:
return signIn();case _SignOutAuthEvent() when signOut != null:
return signOut();case _:
  return null;

}
}

}

/// @nodoc


class _ChangeAuthAuthEvent implements AuthEvent {
  const _ChangeAuthAuthEvent({required this.user, required this.idToken});
  

 final  User? user;
 final  String idToken;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeAuthAuthEventCopyWith<_ChangeAuthAuthEvent> get copyWith => __$ChangeAuthAuthEventCopyWithImpl<_ChangeAuthAuthEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeAuthAuthEvent&&(identical(other.user, user) || other.user == user)&&(identical(other.idToken, idToken) || other.idToken == idToken));
}


@override
int get hashCode => Object.hash(runtimeType,user,idToken);

@override
String toString() {
  return 'AuthEvent.changeAuth(user: $user, idToken: $idToken)';
}


}

/// @nodoc
abstract mixin class _$ChangeAuthAuthEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$ChangeAuthAuthEventCopyWith(_ChangeAuthAuthEvent value, $Res Function(_ChangeAuthAuthEvent) _then) = __$ChangeAuthAuthEventCopyWithImpl;
@useResult
$Res call({
 User? user, String idToken
});


$UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$ChangeAuthAuthEventCopyWithImpl<$Res>
    implements _$ChangeAuthAuthEventCopyWith<$Res> {
  __$ChangeAuthAuthEventCopyWithImpl(this._self, this._then);

  final _ChangeAuthAuthEvent _self;
  final $Res Function(_ChangeAuthAuthEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? idToken = null,}) {
  return _then(_ChangeAuthAuthEvent(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AuthEvent
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


class _SignInSilentlyAuthEvent implements AuthEvent {
  const _SignInSilentlyAuthEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInSilentlyAuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signInSilently()';
}


}




/// @nodoc


class _SignInAuthEvent implements AuthEvent {
  const _SignInAuthEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInAuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signIn()';
}


}




/// @nodoc


class _SignOutAuthEvent implements AuthEvent {
  const _SignOutAuthEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignOutAuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signOut()';
}


}




/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthenticatedAuthState value)?  authenticated,TResult Function( _NotAuthenticatedAuthState value)?  notAuthenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthenticatedAuthState() when authenticated != null:
return authenticated(_that);case _NotAuthenticatedAuthState() when notAuthenticated != null:
return notAuthenticated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthenticatedAuthState value)  authenticated,required TResult Function( _NotAuthenticatedAuthState value)  notAuthenticated,}){
final _that = this;
switch (_that) {
case _AuthenticatedAuthState():
return authenticated(_that);case _NotAuthenticatedAuthState():
return notAuthenticated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthenticatedAuthState value)?  authenticated,TResult? Function( _NotAuthenticatedAuthState value)?  notAuthenticated,}){
final _that = this;
switch (_that) {
case _AuthenticatedAuthState() when authenticated != null:
return authenticated(_that);case _NotAuthenticatedAuthState() when notAuthenticated != null:
return notAuthenticated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( User user,  String idToken)?  authenticated,TResult Function()?  notAuthenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthenticatedAuthState() when authenticated != null:
return authenticated(_that.user,_that.idToken);case _NotAuthenticatedAuthState() when notAuthenticated != null:
return notAuthenticated();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( User user,  String idToken)  authenticated,required TResult Function()  notAuthenticated,}) {final _that = this;
switch (_that) {
case _AuthenticatedAuthState():
return authenticated(_that.user,_that.idToken);case _NotAuthenticatedAuthState():
return notAuthenticated();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( User user,  String idToken)?  authenticated,TResult? Function()?  notAuthenticated,}) {final _that = this;
switch (_that) {
case _AuthenticatedAuthState() when authenticated != null:
return authenticated(_that.user,_that.idToken);case _NotAuthenticatedAuthState() when notAuthenticated != null:
return notAuthenticated();case _:
  return null;

}
}

}

/// @nodoc


class _AuthenticatedAuthState extends AuthState {
  const _AuthenticatedAuthState({required this.user, required this.idToken}): super._();
  

 final  User user;
 final  String idToken;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthenticatedAuthStateCopyWith<_AuthenticatedAuthState> get copyWith => __$AuthenticatedAuthStateCopyWithImpl<_AuthenticatedAuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthenticatedAuthState&&(identical(other.user, user) || other.user == user)&&(identical(other.idToken, idToken) || other.idToken == idToken));
}


@override
int get hashCode => Object.hash(runtimeType,user,idToken);

@override
String toString() {
  return 'AuthState.authenticated(user: $user, idToken: $idToken)';
}


}

/// @nodoc
abstract mixin class _$AuthenticatedAuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthenticatedAuthStateCopyWith(_AuthenticatedAuthState value, $Res Function(_AuthenticatedAuthState) _then) = __$AuthenticatedAuthStateCopyWithImpl;
@useResult
$Res call({
 User user, String idToken
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class __$AuthenticatedAuthStateCopyWithImpl<$Res>
    implements _$AuthenticatedAuthStateCopyWith<$Res> {
  __$AuthenticatedAuthStateCopyWithImpl(this._self, this._then);

  final _AuthenticatedAuthState _self;
  final $Res Function(_AuthenticatedAuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? idToken = null,}) {
  return _then(_AuthenticatedAuthState(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AuthState
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


class _NotAuthenticatedAuthState extends AuthState {
  const _NotAuthenticatedAuthState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotAuthenticatedAuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.notAuthenticated()';
}


}




// dart format on
