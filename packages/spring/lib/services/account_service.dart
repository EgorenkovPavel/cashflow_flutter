import 'package:spring/models/models.dart';

abstract interface class AccountService{

  Future<List<Account>> getAll();
  Future<Account> createAccount(String name, Currency currency);
  Future<Account> createDebt(String name, Currency currency);
  Future<Account> update(AccountId accountId, String name);

}