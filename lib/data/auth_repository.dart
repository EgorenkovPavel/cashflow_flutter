import 'package:google_sign_in/google_sign_in.dart';

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

  Future<String?> getUserId() async {
    return _googleSignIn.currentUser?.id;
  }

  Future<Map<String, String>?> getHeaders() async {
    final authHeaders = await _googleSignIn.currentUser?.authHeaders;

    if (authHeaders == null) {
      return null;
    } else {
      return authHeaders;
    }
  }
}
