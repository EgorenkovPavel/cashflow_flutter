import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:money_tracker/data/sources/auth_source.dart';
import 'package:money_tracker/domain/models/user.dart' as model;

class GoogleAuth extends AuthSource{
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;

  GoogleAuth(this._googleSignIn, this._firebaseAuth);

  @override
  Stream<model.User?> userChanges(){
    return _firebaseAuth.authStateChanges().map((user) => _mapUser(user));
  }

  @override
  Future<bool> isAuthenticated() async {
    final currentUser = _googleSignIn.currentUser;
    var isSignIn = await _googleSignIn.isSignedIn();

    return currentUser != null && isSignIn;
  }

  @override
  Future<void> signInSilently() async {
    var isAuth = await isAuthenticated();
    if (!isAuth) {
      final googleUser = await _googleSignIn.signInSilently();
      final googleAuth = await googleUser?.authentication;

      if(googleUser == null || googleAuth == null){
        return;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _firebaseAuth.signInWithCredential(credential);
    }
  }

  @override
  Future<void> signIn() async {
    var isAuth = await isAuthenticated();
    if (!isAuth) {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential = await _firebaseAuth.signInWithCredential(credential);
    }
  }

  @override
  Future<void> signOut() async {
    var isAuth = await isAuthenticated();
    if (isAuth) {
      final res = await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
    }
  }

  @override
  Future<model.User?> getUser() async {
     return _mapUser(_firebaseAuth.currentUser);
  }

  model.User? _mapUser(User? user){
    if (user == null){
      return null;
    }

    return model.User(
      id: user.uid,
      name: user.displayName ?? '',
      photo: user.photoURL ?? '',
    );
  }

  @override
  Future<AuthClient?> getClient() {
    return _googleSignIn.authenticatedClient();
  }
}
