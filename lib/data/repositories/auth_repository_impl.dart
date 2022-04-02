import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleapis_auth/src/auth_client.dart';
import 'package:money_tracker/data/sources/auth/auth_source.dart';
import 'package:money_tracker/domain/interfaces/auth_repository.dart';
import 'package:money_tracker/domain/models/user.dart' as model;
import 'package:money_tracker/utils/exceptions.dart';
import 'package:money_tracker/utils/try.dart';

import '../sources/network_info.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthSource _authSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl(this._authSource, this._networkInfo);

  @override
  Future<AuthClient?> getClient() => _authSource.getClient();

  @override
  model.User? getUser() => _mapUser(_authSource.getUser());

  @override
  Future<bool> isAuthenticated() => _authSource.isAuthenticated();

  @override
  Future<Try<void>> signIn() async {
    try {
      await _authSource.signIn();

      return Success(true);
    } on AuthException {
      return AuthFailure();
    }
  }

  @override
  Future<Try<void>> signInSilently() async {
    try {
      await _authSource.signInSilently();

      return Success(true);
    } on AuthException {
      return AuthFailure();
    }
  }

  @override
  Future<Try<void>> signOut() async {
    try {
      await _authSource.signOut();

      return Success(true);
    } on AuthException {
      return AuthFailure();
    }
  }

  @override
  Stream<model.User?> userChanges() =>
      _authSource.userChanges().map((user) => _mapUser(user));

  model.User? _mapUser(User? user) {
    if (user == null) {
      return null;
    }

    return model.User(
      id: user.uid,
      name: user.displayName ?? '',
      photo: user.photoURL ?? '',
    );
  }

  @override
  Stream<bool> isConnectedToInternet() => _networkInfo.connected();
}
