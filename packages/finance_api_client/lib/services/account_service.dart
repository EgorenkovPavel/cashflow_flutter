
import 'package:finance_models/finance_models.dart';
import 'package:uuid/uuid.dart';

import '../models/models.dart';

abstract interface class AccountService{

  Future<BaseAccountResponse> getById(UuidValue id);
  Future<List<BaseAccountResponse>> getAll();
  Future<BaseAccountResponse> create(CreateAccountRequest req);
  Future<BaseAccountResponse> update(UpdateBaseAccountRequest req);

  Future<Balance> getTotalBalance();
  Future<int> getTotalBalanceInBaseCurrency();
}