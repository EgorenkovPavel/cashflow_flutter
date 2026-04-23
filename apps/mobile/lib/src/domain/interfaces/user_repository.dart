import '../models/user.dart';

abstract interface class UserRepository {

  Future<User?> getByGoogleId(String googleId);

  Future<int> insert(User user);

  Future<List<User>> getAll();
}

