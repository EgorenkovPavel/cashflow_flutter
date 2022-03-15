
import 'package:money_tracker/domain/interfaces/data_source.dart';
import 'package:money_tracker/utils/try.dart';

import 'models/cloud_models.dart';

abstract class RemoteSource implements UsersDataSource{

  CloudTable<CloudAccount> get accounts;
  CloudTable<CloudCategory> get categories;
  CloudTable<CloudOperation> get operations;

  Future<Try<void>> deleteAll();
}

abstract class CloudTable<T>{

  Future<Try<Iterable<T>>> getAll(DateTime dateSince);

  Future<Try<void>> refreshEntitySyncDate(String entityId);

  Future<Try<String>> add(T entity);
  Future<Try<void>> update(T entity);
  Future<Try<void>> delete(String cloudId);

  Future<Try<void>> deleteAll();

}