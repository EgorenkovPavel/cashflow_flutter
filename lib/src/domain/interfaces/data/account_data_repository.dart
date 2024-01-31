import '../../models.dart';

abstract class AccountDataRepository {

  Stream<List<Account>> watchAll();
  Future<List<Account>> getAll();

  Stream<List<AccountBalance>> watchAllBalance();
  Future<List<AccountBalance>> getAllBalance();

  Stream<Account> watchById(int id);
  Future<Account> getById(int id);

  Future<int> insert(Account account);
  Future<void> update(Account account);
}