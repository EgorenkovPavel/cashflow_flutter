import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/domain/interfaces/auth_repository.dart';
import 'package:money_tracker/domain/models/user.dart';

part 'auth_bloc.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.changeAuth({required bool isAuthenticated}) =
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
      add(AuthEvent.changeAuth(isAuthenticated: user != null));
    });

    _subInternet = _authRepository.isConnectedToInternet().listen((connected) {
      if (connected) {
        add(AuthEvent.signInSilently());
      } else {
        add(AuthEvent.changeAuth(isAuthenticated: false));
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
    var user = _authRepository.getUser();

    if (event.isAuthenticated && user != null) {
      emit(AuthState.authenticated(user: user));
    } else {
      emit(const AuthState.notAuthenticated());
    }
  }

  Future<void> _signInSilently(
    _SignInSilentlyAuthEvent event,
    Emitter<AuthState> emit,
  ) async =>
      await _authRepository.signInSilently();

  Future<void> _signIn(
    _SignInAuthEvent event,
    Emitter<AuthState> emit,
  ) async =>
      await _authRepository.signIn();

  Future<void> _signOut(
    _SignOutAuthEvent event,
    Emitter<AuthState> emit,
  ) async =>
      await _authRepository.signOut();
}
