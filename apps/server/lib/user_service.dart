import 'package:cashflow_server/data/database.dart';
import 'package:cashflow_server/data_repository.dart';
import 'package:cashflow_server/firebase_service.dart';
import 'package:cashflow_server/models/user.dart';
import 'package:drift/drift.dart';

class UserService {
  UserService({required DataRepository dataRepository})
      : _dataRepository = dataRepository;

  final DataRepository _dataRepository;

  Future<User?> register(String idToken) async {
    final googleUser = await _verify(idToken);
    if (googleUser == null) {
      return null;
    }

    final user = await _dataRepository.getUserByGoogleId(googleUser.id);
    if (user != null) {
      return user;
    }

    return _dataRepository.createUser(googleUser.toDBO());
  }

  Future<User?> find(String idToken) async {
    final googleUser = await _verify(idToken);
    if (googleUser == null) {
      return null;
    }
    return _dataRepository.getUserByGoogleId(googleUser.id);
  }

  Future<GoogleUser?> _verify(String idToken) async {
    final decodedToken = await auth.verifyIdToken(idToken);
    return GoogleUser(
      id: decodedToken.claims.subject,
      name: decodedToken.claims.name ?? '',
      email: decodedToken.claims.email ?? '',
      photo: decodedToken.claims.picture?.toString() ?? '',
    );
  }
}

class GoogleUser {
  GoogleUser(
      {required this.id,
        required this.name,
        required this.email,
        required this.photo});

  final String id;
  final String name;
  final String email;
  final String photo;

  UsersCompanion toDBO() => UsersCompanion(
    name: Value(name),
    googleId: Value(id),
    photo: Value(photo),
    email: Value(email),
  );
}