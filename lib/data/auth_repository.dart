import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:money_tracker/domain/models/user.dart';

class AuthRepository {
  late final GoogleSignIn _googleSignIn;

  AuthRepository() {
    _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/drive',
      ],
    );
  }

  Future<bool> isAuthenticated() async {
    final currentUser = _googleSignIn.currentUser;
    var isSignIn = await _googleSignIn.isSignedIn();
    return currentUser != null && isSignIn;
  }

  Future<void> signInSilently() async {
    var isAuth = await isAuthenticated();
    if (!isAuth) {
      await _googleSignIn.signInSilently();
    }
  }

  Future<void> signIn() async {
    var isAuth = await isAuthenticated();
    if (!isAuth) {
      await _googleSignIn.signIn();
    }
  }

  Future<void> signOut() async {
    var isAuth = await isAuthenticated();
    if (isAuth) {
      await _googleSignIn.signOut();
    }
  }

  Future<User?> getUser() async {
    if (_googleSignIn.currentUser == null) {
      return null;
    }

    return User(
      id: _googleSignIn.currentUser!.id,
      name: _googleSignIn.currentUser!.displayName ?? '',
      photo: _googleSignIn.currentUser!.photoUrl ?? '',
    );
  }

  Future<AuthClient?> getClient() {
    return _googleSignIn.authenticatedClient();
  }
}
