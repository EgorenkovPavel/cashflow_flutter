import 'package:bloc_test/bloc_test.dart';
import 'package:googleapis_auth/src/auth_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/data/auth_source.dart';
import 'package:money_tracker/domain/models/user.dart';
import 'package:money_tracker/common_blocs/internet_connection_bloc.dart';
import 'package:test/test.dart';

// void main() {
//   group('AuthBloc', () {
//     // late AuthBloc authBloc;
//
//     // setUp(() {
//     //   authBloc = AuthBloc(authSource: AuthStub(), connectionBloc: InternetConnectionBloc());
//     // });
//
//     blocTest(
//       'when already signIn try signIn, internet switch on',
//       build: () => getAuthBloc(isAlreadySigned: true, internet: true),
//       act: (AuthBloc bloc) => bloc.signIn(),
//       expect: () => [
//         InProgress(),
//         Authenticated(user: getTestUser(), client: authClient),
//       ],
//     );
//
//     blocTest(
//       'when already signIn try signIn, internet switch off',
//       build: () => getAuthBloc(isAlreadySigned: true, internet: false),
//       act: (AuthBloc bloc) => bloc.signIn(),
//       expect: () => [
//         InProgress(),
//         Disconnected(),
//       ],
//     );
//
//     blocTest(
//       'when not already signIn try signIn, internet switch on',
//       build: () => getAuthBloc(isAlreadySigned: false, internet: true),
//       act: (AuthBloc bloc) => bloc.signIn(),
//       expect: () => [
//         InProgress(),
//         NotAuthenticated(),
//         Authenticated(user: getTestUser(), client: authClient),
//       ],
//     );
//
//     blocTest(
//       'when not already signIn try signIn, internet switch off',
//       build: () => getAuthBloc(isAlreadySigned: false, internet: false),
//       act: (AuthBloc bloc) => bloc.signIn(),
//       expect: () => [
//         InProgress(),
//         Disconnected(),
//       ],
//     );
//
//     blocTest(
//         'when already signIn try signOut, internet switch on',
//       build: () => getAuthBloc(isAlreadySigned: true, internet: true),
//       act: (AuthBloc bloc) => bloc.signOut(),
//       expect: () => [
//         InProgress(),
//         Authenticated(user: getTestUser(), client: authClient),
//         NotAuthenticated(),
//       ],
//     );
//
//     blocTest(
//       'when already signIn try signOut, internet switch off',
//       build: () => getAuthBloc(isAlreadySigned: true, internet: false),
//       act: (AuthBloc bloc) => bloc.signOut(),
//       expect: () => [
//         InProgress(),
//         Disconnected(),
//       ],
//     );
//
//   });
// }
//
// AuthBloc getAuthBloc({required bool isAlreadySigned, required bool internet}){
//   final conBloc = MockConnectionBloc();
//   when(() => conBloc.stream).thenAnswer((_) =>
//       Stream.value(InternetConnectionState(isConnected: internet)));
//   return AuthBloc(authSource: AuthStub(isAlreadySigned), connectionBloc: conBloc);
// }
//
// User getTestUser() => User(id: '1', name: 'Vasya', photo: '', isAdmin: true);
//
// final authClient = MockAuthClient();
//
// class MockConnectionBloc extends Mock implements InternetConnectionBloc {}
//
// class MockAuthClient extends Mock implements AuthClient {}
//
// class AuthStub extends AuthSource {
//   bool signedIn = false;
//   final bool isAlreadySigned;
//
//   AuthStub(this.isAlreadySigned);
//
//   @override
//   Future<AuthClient?> getClient() async {
//     if (signedIn) {
//       return authClient;
//     } else {
//       return null;
//     }
//   }
//
//   @override
//   Future<User?> getUser() async {
//     if (signedIn) {
//       return getTestUser();
//     } else {
//       return null;
//     }
//   }
//
//   @override
//   Future<bool> isAuthenticated() async {
//     return signedIn;
//   }
//
//   @override
//   Future<void> signIn() async {
//     await Future.delayed(Duration(seconds: 1));
//     signedIn = true;
//   }
//
//   @override
//   Future<void> signInSilently() async {
//     await Future.delayed(Duration(milliseconds: 500));
//     signedIn = isAlreadySigned;
//   }
//
//   @override
//   Future<void> signOut() async {
//     await Future.delayed(Duration(seconds: 1));
//     signedIn = false;
//   }
// }
