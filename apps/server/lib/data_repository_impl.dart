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
    return [Group(id: '43')];
  }

  @override
  Future<User> createUser(UsersCompanion user) async {
    final userDBO = await database.transaction<UserDBO>(() async {
      final userGroup = await database.userGroups
          .insertReturning(UserGroupsCompanion.insert());
      return await database.users
          .insertReturning(user.copyWith(groupId: Value(userGroup.id)));
    });

    return User.fromDBO(userDBO);
  }

  @override
  Future<List<User>> getAllUsersByGroup(String groupId) async {
    final list = await (database.users.select()
          ..where((r) => r.groupId.equals(UuidValue.fromString(groupId))))
        .get();
    return list.map(User.fromDBO).toList();
  }

  @override
  Future<User?> getUserByGoogleId(String googleId) async {
    final userDBO = await (database.users.select()
          ..where((r) => r.googleId.equals(googleId)))
        .getSingleOrNull();
    if (userDBO == null) {
      return null;
    } else {
      return User.fromDBO(userDBO);
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
