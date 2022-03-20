import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:money_tracker/data/sources/auth_source.dart';
import 'package:money_tracker/domain/interfaces/sync_repository.dart';
import 'package:money_tracker/domain/models/user.dart';

abstract class AuthEvent extends Equatable{}

class Init extends AuthEvent {
  @override
  List<Object?> get props => [];
}

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

class InProgress extends AuthState {
  const InProgress() : super(isAdmin: false);

  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  final User user;
  final AuthClient client;

  const Authenticated({
    required bool isAdmin,
    required this.user,
    required this.client,
  }) : super(isAdmin: isAdmin);

  @override
  List<Object?> get props => [user, client];
}

class NotAuthenticated extends AuthState {
  const NotAuthenticated() : super(isAdmin: false);

  @override
  List<Object?> get props => [];
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthSource _authSource;
  final SyncRepository _syncRepo;

  StreamSubscription? _sub;
  StreamSubscription? _subInternet;

  AuthBloc(
    this._authSource,
    this._syncRepo,
  ) : super(const InProgress()) {
    on<Init>(_init);
    on<_ChangeAuth>(_changeAuth);
    on<SignInSilently>(_signInSilently);
    on<SignIn>(_signIn);
    on<SignOut>(_signOut);
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    _subInternet?.cancel();
    return super.close();
  }

  void _init(Init event, Emitter<AuthState> emit) {
    _sub = _authSource.userChanges().listen((user) {
      add(_ChangeAuth(user != null));
    });
    _subInternet = _syncRepo.connectedToInternet().listen((connected) {
      if (connected) {
        add(SignInSilently());
      } else {
        add(_ChangeAuth(false));
      }
    });
    add(SignInSilently());
  }

  Future<void> _changeAuth(_ChangeAuth event, Emitter<AuthState> emit) async {
    if (event.authenticated) {
      var user = await _authSource.getUser();
      var client = await _authSource.getClient();
      if (client == null) {
        emit(const NotAuthenticated());
      } else {
        var isAdmin = await _syncRepo.isAdmin(user!);
        emit(Authenticated(isAdmin: isAdmin, user: user, client: client));
      }
    } else {
      emit(const NotAuthenticated());
    }
  }

  Future<void> _signInSilently(
      SignInSilently event, Emitter<AuthState> emit) async {
    emit(const InProgress());
    await _authSource.signInSilently();
  }

  Future<void> _signIn(SignIn event, Emitter<AuthState> emit) async {
    emit(const InProgress());
    await _authSource.signIn();
  }

  Future<void> _signOut(SignOut event, Emitter<AuthState> emit) async {
    emit(const InProgress());
    await _authSource.signOut();
  }
}
