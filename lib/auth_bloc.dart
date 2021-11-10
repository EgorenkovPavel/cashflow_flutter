import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:money_tracker/data/auth_source.dart';
import 'package:money_tracker/domain/models/user.dart';
import 'package:money_tracker/internet_connection_bloc.dart';

class AuthState extends Equatable {
  final bool isAuthenticated;
  final bool isConnectedToInternet;
  final User? user;
  final bool inProgress;
  final AuthClient? client;

  AuthState({
    required this.isAuthenticated,
    this.user,
    required this.inProgress,
    this.client,
    required this.isConnectedToInternet,
  });

  factory AuthState.inProgress() => AuthState(
        isAuthenticated: false,
        isConnectedToInternet: false,
        inProgress: true,
      );

  factory AuthState.authenticated({
    required User user,
    required AuthClient client,
  }) =>
      AuthState(
        inProgress: false,
        isAuthenticated: true,
        isConnectedToInternet: true,
        user: user,
        client: client,
      );

  factory AuthState.notAuthenticated() => AuthState(
        isAuthenticated: false,
        isConnectedToInternet: true,
        inProgress: false,
      );

  factory AuthState.disconnected() => AuthState(
        isAuthenticated: false,
        isConnectedToInternet: false,
        inProgress: false,
      );

  @override
  List<Object?> get props =>
      [isAuthenticated, isConnectedToInternet, user, inProgress, client];
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
        super(AuthState.inProgress()) {
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
      emit(AuthState.disconnected());
      return;
    }
    var isAuthed = await _authSource.isAuthenticated();
    if (isAuthed) {
      var user = await _authSource.getUser();
      var client = await _authSource.getClient();
      emit(AuthState.authenticated(user: user!, client: client!));
    } else {
      emit(AuthState.notAuthenticated());
    }
  }

  Future<void> signIn() async {
    emit(AuthState.inProgress());
    try {
      await _authSource.signIn();
    } finally {
      await _checkAuth();
    }
  }

  Future<void> signOut() async {
    emit(AuthState.inProgress());
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
