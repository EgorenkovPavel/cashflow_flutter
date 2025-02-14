import 'package:drift/drift.dart';

import 'database.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<Database> with _$UserDaoMixin {
  UserDao(super.attachedDatabase);

  Future<List<UserDB>> getAllUsers() => select(users).get();

  Stream<List<UserDB>> watchAllUsers() => select(users).watch();

  Future<UserDB?> getById(int id) =>
      (select(users)..where((c) => c.id.equals(id))).getSingleOrNull();

  Future<UserDB?> getByGoogleId(String googleId) =>
      (select(users)..where((c) => c.googleId.equals(googleId))).getSingleOrNull();

  Future<int> insert(UsersCompanion entity) =>
      into(users).insert(entity);
}
