import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:money_tracker/data/auth_source.dart';
import 'package:money_tracker/domain/models/user.dart';
import 'package:money_tracker/common_blocs/internet_connection_bloc.dart';

abstract class AuthState extends Equatable{}

class AuthStateInProgress extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthStateAuthenticated extends AuthState {
  final User user;
  final AuthClient client;

  AuthStateAuthenticated({
    required this.user,
    required this.client,
  });

  @override
  List<Object?> get props => [user, client];
}

class AuthStateNotAuthenticated extends AuthState{
  @override
  List<Object?> get props => [];
}

class AuthStateDisconnected extends AuthState{
  @override
  List<Object?> get props => [];
}

class AuthBloc extends Cubit<AuthState> {
  final InternetConnectionBloc _connectionBloc;
  final AuthSource _authSource;

  StreamSubscription? _sub;

  bool isConnectedToInternet = false;

  AuthBloc({
    required AuthSource authSource,
    required InternetConnectionBloc connectionBloc,
  })  : _authSource = authSource,
        _connectionBloc = connectionBloc,
        super(AuthStateInProgress()) {
    _sub = _connectionBloc.stream.listen((event) {
      isConnectedToInternet = event.isConnectedToInternet;
      if (event.isConnectedToInternet) {
        _signInSilently();
      } else {
        _checkAuth();
      }
    });
  }

  Future<void> _signInSilently() async {
    await _authSource.signInSilently();
    await _checkAuth();
  }

  Future<void> _checkAuth() async {
    if (!isConnectedToInternet) {
      emit(AuthStateDisconnected());
      return;
    }
    var isAuthed = await _authSource.isAuthenticated();
    if (isAuthed) {
      var user = await _authSource.getUser();
      var client = await _authSource.getClient();
      emit(AuthStateAuthenticated(user: user!, client: client!));
    } else {
      emit(AuthStateNotAuthenticated());
    }
  }

  Future<void> signIn() async {
    emit(AuthStateInProgress());
    try {
      await _authSource.signIn();
    } finally {
      await _checkAuth();
    }
  }

  Future<void> signOut() async {
    emit(AuthStateInProgress());
    try {
      await _authSource.signOut();
    } finally {
      await _checkAuth();
    }
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
