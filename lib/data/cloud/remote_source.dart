
import 'package:money_tracker/domain/models/user.dart';
import 'package:money_tracker/try.dart';

import 'models/cloud_models.dart';

abstract class RemoteSource{
  Stream<bool> isAdmin();

  Future<Try<void>> addNewUser(User user);

  Future<Try<bool>> databaseExists(String userId);

  Future<Try<void>> createDatabase(User user);

  Future<Try<void>> logIn(String userId);

  void logOut();

  Future<Iterable<CloudAccount>?> getAccounts(DateTime date);
  Future<Iterable<CloudCategory>?> getCategories(DateTime date);
  Future<Iterable<CloudOperation>?> getOperations(DateTime date);

  Future<void> refreshAccountSyncDate(String accountId);
  Future<void> refreshCategorySyncDate(String categoryId);
  Future<void> refreshOperationSyncDate(String operationId);

  Future<String?> addAccount(CloudAccount account);
  Future<void>? updateAccount(CloudAccount account);
  Future<void> deleteAccount(String cloudId);

  Future<String?> addCategory(CloudCategory category);
  Future<void> updateCategory(CloudCategory category);
  Future<void> deleteCategory(String cloudId);

  Future<String?> addOperation(CloudOperation operation);
  Future<void> updateOperation(CloudOperation operation);
  Future<void> deleteOperation(String cloudId);

  Future<void> deleteAll();
}