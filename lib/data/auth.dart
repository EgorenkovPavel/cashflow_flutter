import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  late final GoogleSignIn _googleSignIn;

  UserRepository() {
    _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/drive',
      ],
    );
  }

  Future<bool> isAuthenticated() async {
    final currentUser = _googleSignIn.currentUser;
    return currentUser != null;
  }

  Future<void> authenticate() async {
    var isAuth = await isAuthenticated();
    if (!isAuth) {
      await _googleSignIn.signIn();
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
