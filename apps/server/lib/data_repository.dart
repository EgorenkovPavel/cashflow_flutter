import 'package:cashflow_server/data/database.dart';
import 'package:cashflow_server/models/user.dart';

import 'models/group.dart';

abstract class DataRepository {
  List<Group> getGroups();

  //USERS
  Future<User> createUser(UsersCompanion user);

  Future<List<User>> getAllUsersByGroup(String groupId);

  Future<User?> getUserByGoogleId(String googleId);

  //ACCOUNTS
  Future<List<AccountDTO>> getAccounts(String groupId);

  Future<int> getAccountBalance(String accountId);

  Future<AccountDTO> createAccount({required String name, required bool isDebt, required String userId, required String groupId});

  Future<AccountDTO> updateAccount({String name});

  //CATEGORIES
  Future<List<CategoryDTO>> getCategories(String groupId);

  Future<CategoryDTO> createCategory(CategoryDTO category);

  Future<CategoryDTO> updateCategory({String name});

  //OPERATIONS
  Future<List<OperationDTO>> getOperations(String groupId);

  Future<OperationDTO> createOperation(OperationDTO operation);

  Future<OperationDTO> updateOperation(OperationDTO operation);

  Future<bool> deleteOperation(OperationDTO operation);
}

class AccountDTO {
  AccountDTO({
    required this.id,
    required this.name,
    required this.userId,
    required this.balance,
  });

  final String id;
  final String name;
  final String userId;
  final int balance;
}

class CategoryDTO {
  CategoryDTO({
    required this.id,
    required this.name,
    required this.budget,
    required this.parentId,
  });

  final String id;
  final String name;
  final int budget;
  final String parentId;
}

class OperationDTO {
  OperationDTO({
    required this.id,
    required this.date,
    required this.type,
    required this.accountId,
    required this.analyticId,
    required this.sum,
    required this.userId,
  });

  final String id;
  final DateTime date;
  final String type;
  final String accountId;
  final String analyticId;
  final int sum;
  final String userId;
}
