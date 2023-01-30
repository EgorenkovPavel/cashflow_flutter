
import '../models/user.dart';
import 'package:googleapis_auth/googleapis_auth.dart';

abstract class AuthRepository{

  Future<bool> isAuthenticated();
  Future<void> signInSilently();
  Future<void> signIn();
  Future<void> signOut();
  User? getUser();
  Stream<User?> userChanges();
  Future<AuthClient?> getClient();
  Stream<bool> isConnectedToInternet();

}