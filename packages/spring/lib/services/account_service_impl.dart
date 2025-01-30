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
  Future<Account> createAccount(String name) async {
    final Account account = Account(
      name: name,
      user: _connector.user!.id,
    );
    final id = await _postAccount(account);
    return account.copyWith(id: id);
  }

  @override
  Future<Debt> createDebt(String name) async {
    final Debt account = Debt(
      name: name,
      user: _connector.user!.id,
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

  @override
  Future<List<Balance>> getAccountBalance(AccountId id) =>
      _connector.get<List<Balance>>(
        '$_path/$id/balance',
        (data) => data.map<Balance>((e) => Balance.fromJson(e)).toList(),
      );

  @override
  Future<List<Balance>> getTotalBalance() => _connector.get<List<Balance>>(
        'user-groups/${_connector.user!.userGroup}/balance',
        (data) => data.map<Balance>((e) => Balance.fromJson(e)).toList(),
      );

  @override
  Future<int> getTotalBalanceInBaseCurrency() => _connector.get<int>(
        'user-groups/${_connector.user!.userGroup}/balanceInBaseCurrency',
        (data) => data,
      );
}
