import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:money_tracker/domain/interfaces/auth_repository.dart';
import 'package:money_tracker/domain/interfaces/sync_repository.dart';
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
  final bool isAdmin;

  const AuthState({required this.isAdmin});
}

class Authenticated extends AuthState {
  final User user;

  const Authenticated({
    required bool isAdmin,
    required this.user,
  }) : super(isAdmin: isAdmin);

  @override
  List<Object?> get props => [user];
}

class NotAuthenticated extends AuthState {
  const NotAuthenticated() : super(isAdmin: false);

  @override
  List<Object?> get props => [];
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final SyncRepository _syncRepository;

  StreamSubscription? _sub;
  StreamSubscription? _subInternet;

  AuthBloc(
    this._authRepository,
    this._syncRepository,
  ) : super(const NotAuthenticated()) {
    on<_ChangeAuth>(_changeAuth);
    on<SignInSilently>(_signInSilently);
    on<SignIn>(_signIn);
    on<SignOut>(_signOut);

    _sub = _authRepository.userChanges().listen((user) {
      add(_ChangeAuth(user != null));
    });
    _subInternet = _syncRepository.connectedToInternet().listen((connected) {
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

    if (user != null) {
      var isAdmin = await _syncRepository.isAdmin(user);
      isAdmin.fold(
        (success) => emit(Authenticated(
          isAdmin: success,
          user: user,
        )),
        (failure) => emit(const NotAuthenticated()),
      );
    } else {
      emit(const NotAuthenticated());
    }
  }

  Future<void> _signInSilently(
    SignInSilently event,
    Emitter<AuthState> emit,
  ) async {
    await _authRepository.signInSilently();
  }

  Future<void> _signIn(
    SignIn event,
    Emitter<AuthState> emit,
  ) async {
    await _authRepository.signIn();
  }

  Future<void> _signOut(
    SignOut event,
    Emitter<AuthState> emit,
  ) async {
    await _authRepository.signOut();
  }
}
