import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/currency.dart';


part 'account_balance.freezed.dart';

@freezed
class AccountBalance with _$AccountBalance {
  const factory AccountBalance({
    required int id,
    required String cloudId,
    required String title,
    required Currency currency,
    required int balance,
    @Default(false) bool isDebt,
  }) = _AccountBalance;
}
