// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) changeAuth,
    required TResult Function() signInSilently,
    required TResult Function() signIn,
    required TResult Function() signOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? changeAuth,
    TResult? Function()? signInSilently,
    TResult? Function()? signIn,
    TResult? Function()? signOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? changeAuth,
    TResult Function()? signInSilently,
    TResult Function()? signIn,
    TResult Function()? signOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeAuthAuthEvent value) changeAuth,
    required TResult Function(_SignInSilentlyAuthEvent value) signInSilently,
    required TResult Function(_SignInAuthEvent value) signIn,
    required TResult Function(_SignOutAuthEvent value) signOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeAuthAuthEvent value)? changeAuth,
    TResult? Function(_SignInSilentlyAuthEvent value)? signInSilently,
    TResult? Function(_SignInAuthEvent value)? signIn,
    TResult? Function(_SignOutAuthEvent value)? signOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeAuthAuthEvent value)? changeAuth,
    TResult Function(_SignInSilentlyAuthEvent value)? signInSilently,
    TResult Function(_SignInAuthEvent value)? signIn,
    TResult Function(_SignOutAuthEvent value)? signOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ChangeAuthAuthEventCopyWith<$Res> {
  factory _$$_ChangeAuthAuthEventCopyWith(_$_ChangeAuthAuthEvent value,
          $Res Function(_$_ChangeAuthAuthEvent) then) =
      __$$_ChangeAuthAuthEventCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user});
}

/// @nodoc
class __$$_ChangeAuthAuthEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_ChangeAuthAuthEvent>
    implements _$$_ChangeAuthAuthEventCopyWith<$Res> {
  __$$_ChangeAuthAuthEventCopyWithImpl(_$_ChangeAuthAuthEvent _value,
      $Res Function(_$_ChangeAuthAuthEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_ChangeAuthAuthEvent(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc

class _$_ChangeAuthAuthEvent implements _ChangeAuthAuthEvent {
  const _$_ChangeAuthAuthEvent({required this.user});

  @override
  final User? user;

  @override
  String toString() {
    return 'AuthEvent.changeAuth(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeAuthAuthEvent &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeAuthAuthEventCopyWith<_$_ChangeAuthAuthEvent> get copyWith =>
      __$$_ChangeAuthAuthEventCopyWithImpl<_$_ChangeAuthAuthEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) changeAuth,
    required TResult Function() signInSilently,
    required TResult Function() signIn,
    required TResult Function() signOut,
  }) {
    return changeAuth(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? changeAuth,
    TResult? Function()? signInSilently,
    TResult? Function()? signIn,
    TResult? Function()? signOut,
  }) {
    return changeAuth?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? changeAuth,
    TResult Function()? signInSilently,
    TResult Function()? signIn,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    if (changeAuth != null) {
      return changeAuth(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeAuthAuthEvent value) changeAuth,
    required TResult Function(_SignInSilentlyAuthEvent value) signInSilently,
    required TResult Function(_SignInAuthEvent value) signIn,
    required TResult Function(_SignOutAuthEvent value) signOut,
  }) {
    return changeAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeAuthAuthEvent value)? changeAuth,
    TResult? Function(_SignInSilentlyAuthEvent value)? signInSilently,
    TResult? Function(_SignInAuthEvent value)? signIn,
    TResult? Function(_SignOutAuthEvent value)? signOut,
  }) {
    return changeAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeAuthAuthEvent value)? changeAuth,
    TResult Function(_SignInSilentlyAuthEvent value)? signInSilently,
    TResult Function(_SignInAuthEvent value)? signIn,
    TResult Function(_SignOutAuthEvent value)? signOut,
    required TResult orElse(),
  }) {
    if (changeAuth != null) {
      return changeAuth(this);
    }
    return orElse();
  }
}

abstract class _ChangeAuthAuthEvent implements AuthEvent {
  const factory _ChangeAuthAuthEvent({required final User? user}) =
      _$_ChangeAuthAuthEvent;

  User? get user;
  @JsonKey(ignore: true)
  _$$_ChangeAuthAuthEventCopyWith<_$_ChangeAuthAuthEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignInSilentlyAuthEventCopyWith<$Res> {
  factory _$$_SignInSilentlyAuthEventCopyWith(_$_SignInSilentlyAuthEvent value,
          $Res Function(_$_SignInSilentlyAuthEvent) then) =
      __$$_SignInSilentlyAuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInSilentlyAuthEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_SignInSilentlyAuthEvent>
    implements _$$_SignInSilentlyAuthEventCopyWith<$Res> {
  __$$_SignInSilentlyAuthEventCopyWithImpl(_$_SignInSilentlyAuthEvent _value,
      $Res Function(_$_SignInSilentlyAuthEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignInSilentlyAuthEvent implements _SignInSilentlyAuthEvent {
  const _$_SignInSilentlyAuthEvent();

  @override
  String toString() {
    return 'AuthEvent.signInSilently()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInSilentlyAuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) changeAuth,
    required TResult Function() signInSilently,
    required TResult Function() signIn,
    required TResult Function() signOut,
  }) {
    return signInSilently();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? changeAuth,
    TResult? Function()? signInSilently,
    TResult? Function()? signIn,
    TResult? Function()? signOut,
  }) {
    return signInSilently?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? changeAuth,
    TResult Function()? signInSilently,
    TResult Function()? signIn,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    if (signInSilently != null) {
      return signInSilently();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeAuthAuthEvent value) changeAuth,
    required TResult Function(_SignInSilentlyAuthEvent value) signInSilently,
    required TResult Function(_SignInAuthEvent value) signIn,
    required TResult Function(_SignOutAuthEvent value) signOut,
  }) {
    return signInSilently(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeAuthAuthEvent value)? changeAuth,
    TResult? Function(_SignInSilentlyAuthEvent value)? signInSilently,
    TResult? Function(_SignInAuthEvent value)? signIn,
    TResult? Function(_SignOutAuthEvent value)? signOut,
  }) {
    return signInSilently?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeAuthAuthEvent value)? changeAuth,
    TResult Function(_SignInSilentlyAuthEvent value)? signInSilently,
    TResult Function(_SignInAuthEvent value)? signIn,
    TResult Function(_SignOutAuthEvent value)? signOut,
    required TResult orElse(),
  }) {
    if (signInSilently != null) {
      return signInSilently(this);
    }
    return orElse();
  }
}

abstract class _SignInSilentlyAuthEvent implements AuthEvent {
  const factory _SignInSilentlyAuthEvent() = _$_SignInSilentlyAuthEvent;
}

/// @nodoc
abstract class _$$_SignInAuthEventCopyWith<$Res> {
  factory _$$_SignInAuthEventCopyWith(
          _$_SignInAuthEvent value, $Res Function(_$_SignInAuthEvent) then) =
      __$$_SignInAuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInAuthEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_SignInAuthEvent>
    implements _$$_SignInAuthEventCopyWith<$Res> {
  __$$_SignInAuthEventCopyWithImpl(
      _$_SignInAuthEvent _value, $Res Function(_$_SignInAuthEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignInAuthEvent implements _SignInAuthEvent {
  const _$_SignInAuthEvent();

  @override
  String toString() {
    return 'AuthEvent.signIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignInAuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) changeAuth,
    required TResult Function() signInSilently,
    required TResult Function() signIn,
    required TResult Function() signOut,
  }) {
    return signIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? changeAuth,
    TResult? Function()? signInSilently,
    TResult? Function()? signIn,
    TResult? Function()? signOut,
  }) {
    return signIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? changeAuth,
    TResult Function()? signInSilently,
    TResult Function()? signIn,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeAuthAuthEvent value) changeAuth,
    required TResult Function(_SignInSilentlyAuthEvent value) signInSilently,
    required TResult Function(_SignInAuthEvent value) signIn,
    required TResult Function(_SignOutAuthEvent value) signOut,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeAuthAuthEvent value)? changeAuth,
    TResult? Function(_SignInSilentlyAuthEvent value)? signInSilently,
    TResult? Function(_SignInAuthEvent value)? signIn,
    TResult? Function(_SignOutAuthEvent value)? signOut,
  }) {
    return signIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeAuthAuthEvent value)? changeAuth,
    TResult Function(_SignInSilentlyAuthEvent value)? signInSilently,
    TResult Function(_SignInAuthEvent value)? signIn,
    TResult Function(_SignOutAuthEvent value)? signOut,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class _SignInAuthEvent implements AuthEvent {
  const factory _SignInAuthEvent() = _$_SignInAuthEvent;
}

/// @nodoc
abstract class _$$_SignOutAuthEventCopyWith<$Res> {
  factory _$$_SignOutAuthEventCopyWith(
          _$_SignOutAuthEvent value, $Res Function(_$_SignOutAuthEvent) then) =
      __$$_SignOutAuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignOutAuthEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_SignOutAuthEvent>
    implements _$$_SignOutAuthEventCopyWith<$Res> {
  __$$_SignOutAuthEventCopyWithImpl(
      _$_SignOutAuthEvent _value, $Res Function(_$_SignOutAuthEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignOutAuthEvent implements _SignOutAuthEvent {
  const _$_SignOutAuthEvent();

  @override
  String toString() {
    return 'AuthEvent.signOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignOutAuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User? user) changeAuth,
    required TResult Function() signInSilently,
    required TResult Function() signIn,
    required TResult Function() signOut,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User? user)? changeAuth,
    TResult? Function()? signInSilently,
    TResult? Function()? signIn,
    TResult? Function()? signOut,
  }) {
    return signOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User? user)? changeAuth,
    TResult Function()? signInSilently,
    TResult Function()? signIn,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeAuthAuthEvent value) changeAuth,
    required TResult Function(_SignInSilentlyAuthEvent value) signInSilently,
    required TResult Function(_SignInAuthEvent value) signIn,
    required TResult Function(_SignOutAuthEvent value) signOut,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeAuthAuthEvent value)? changeAuth,
    TResult? Function(_SignInSilentlyAuthEvent value)? signInSilently,
    TResult? Function(_SignInAuthEvent value)? signIn,
    TResult? Function(_SignOutAuthEvent value)? signOut,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeAuthAuthEvent value)? changeAuth,
    TResult Function(_SignInSilentlyAuthEvent value)? signInSilently,
    TResult Function(_SignInAuthEvent value)? signIn,
    TResult Function(_SignOutAuthEvent value)? signOut,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class _SignOutAuthEvent implements AuthEvent {
  const factory _SignOutAuthEvent() = _$_SignOutAuthEvent;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function() notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function()? notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedAuthState value) authenticated,
    required TResult Function(_NotAuthenticatedAuthState value)
        notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedAuthState value)? authenticated,
    TResult? Function(_NotAuthenticatedAuthState value)? notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedAuthState value)? authenticated,
    TResult Function(_NotAuthenticatedAuthState value)? notAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AuthenticatedAuthStateCopyWith<$Res> {
  factory _$$_AuthenticatedAuthStateCopyWith(_$_AuthenticatedAuthState value,
          $Res Function(_$_AuthenticatedAuthState) then) =
      __$$_AuthenticatedAuthStateCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$_AuthenticatedAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthenticatedAuthState>
    implements _$$_AuthenticatedAuthStateCopyWith<$Res> {
  __$$_AuthenticatedAuthStateCopyWithImpl(_$_AuthenticatedAuthState _value,
      $Res Function(_$_AuthenticatedAuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_AuthenticatedAuthState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_AuthenticatedAuthState extends _AuthenticatedAuthState {
  const _$_AuthenticatedAuthState({required this.user}) : super._();

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticatedAuthState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticatedAuthStateCopyWith<_$_AuthenticatedAuthState> get copyWith =>
      __$$_AuthenticatedAuthStateCopyWithImpl<_$_AuthenticatedAuthState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function() notAuthenticated,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function()? notAuthenticated,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedAuthState value) authenticated,
    required TResult Function(_NotAuthenticatedAuthState value)
        notAuthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedAuthState value)? authenticated,
    TResult? Function(_NotAuthenticatedAuthState value)? notAuthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedAuthState value)? authenticated,
    TResult Function(_NotAuthenticatedAuthState value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _AuthenticatedAuthState extends AuthState {
  const factory _AuthenticatedAuthState({required final User user}) =
      _$_AuthenticatedAuthState;
  const _AuthenticatedAuthState._() : super._();

  User get user;
  @JsonKey(ignore: true)
  _$$_AuthenticatedAuthStateCopyWith<_$_AuthenticatedAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotAuthenticatedAuthStateCopyWith<$Res> {
  factory _$$_NotAuthenticatedAuthStateCopyWith(
          _$_NotAuthenticatedAuthState value,
          $Res Function(_$_NotAuthenticatedAuthState) then) =
      __$$_NotAuthenticatedAuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotAuthenticatedAuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_NotAuthenticatedAuthState>
    implements _$$_NotAuthenticatedAuthStateCopyWith<$Res> {
  __$$_NotAuthenticatedAuthStateCopyWithImpl(
      _$_NotAuthenticatedAuthState _value,
      $Res Function(_$_NotAuthenticatedAuthState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NotAuthenticatedAuthState extends _NotAuthenticatedAuthState {
  const _$_NotAuthenticatedAuthState() : super._();

  @override
  String toString() {
    return 'AuthState.notAuthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotAuthenticatedAuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) authenticated,
    required TResult Function() notAuthenticated,
  }) {
    return notAuthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? authenticated,
    TResult? Function()? notAuthenticated,
  }) {
    return notAuthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? authenticated,
    TResult Function()? notAuthenticated,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthenticatedAuthState value) authenticated,
    required TResult Function(_NotAuthenticatedAuthState value)
        notAuthenticated,
  }) {
    return notAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthenticatedAuthState value)? authenticated,
    TResult? Function(_NotAuthenticatedAuthState value)? notAuthenticated,
  }) {
    return notAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthenticatedAuthState value)? authenticated,
    TResult Function(_NotAuthenticatedAuthState value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _NotAuthenticatedAuthState extends AuthState {
  const factory _NotAuthenticatedAuthState() = _$_NotAuthenticatedAuthState;
  const _NotAuthenticatedAuthState._() : super._();
}
