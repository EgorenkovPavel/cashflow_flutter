import 'package:cashflow_server/data/database.dart';
import 'package:cashflow_server/data_repository.dart';
import 'package:cashflow_server/models/group.dart';
import 'package:cashflow_server/models/user.dart';
import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';

class DataRepositoryImpl extends DataRepository {
  DataRepositoryImpl(this.database);

  final AppDatabase database;

  @override
  List<Group> getGroups() {
    return [Group(id: '43')]; // TODO
  }

  @override
  Future<User> createUser(UsersCompanion user) async {
    final userDBO = await database.transaction(() async {
      final userGroup = await database.userGroups
          .insertReturning(UserGroupsCompanion.insert());
      return database.users
          .insertReturning(user.copyWith(userGroupId: Value(userGroup.id)));
    });

    return _userFromDBO(userDBO);
  }

  User _userFromDBO(user userDBO) {
    return User(
      id: userDBO.id.toString(),
      name: userDBO.name,
      photo: userDBO.photo,
      googleId: userDBO.googleId,
      email: userDBO.email,
      groupId: userDBO.userGroupId.toString(),
    );
  }

  @override
  Future<List<User>> getAllUsersByGroup(String groupId) async {
    final list = await (database.users.select()
      ..where((r) => r.userGroupId.equals(UuidValue.fromString(groupId))))
        .get();
    return list.map(_userFromDBO).toList();
  }

  @override
  Future<User?> getUserByGoogleId(String googleId) async {
    final userDBO = await (database.users.select()
          ..where((r) => r.googleId.equals(googleId)))
        .getSingleOrNull();
    if (userDBO == null) {
      return null;
    } else {
      return _userFromDBO(userDBO);
    }
  }

  @override
  Future<AccountDTO> createAccount({required String name, required bool isDebt, required String userId, required String groupId}) {
    // TODO: implement createAccount
    throw UnimplementedError();
  }

  @override
  Future<CategoryDTO> createCategory(CategoryDTO category) {
    // TODO: implement createCategory
    throw UnimplementedError();
  }

  @override
  Future<OperationDTO> createOperation(OperationDTO operation) {
    // TODO: implement createOperation
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteOperation(OperationDTO operation) {
    // TODO: implement deleteOperation
    throw UnimplementedError();
  }

  @override
  Future<int> getAccountBalance(String accountId) {
    // TODO: implement getAccountBalance
    throw UnimplementedError();
  }

  @override
  Future<List<AccountDTO>> getAccounts(String groupId) {
    // TODO: implement getAccounts
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryDTO>> getCategories(String groupId) {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<List<OperationDTO>> getOperations(String groupId) {
    // TODO: implement getOperations
    throw UnimplementedError();
  }

  @override
  Future<AccountDTO> updateAccount({String? name}) {
    // TODO: implement updateAccount
    throw UnimplementedError();
  }

  @override
  Future<CategoryDTO> updateCategory({String? name}) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }

  @override
  Future<OperationDTO> updateOperation(OperationDTO operation) {
    // TODO: implement updateOperation
    throw UnimplementedError();
  }
}
