import '../models/user.dart';

/// Repository for managing users.
abstract class UserRepository {
  /// Get a user by Google ID.
  Future<User?> getUserByGoogleId(String googleId);

  /// Insert a new user and return its id.
  Future<int> insertUser(User user);

  /// Get all users.
  Future<List<User>> getAllUsers();
}

