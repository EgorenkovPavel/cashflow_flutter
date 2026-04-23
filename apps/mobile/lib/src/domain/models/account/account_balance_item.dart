import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/models.dart';

part 'account_balance_item.freezed.dart';

@freezed
abstract class AccountBalanceItem with _$AccountBalanceItem {
  const factory AccountBalanceItem({
    required BaseAccount account,
    required User? user,
    required Balance balance,
  }) = _AccountBalanceItem;
}
