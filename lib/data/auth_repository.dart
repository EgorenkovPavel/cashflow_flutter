import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:money_tracker/domain/models/user.dart' as model;

class AuthRepository {
  late final GoogleSignIn _googleSignIn;
  final auth = FirebaseAuth.instance;

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
      final GoogleSignInAccount? googleUser = await _googleSignIn.signInSilently();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await auth.signInWithCredential(credential);
    }
  }

  Future<void> signIn() async {
    var isAuth = await isAuthenticated();
    if (!isAuth) {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await auth.signInWithCredential(credential);
    }
  }

  Future<void> signOut() async {
    var isAuth = await isAuthenticated();
    if (isAuth) {
      await _googleSignIn.signOut();
      await auth.signOut();
    }
  }

  Future<model.User?> getUser() async {
    if (_googleSignIn.currentUser == null) {
      return null;
    }

    return model.User(
      id: auth.currentUser!.uid,
      name: auth.currentUser!.displayName ?? '',
      photo: auth.currentUser!.photoURL ?? '',
    );
  }

  Future<AuthClient?> getClient() {
    return _googleSignIn.authenticatedClient();
  }
}
