
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/models/enum/currency.dart';

part 'account_balance_entity.freezed.dart';

@freezed
class AccountBalanceEntity with _$AccountBalanceEntity{
  const factory AccountBalanceEntity({
    required int accountId,
    required Currency currency,
    required int sum,
}) = _AccountBalanceEntity;
}
