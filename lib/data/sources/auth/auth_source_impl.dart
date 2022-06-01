import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:money_tracker/data/sources/auth/auth_source.dart';
import 'package:money_tracker/utils/exceptions.dart';

class GoogleAuth extends AuthSource {
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;

  GoogleAuth({
    required GoogleSignIn googleSignIn,
    required FirebaseAuth firebaseAuth,
  })  : _googleSignIn = googleSignIn,
        _firebaseAuth = firebaseAuth;

  @override
  Stream<User?> userChanges() => _firebaseAuth.authStateChanges();

  @override
  Future<bool> isAuthenticated() async {
    final currentUser = _googleSignIn.currentUser;
    var isSignIn = await _googleSignIn.isSignedIn();

    return currentUser != null && isSignIn;
  }

  @override
  Future<void> signInSilently() async {
    var isAuth = await isAuthenticated();

    if (isAuth) {
      return;
    }

    try {
      final googleUser = await _googleSignIn.signInSilently();
      final googleAuth = await googleUser?.authentication;

      if (googleUser == null || googleAuth == null) {
        return;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
    } catch (e) {
      if (kDebugMode) {
        print('ERROR signInSilently ${e.toString()}');
      }
      throw AuthException();
    }
  }

  @override
  Future<void> signIn() async {
    var isAuth = await isAuthenticated();
    if (isAuth) {
      return;
    }
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
    } catch (e) {
      if (kDebugMode) {
        print('ERROR signIn ${e.toString()}');
      }
      throw AuthException();
    }
  }

  @override
  Future<void> signOut() async {
    var isAuth = await isAuthenticated();
    if (!isAuth) {
      return;
    }
    try {
      final res = await _googleSignIn.signOut();
      await _firebaseAuth.signOut();
    } catch (e) {
      if (kDebugMode) {
        print('ERROR signOut ${e.toString()}');
      }
      throw AuthException();
    }
  }

  @override
  User? getUser() => _firebaseAuth.currentUser;

  @override
  Future<AuthClient?> getClient() async {
    return await _googleSignIn.authenticatedClient();
  }
}
