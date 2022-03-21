
import 'package:money_tracker/domain/models/user.dart';
import 'package:money_tracker/utils/try.dart';

import 'models/cloud_models.dart';

abstract class RemoteDataSource{

  CloudTable<CloudAccount> get accounts;
  CloudTable<CloudCategory> get categories;
  CloudTable<CloudOperation> get operations;

  Future<Try<void>> deleteAll();

  Future<bool> isAdmin(User user);
  Future<Try<List<User>>> getAll();
  Future<Try<void>> connect(User user);
  Future<void> disconnect();
  Future<Try<void>> addUserToDatabase(User user);
  Future<Try<void>> createDatabase(User user);
  Future<Try<bool>> databaseExists(User user);
}

abstract class CloudTable<T>{

  Future<Try<Iterable<T>>> getAll(DateTime dateSince);

  Future<Try<void>> refreshEntitySyncDate(String entityId);

  Future<Try<String>> add(T entity);
  Future<Try<void>> update(T entity);
  Future<Try<void>> delete(String cloudId);

  Future<Try<void>> deleteAll();

}