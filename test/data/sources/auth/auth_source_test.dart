
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:money_tracker/data/sources/auth/auth_source.dart';
import 'package:money_tracker/data/sources/auth/auth_source_impl.dart';

import 'auth_source_test.mocks.dart';

@GenerateMocks([GoogleSignIn, FirebaseAuth])
void main(){

  late AuthSource authSource;
  late MockGoogleSignIn googleSignIn;
  late MockFirebaseAuth firebaseAuth;

  setUp((){
    googleSignIn = MockGoogleSignIn();
    firebaseAuth = MockFirebaseAuth();
    authSource = GoogleAuth(googleSignIn, firebaseAuth);
  });

  test('should return false when not authentificated ', () async {

    when(googleSignIn.currentUser).thenReturn(null);
    when(googleSignIn.isSignedIn()).thenAnswer((_) async => false);

    final result = await authSource.isAuthenticated();

    expect(result, false);

  });

  // test('should return true when is authentificated ', () async {
  //
  //   when(googleSignIn.currentUser).thenReturn(GoogleSignInAccount);
  //   when(googleSignIn.isSignedIn()).thenAnswer((_) async => true);
  //
  //   final result = await authSource.isAuthenticated();
  //
  //   expect(result, true);
  //
  // });

}