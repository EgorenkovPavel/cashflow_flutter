
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/models/enum/currency.dart';
import '../../../../utils/balance.dart';

part 'account_balance_entity.freezed.dart';

@freezed
abstract class AccountBalanceEntity with _$AccountBalanceEntity{
  const factory AccountBalanceEntity({
    required int accountId,
    required Balance balance,
}) = _AccountBalanceEntity;
}
