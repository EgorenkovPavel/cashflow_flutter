
import 'package:spring/services/account_service.dart';

import '../models/models.dart';
import 'network_client.dart';

class AccountServiceImpl implements AccountService{
  final NetworkClient _connector;
  final _path = 'accounts';

  AccountServiceImpl(this._connector);

  @override
  Future<List<Account>> getAll() => _connector.get<List<Account>>(_path);

  @override
  Future<Account> createAccount(String name, Currency currency) => _postAccount(
      name: name,
      isDebt: false,
      currency: currency,
      user: _connector.user!.id);

  @override
  Future<Account> createDebt(String name, Currency currency) => _postAccount(
      name: name, isDebt: true, currency: currency, user: _connector.user!.id);

  @override
  Future<Account> update(AccountId accountId, String name) =>
      _connector.update('$_path/$accountId', {'name': name});

  Future<Account> _postAccount(
      {AccountId? id,
        required String name,
        required bool isDebt,
        required Currency currency,
        required UserId user}) async {
    Account account = Account(
      id: id,
      name: name,
      isDebt: isDebt,
      currency: currency,
      user: user,
    );
    Map<String, dynamic> data = await _connector.post(_path, account);
    return Account(
        id: data['id'],
        name: account.name,
        isDebt: account.isDebt,
        currency: account.currency,
        user: account.user);
  }
}