import '../models/models.dart';

abstract interface class AccountService{

  Future<BaseAccount> getById(AccountId id);
  Future<List<BaseAccount>> getAll();
  Future<Account> createAccount(String name, Currency currency);
  Future<Debt> createDebt(String name, Currency currency);
  Future<BaseAccount> update(BaseAccount account, String name);

}