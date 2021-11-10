
import 'package:money_tracker/domain/models/user.dart';
import 'package:googleapis_auth/googleapis_auth.dart';

abstract class AuthSource{

  Future<bool> isAuthenticated();
  Future<void> signInSilently();
  Future<void> signIn();
  Future<void> signOut();
  Future<User?> getUser();
  Future<AuthClient?> getClient();

}