import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:money_tracker/domain/interfaces/auth_repository.dart';
import 'package:money_tracker/domain/models/user.dart';

abstract class AuthEvent extends Equatable {}

class _ChangeAuth extends AuthEvent {
  final bool authenticated;

  _ChangeAuth(this.authenticated);

  @override
  List<Object?> get props => [authenticated];
}

class SignInSilently extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class SignIn extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class SignOut extends AuthEvent {
  @override
  List<Object?> get props => [];
}

abstract class AuthState extends Equatable {
  const AuthState();
}

class Authenticated extends AuthState {
  final User user;

  const Authenticated({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}

class NotAuthenticated extends AuthState {
  const NotAuthenticated();

  @override
  List<Object?> get props => [];
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  StreamSubscription? _sub;
  StreamSubscription? _subInternet;

  AuthBloc(
    this._authRepository,
  ) : super(const NotAuthenticated()) {
    on<_ChangeAuth>(_changeAuth);
    on<SignInSilently>(_signInSilently);
    on<SignIn>(_signIn);
    on<SignOut>(_signOut);

    _sub = _authRepository.userChanges().listen((user) {
      add(_ChangeAuth(user != null));
    });
    _subInternet = _authRepository.isConnectedToInternet().listen((connected) {
      if (connected) {
        add(SignInSilently());
      } else {
        add(_ChangeAuth(false));
      }
    });
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    _subInternet?.cancel();

    return super.close();
  }

  Future<void> _changeAuth(_ChangeAuth event, Emitter<AuthState> emit) async {
    var user = _authRepository.getUser();

    if (event.authenticated && user != null) {
      emit(Authenticated(
        user: user,
      ));
    } else {
      emit(const NotAuthenticated());
    }
  }

  Future<void> _signInSilently(
    SignInSilently event,
    Emitter<AuthState> emit,
  ) async =>
      await _authRepository.signInSilently();

  Future<void> _signIn(
    SignIn event,
    Emitter<AuthState> emit,
  ) async =>
      await _authRepository.signIn();

  Future<void> _signOut(
    SignOut event,
    Emitter<AuthState> emit,
  ) async =>
      await _authRepository.signOut();
}
