import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:money_tracker/data/auth_repository.dart';
import 'package:money_tracker/domain/models/user.dart';
import 'package:money_tracker/internet_connection_bloc.dart';

class AuthState {
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
}

class AuthBloc extends Cubit<AuthState> {
  final InternetConnectionBloc _connectionBloc;
  final AuthRepository _authRepository;

  StreamSubscription? _sub;

  bool isConnectedToInternet = false;

  AuthBloc({
    required AuthRepository repository,
    required InternetConnectionBloc connectionBloc,
  })  : _authRepository = repository,
        _connectionBloc = connectionBloc,
        super(AuthState.inProgress()) {

    _sub = _connectionBloc.stream.listen((event) {
      isConnectedToInternet = event.isConnectedToInternet;
      if (event.isConnectedToInternet){
        _signInSilently();
      }else{
        _checkAuth();
      }
    });
  }

  Future<void> _signInSilently() async {
    await _authRepository.signInSilently();
    await _checkAuth();
  }

  Future<void> _checkAuth() async {
    if (!isConnectedToInternet){
      emit(AuthState.disconnected());
      return;
    }
    var isAuthed = await _authRepository.isAuthenticated();
    if (isAuthed) {
      var user = await _authRepository.getUser();
      var client = await _authRepository.getClient();
      emit(AuthState.authenticated(user: user!, client: client!));
    } else {
      emit(AuthState.notAuthenticated());
    }
  }

  Future<void> signIn() async {
    emit(AuthState.inProgress());
    try {
      await _authRepository.signIn();
    } finally {
      await _checkAuth();
    }
  }

  Future<void> signOut() async {
    emit(AuthState.inProgress());
    try {
      await _authRepository.signOut();
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
