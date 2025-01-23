import 'account_service.dart';

import '../models/models.dart';
import 'network_client.dart';

class AccountServiceImpl implements AccountService {
  final NetworkClient _connector;

  AccountServiceImpl(this._connector);

  String get _path => 'user-groups/${_connector.user!.userGroup}/accounts';

  @override
  Future<BaseAccount> getById(AccountId id) => _connector.get<BaseAccount>(
        '$_path/$id',
        (e) => BaseAccount.fromJson(e),
      );

  @override
  Future<List<BaseAccount>> getAll() => _connector.get<List<BaseAccount>>(
        _path,
        (data) =>
            data.map<BaseAccount>((e) => BaseAccount.fromJson(e)).toList(),
      );

  @override
  Future<Account> createAccount(String name, Currency currency) async {
    final Account account = Account(
      name: name,
      currency: currency,
      user: _connector.user!.id,
      balance: 0,
    );
    final id = await _postAccount(account);
    return account.copyWith(id: id);
  }

  @override
  Future<Debt> createDebt(String name, Currency currency) async {
    final Debt account = Debt(
      name: name,
      currency: currency,
      user: _connector.user!.id,
      balance: 0,
    );
    final id = await _postAccount(account);
    return account.copyWith(id: id);
  }

  @override
  Future<BaseAccount> update(BaseAccount account, String name) =>
      _connector.update(
        path: '$_path/${account.id}',
        body: {'name': name},
        mapper: (e) => BaseAccount.fromJson(e),
      );

  Future<AccountId> _postAccount(BaseAccount account) =>
      _connector.post<AccountId>(_path, account.toJson());
}
