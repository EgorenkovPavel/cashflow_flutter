import '../../domain/models.dart';

abstract class LocalSyncSource{

  LocalSyncTable<BaseAccount> get accounts;
  LocalSyncTable<Category> get categories;
  LocalSyncTable<Operation> get operations;

  Future<User?> getUserByGoogleId(String googleId);
}

abstract class LocalSyncTable<T>{

  Future<List<T>> getAllWithEmptyCloudId();

  Future<T?> getByCloudId(String cloudId);
  Future<List<T>> getAllNotSynced();
  Future<void> markAsSynced(int entityId, String cloudId);

  Future<void> insertFromCloud(T entity);
  Future<void> updateFromCloud(T entity);

}