
import 'package:money_tracker/domain/models/user.dart';
import 'package:money_tracker/utils/try.dart';

import 'models/cloud_models.dart';

abstract class RemoteSource{
  Stream<bool> isAdmin();

  Future<Try<void>> addNewUser(User user);

  Future<Try<bool>> databaseExists(String userId);

  Future<Try<void>> createDatabase(User user);

  Future<Try<void>> logIn(String userId);

  Future<Try<Iterable<User>>> getUsers();

  void logOut();

  Future<Try<Iterable<CloudAccount>>> getAccounts(DateTime date);
  Future<Try<Iterable<CloudCategory>>> getCategories(DateTime date);
  Future<Try<Iterable<CloudOperation>>> getOperations(DateTime date);

  Future<Try<void>> refreshAccountSyncDate(String accountId);
  Future<Try<void>> refreshCategorySyncDate(String categoryId);
  Future<Try<void>> refreshOperationSyncDate(String operationId);

  Future<Try<String>> addAccount(CloudAccount account);
  Future<Try<void>> updateAccount(CloudAccount account);
  Future<Try<void>> deleteAccount(CloudAccount account);

  Future<Try<String>> addCategory(CloudCategory category);
  Future<Try<void>> updateCategory(CloudCategory category);
  Future<Try<void>> deleteCategory(CloudCategory category);

  Future<Try<String>> addOperation(CloudOperation operation);
  Future<Try<void>> updateOperation(CloudOperation operation);
  Future<Try<void>> deleteOperation(CloudOperation operation);

  Future<Try<void>> deleteAll();
}