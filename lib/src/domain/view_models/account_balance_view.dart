import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/balance.dart';
import '../view_models.dart';

part 'account_balance_view.freezed.dart';

@freezed
abstract class AccountBalanceView with _$AccountBalanceView {
  const AccountBalanceView._();

  const factory AccountBalanceView({
    required int accountId,
    required int? userId,
    required String accountTitle,
    required String userName,
    required String userPhoto,
    required Balance balance,
    required bool isDebt,
  }) = _AccountBalanceView;

  AccountView get account => AccountView(id: accountId, title: accountTitle);
}
