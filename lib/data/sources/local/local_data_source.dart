import 'package:money_tracker/domain/interfaces/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

abstract class LocalDataSource{

  AccountDataRepository get accounts;
  CategoryDataRepository get categories;
  OperationDataRepository get operations;

  LocalSyncTable<Account> get accountsSync;
  LocalSyncTable<Category> get categoriesSync;
  LocalSyncTable<Operation> get operationsSync;

  Future deleteAll();
  Future<Map<String, List<Map<String, dynamic>>>> exportData();
  Future<void> importData(Map<String, dynamic> data);

}

abstract class LocalSyncTable<T>{

  Future<List<T>> getAllWithEmptyCloudId();

  Future<T?> getByCloudId(String cloudId);
  Stream<T> watchNotSynced();
  Future<List<T>> getAllNotSynced();
  Future<void> markAsSynced(int entityId, String cloudId);

  Future<void> insertFromCloud(T entity);
  Future<void> updateFromCloud(T entity);

}