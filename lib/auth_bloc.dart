import 'package:bloc/bloc.dart';
import 'package:money_tracker/data/auth_repository.dart';

class AuthState {
  final bool isAuthenticated;
  final String userId;
  final bool inProgress;
  final Map<String, String> headers;

  AuthState({
    required this.isAuthenticated,
    this.userId = '',
    required this.inProgress,
    this.headers = const {},
  });

  factory AuthState.inProgress() => AuthState(
        isAuthenticated: false,
        inProgress: true,
      );

  factory AuthState.authenticated({
    required String userId,
    required Map<String, String> headers,
  }) =>
      AuthState(
        inProgress: false,
        isAuthenticated: true,
        userId: userId,
        headers: headers,
      );

  factory AuthState.notAuthenticated() => AuthState(
        isAuthenticated: false,
        inProgress: false,
      );
}

class AuthBloc extends Cubit<AuthState> {
  final AuthRepository _repository;

  AuthBloc(AuthRepository repository)
      : _repository = repository,
        super(AuthState.inProgress()) {
    _init();
  }

  Future<void> _init() async {
    await _repository.signInSilently();
    await _checkAuth();
  }

  Future<void> _checkAuth() async {
    var isAuthed = await _repository.isAuthenticated();
    if (isAuthed) {
      var userId = await _repository.getUserId();
      var headers = await _repository.getHeaders();
      emit(AuthState.authenticated(userId: userId!, headers: headers!));
    } else {
      emit(AuthState.notAuthenticated());
    }
  }

  Future<void> signIn() async {
    emit(AuthState.inProgress());
    try {
      await _repository.signIn();
      await _checkAuth();
    } catch (e) {}
  }

  Future<void> signOut() async {
    emit(AuthState.inProgress());
    try {
      await _repository.signOut();
      await _checkAuth();
    } catch (e) {}
  }
}
