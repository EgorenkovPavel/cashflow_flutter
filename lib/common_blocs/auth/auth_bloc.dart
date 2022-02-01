import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:money_tracker/common_blocs/internet_connection_bloc.dart';
import 'package:money_tracker/data/auth_source.dart';
import 'package:money_tracker/domain/models/user.dart';

abstract class AuthEvent {}

class Init extends AuthEvent {}

class ChangeAuth extends AuthEvent {
  final bool authenticated;

  ChangeAuth(this.authenticated);
}

class SignInSilently extends AuthEvent {}

class SignIn extends AuthEvent {}

class SignOut extends AuthEvent {}

abstract class AuthState extends Equatable {}

class InProgress extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  final User user;
  final AuthClient client;

  Authenticated({
    required this.user,
    required this.client,
  });

  @override
  List<Object?> get props => [user, client];
}

class NotAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final InternetConnectionBloc _connectionBloc;
  final AuthSource _authSource;

  StreamSubscription? _sub;

  AuthBloc(
    this._authSource,
    this._connectionBloc,
  ) : super(InProgress()) {
    on<Init>(_init);
    on<ChangeAuth>(_changeAuth);
    on<SignInSilently>(_signInSilently);
    on<SignIn>(_signIn);
    on<SignOut>(_signOut);
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }

  void _init(Init event, Emitter<AuthState> emit) {
    _sub = _authSource.userChanges().listen((user) {
      add(ChangeAuth(user != null));
    });
    add(SignInSilently());
  }

  Future<void> _changeAuth(ChangeAuth event, Emitter<AuthState> emit) async {
    if (event.authenticated) {
      var user = await _authSource.getUser();
      var client = await _authSource.getClient();
      emit(Authenticated(user: user!, client: client!));
    } else {
      emit(NotAuthenticated());
    }
  }

  void _signInSilently(SignInSilently event, Emitter<AuthState> emit) {
    _authSource.signInSilently();
  }

  Future<void> _signIn(SignIn event, Emitter<AuthState> emit) async {
    emit(InProgress());
    await _authSource.signIn();
  }

  Future<void> _signOut(SignOut event, Emitter<AuthState> emit) async {
    emit(InProgress());
    await _authSource.signOut();
  }
}
