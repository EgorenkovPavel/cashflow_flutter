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
abstract class _$$ChangeAuthAuthEventImplCopyWith<$Res> {
  factory _$$ChangeAuthAuthEventImplCopyWith(_$ChangeAuthAuthEventImpl value,
          $Res Function(_$ChangeAuthAuthEventImpl) then) =
      __$$ChangeAuthAuthEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ChangeAuthAuthEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ChangeAuthAuthEventImpl>
    implements _$$ChangeAuthAuthEventImplCopyWith<$Res> {
  __$$ChangeAuthAuthEventImplCopyWithImpl(_$ChangeAuthAuthEventImpl _value,
      $Res Function(_$ChangeAuthAuthEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$ChangeAuthAuthEventImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$ChangeAuthAuthEventImpl implements _ChangeAuthAuthEvent {
  const _$ChangeAuthAuthEventImpl({required this.user});

  @override
  final User? user;

  @override
  String toString() {
    return 'AuthEvent.changeAuth(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeAuthAuthEventImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeAuthAuthEventImplCopyWith<_$ChangeAuthAuthEventImpl> get copyWith =>
      __$$ChangeAuthAuthEventImplCopyWithImpl<_$ChangeAuthAuthEventImpl>(
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
      _$ChangeAuthAuthEventImpl;

  User? get user;
  @JsonKey(ignore: true)
  _$$ChangeAuthAuthEventImplCopyWith<_$ChangeAuthAuthEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInSilentlyAuthEventImplCopyWith<$Res> {
  factory _$$SignInSilentlyAuthEventImplCopyWith(
          _$SignInSilentlyAuthEventImpl value,
          $Res Function(_$SignInSilentlyAuthEventImpl) then) =
      __$$SignInSilentlyAuthEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInSilentlyAuthEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInSilentlyAuthEventImpl>
    implements _$$SignInSilentlyAuthEventImplCopyWith<$Res> {
  __$$SignInSilentlyAuthEventImplCopyWithImpl(
      _$SignInSilentlyAuthEventImpl _value,
      $Res Function(_$SignInSilentlyAuthEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInSilentlyAuthEventImpl implements _SignInSilentlyAuthEvent {
  const _$SignInSilentlyAuthEventImpl();

  @override
  String toString() {
    return 'AuthEvent.signInSilently()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInSilentlyAuthEventImpl);
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
  const factory _SignInSilentlyAuthEvent() = _$SignInSilentlyAuthEventImpl;
}

/// @nodoc
abstract class _$$SignInAuthEventImplCopyWith<$Res> {
  factory _$$SignInAuthEventImplCopyWith(_$SignInAuthEventImpl value,
          $Res Function(_$SignInAuthEventImpl) then) =
      __$$SignInAuthEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInAuthEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInAuthEventImpl>
    implements _$$SignInAuthEventImplCopyWith<$Res> {
  __$$SignInAuthEventImplCopyWithImpl(
      _$SignInAuthEventImpl _value, $Res Function(_$SignInAuthEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignInAuthEventImpl implements _SignInAuthEvent {
  const _$SignInAuthEventImpl();

  @override
  String toString() {
    return 'AuthEvent.signIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInAuthEventImpl);
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
  const factory _SignInAuthEvent() = _$SignInAuthEventImpl;
}

/// @nodoc
abstract class _$$SignOutAuthEventImplCopyWith<$Res> {
  factory _$$SignOutAuthEventImplCopyWith(_$SignOutAuthEventImpl value,
          $Res Function(_$SignOutAuthEventImpl) then) =
      __$$SignOutAuthEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignOutAuthEventImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignOutAuthEventImpl>
    implements _$$SignOutAuthEventImplCopyWith<$Res> {
  __$$SignOutAuthEventImplCopyWithImpl(_$SignOutAuthEventImpl _value,
      $Res Function(_$SignOutAuthEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SignOutAuthEventImpl implements _SignOutAuthEvent {
  const _$SignOutAuthEventImpl();

  @override
  String toString() {
    return 'AuthEvent.signOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignOutAuthEventImpl);
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
  const factory _SignOutAuthEvent() = _$SignOutAuthEventImpl;
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
abstract class _$$AuthenticatedAuthStateImplCopyWith<$Res> {
  factory _$$AuthenticatedAuthStateImplCopyWith(
          _$AuthenticatedAuthStateImpl value,
          $Res Function(_$AuthenticatedAuthStateImpl) then) =
      __$$AuthenticatedAuthStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthenticatedAuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedAuthStateImpl>
    implements _$$AuthenticatedAuthStateImplCopyWith<$Res> {
  __$$AuthenticatedAuthStateImplCopyWithImpl(
      _$AuthenticatedAuthStateImpl _value,
      $Res Function(_$AuthenticatedAuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthenticatedAuthStateImpl(
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

class _$AuthenticatedAuthStateImpl extends _AuthenticatedAuthState {
  const _$AuthenticatedAuthStateImpl({required this.user}) : super._();

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatedAuthStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatedAuthStateImplCopyWith<_$AuthenticatedAuthStateImpl>
      get copyWith => __$$AuthenticatedAuthStateImplCopyWithImpl<
          _$AuthenticatedAuthStateImpl>(this, _$identity);

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
      _$AuthenticatedAuthStateImpl;
  const _AuthenticatedAuthState._() : super._();

  User get user;
  @JsonKey(ignore: true)
  _$$AuthenticatedAuthStateImplCopyWith<_$AuthenticatedAuthStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotAuthenticatedAuthStateImplCopyWith<$Res> {
  factory _$$NotAuthenticatedAuthStateImplCopyWith(
          _$NotAuthenticatedAuthStateImpl value,
          $Res Function(_$NotAuthenticatedAuthStateImpl) then) =
      __$$NotAuthenticatedAuthStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotAuthenticatedAuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$NotAuthenticatedAuthStateImpl>
    implements _$$NotAuthenticatedAuthStateImplCopyWith<$Res> {
  __$$NotAuthenticatedAuthStateImplCopyWithImpl(
      _$NotAuthenticatedAuthStateImpl _value,
      $Res Function(_$NotAuthenticatedAuthStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotAuthenticatedAuthStateImpl extends _NotAuthenticatedAuthState {
  const _$NotAuthenticatedAuthStateImpl() : super._();

  @override
  String toString() {
    return 'AuthState.notAuthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotAuthenticatedAuthStateImpl);
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
  const factory _NotAuthenticatedAuthState() = _$NotAuthenticatedAuthStateImpl;
  const _NotAuthenticatedAuthState._() : super._();
}
