import '../models/models.dart';

abstract interface class AccountService{

  Future<BaseAccount> getById(AccountId id);
  Future<List<BaseAccount>> getAll();
  Future<Account> createAccount(String name);
  Future<Debt> createDebt(String name);
  Future<BaseAccount> update(BaseAccount account, String name);

  Future<List<Balance>> getAccountBalance(AccountId id);
  Future<List<Balance>> getTotalBalance();
  Future<int> getTotalBalanceInBaseCurrency();
}