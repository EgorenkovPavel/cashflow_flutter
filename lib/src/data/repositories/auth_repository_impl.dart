import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleapis_auth/src/auth_client.dart';
import 'package:money_tracker/src/data/interfaces/auth_source.dart';
import 'package:money_tracker/src/domain/interfaces/auth_repository.dart';
import 'package:money_tracker/src/domain/models/user.dart' as model;

import '../interfaces/network_info.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthSource _authSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl({
    required AuthSource authSource,
    required NetworkInfo networkInfo,
  })  : _authSource = authSource,
        _networkInfo = networkInfo;

  @override
  Future<AuthClient?> getClient() => _authSource.getClient();

  @override
  model.User? getUser() => _mapUser(_authSource.getUser());

  @override
  Future<bool> isAuthenticated() => _authSource.isAuthenticated();

  @override
  Future<void> signIn() => _authSource.signIn();

  @override
  Future<void> signInSilently() => _authSource.signInSilently();

  @override
  Future<void> signOut() => _authSource.signOut();

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