import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:money_tracker/data/auth_repository.dart';
import 'package:money_tracker/internet_connection_bloc.dart';

class AuthState {
  final bool isAuthenticated;
  final String userId;
  final bool inProgress;
  final AuthClient? client;

  AuthState({
    required this.isAuthenticated,
    this.userId = '',
    required this.inProgress,
    this.client,
  });

  factory AuthState.inProgress() => AuthState(
        isAuthenticated: false,
        inProgress: true,
      );

  factory AuthState.authenticated({
    required String userId,
    required AuthClient client,
  }) =>
      AuthState(
        inProgress: false,
        isAuthenticated: true,
        userId: userId,
        client: client,
      );

  factory AuthState.notAuthenticated() => AuthState(
        isAuthenticated: false,
        inProgress: false,
      );
}

class AuthBloc extends Cubit<AuthState> {
  final InternetConnectionBloc _connectionBloc;
  final AuthRepository _repository;

  StreamSubscription? _sub;

  AuthBloc({
    required AuthRepository repository,
    required InternetConnectionBloc connectionBloc,
  })  : _repository = repository,
        _connectionBloc = connectionBloc,
        super(AuthState.inProgress()) {

    _sub = _connectionBloc.stream.listen((event) {
      if (event.isConnectedToInternet){
        _signInSilently();
      }
    });
  }

  Future<void> _signInSilently() async {
    await _repository.signInSilently();
    await _checkAuth();
  }

  Future<void> _checkAuth() async {
    var isAuthed = await _repository.isAuthenticated();
    if (isAuthed) {
      var userId = await _repository.getUserId();
      var client = await _repository.getClient();
      emit(AuthState.authenticated(userId: userId!, client: client!));
    } else {
      emit(AuthState.notAuthenticated());
    }
  }

  Future<void> signIn() async {
    emit(AuthState.inProgress());
    try {
      await _repository.signIn();
    } finally {
      await _checkAuth();
    }
  }

  Future<void> signOut() async {
    emit(AuthState.inProgress());
    try {
      await _repository.signOut();
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
