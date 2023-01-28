import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interfaces/auth_repository.dart';
import 'package:money_tracker/src/domain/models/user.dart';

part 'auth_bloc.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.changeAuth({required User? user}) =
      _ChangeAuthAuthEvent;

  const factory AuthEvent.signInSilently() = _SignInSilentlyAuthEvent;

  const factory AuthEvent.signIn() = _SignInAuthEvent;

  const factory AuthEvent.signOut() = _SignOutAuthEvent;
}

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.authenticated({required User user}) =
      _AuthenticatedAuthState;

  const factory AuthState.notAuthenticated() = _NotAuthenticatedAuthState;

  User? get user => map(
        authenticated: (state) => state.user,
        notAuthenticated: (state) => null,
      );

  bool get isAuthenticated => map(
        authenticated: (state) => true,
        notAuthenticated: (state) => false,
      );
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  StreamSubscription? _sub;
  StreamSubscription? _subInternet;

  AuthBloc(
    this._authRepository,
  ) : super(const AuthState.notAuthenticated()) {
    on<AuthEvent>((event, emitter) => event.map(
          changeAuth: (event) => _changeAuth(event, emitter),
          signInSilently: (event) => _signInSilently(event, emitter),
          signIn: (event) => _signIn(event, emitter),
          signOut: (event) => _signOut(event, emitter),
        ));

    _sub = _authRepository.userChanges().listen((user) {
      add(AuthEvent.changeAuth(user: user));
    });

    _subInternet = _authRepository.isConnectedToInternet().listen((connected) {
      if (connected) {
        add(const AuthEvent.signInSilently());
      } else {
        add(const AuthEvent.changeAuth(user: null));
      }
    });
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    _subInternet?.cancel();

    return super.close();
  }

  Future<void> _changeAuth(
    _ChangeAuthAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    final user = event.user;
    if (user != null) {
      emit(AuthState.authenticated(user: user));
    } else {
      emit(const AuthState.notAuthenticated());
    }
  }

  FutureOr<void> _signInSilently(
    _SignInSilentlyAuthEvent event,
    Emitter<AuthState> emit,
  ) =>
      _authRepository.signInSilently();

  FutureOr<void> _signIn(
    _SignInAuthEvent event,
    Emitter<AuthState> emit,
  ) =>
      _authRepository.signIn();

  FutureOr<void> _signOut(
    _SignOutAuthEvent event,
    Emitter<AuthState> emit,
  ) =>
      _authRepository.signOut();
}
