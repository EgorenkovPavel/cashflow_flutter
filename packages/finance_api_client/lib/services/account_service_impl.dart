import 'package:finance_models/finance_models.dart';
import 'package:uuid/uuid.dart';

import '../models/models.dart';
import 'account_service.dart';
import 'network_client.dart';

class AccountServiceImpl implements AccountService {
  final NetworkClient _connector;

  AccountServiceImpl(this._connector);

  String get _path => 'user-groups/${_connector.user!.groupId}/accounts';

  @override
  Future<BaseAccountResponse> getById(UuidValue id) =>
      _connector.get<BaseAccountResponse>(
        '$_path/$id',
        (e) => BaseAccountResponse.fromJson(e),
      );

  @override
  Future<List<BaseAccountResponse>> getAll() =>
      _connector.get<List<BaseAccountResponse>>(
        _path,
        (data) => data
            .map<BaseAccountResponse>((e) => BaseAccountResponse.fromJson(e))
            .toList(),
      );

  @override
  Future<BaseAccountResponse> create(CreateAccountRequest req) {
    return _postAccount<BaseAccountResponse>(req);
  }

  @override
  Future<BaseAccountResponse> update(UpdateBaseAccountRequest req) =>
      _connector.update(path: '$_path/${req.id}', body: req.toJson());

  Future<T> _postAccount<T extends BaseAccountResponse>(
    CreateBaseAccountRequest account,
  ) =>
      _connector.post<BaseAccountResponse>(_path, account.toJson())
          as Future<T>;

  @override
  Future<Balance> getTotalBalance() => _connector.get<Balance>(
    'user-groups/${_connector.user!.groupId}/balance',
    (data) => data.map<Balance>((e) => Balance.fromJson(e)).toList(),
  );

  @override
  Future<int> getTotalBalanceInBaseCurrency() => _connector.get<int>(
    'user-groups/${_connector.user!.groupId}/balanceInBaseCurrency',
    (data) => data,
  );
}
