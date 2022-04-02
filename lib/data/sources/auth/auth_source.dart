
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleapis_auth/googleapis_auth.dart';

abstract class AuthSource{

  Future<bool> isAuthenticated();
  Future<void> signInSilently();
  Future<void> signIn();
  Future<void> signOut();
  User? getUser();
  Stream<User?> userChanges();
  Future<AuthClient?> getClient();

}