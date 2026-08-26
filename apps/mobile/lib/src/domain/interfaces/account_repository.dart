import '../models.dart';

abstract interface class AccountRepository {

  Stream<List<BaseAccount>> watchAll();

  Future<List<BaseAccount>> getAll();

  Stream<BaseAccount> watchById(int id);

  Future<BaseAccount> getById(int id);

  Future<int> insert(BaseAccount account);

  Future<void> update(BaseAccount account);
}

