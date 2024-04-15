import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/currency.dart';
import 'account.dart';

part 'account_balance.freezed.dart';

@freezed
class AccountBalance with _$AccountBalance {
  const AccountBalance._();

  const factory AccountBalance({
    required int id,
    required String cloudId,
    required String title,
    required Currency currency,
    required int balance,
    @Default(false) bool isDebt,
  }) = _AccountBalance;

  Account get account => Account(
        id: id,
        title: title,
        isDebt: isDebt,
        cloudId: cloudId,
        currency: currency,
      );

  static AccountBalance fromAccount(Account account) => AccountBalance(
    id: account.id,
    cloudId: account.cloudId,
    title: account.title,
    currency: account.currency,
    balance: 0,
  );
}
