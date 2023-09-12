import 'package:freezed_annotation/freezed_annotation.dart';

import '../enum/currency.dart';

part 'account.freezed.dart';

@freezed
class Account with _$Account {
  const factory Account({
    @Default(0) int id,
    @Default('') String cloudId,
    required String title,
    required bool isDebt,
    required Currency currency,
  }) = _Account;
}
