import 'package:drift/drift.dart';

import '../../domain/interfaces/user_repository.dart';
import '../../domain/models/user.dart';
import '../sources/local/data/user_dao.dart';
import '../sources/local/db_mapper.dart';
import '../sources/local/data/database.dart';

/// Implementation of [UserRepository] using [UserDao] and [UserMapper].
class UserRepositoryImpl implements UserRepository {
  final UserDao _userDao;

  UserRepositoryImpl(this._userDao);

  @override
  Future<User?> getByGoogleId(String googleId) async {
    if (googleId.isEmpty) {
      return null;
    }
    final user = await _userDao.getByGoogleId(googleId);
    return user == null ? null : UserMapper().toModel(user);
  }

  @override
  Future<int> insert(User user) {
    return _userDao.insert(UsersCompanion(
      googleId: Value(user.googleId),
      name: Value(user.name),
      photo: Value(user.photo),
    ));
  }

  @override
  Future<List<User>> getAll() async {
    final users = await _userDao.getAllUsers();
    return UserMapper().listToModel(users);
  }
}

