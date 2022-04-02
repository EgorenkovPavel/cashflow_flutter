import 'package:money_tracker/utils/try.dart';

import '../models/user.dart';
import 'package:googleapis_auth/googleapis_auth.dart';

abstract class AuthRepository{

  Future<bool> isAuthenticated();
  Future<Try<void>> signInSilently();
  Future<Try<void>> signIn();
  Future<Try<void>> signOut();
  User? getUser();
  Stream<User?> userChanges();
  Future<AuthClient?> getClient();

}