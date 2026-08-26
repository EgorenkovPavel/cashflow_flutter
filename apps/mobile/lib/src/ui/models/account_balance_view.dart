import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models.dart';
import 'account_view.dart';

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

  static AccountBalanceView fromDomain(AccountBalanceItem model) =>
      AccountBalanceView(
        accountId: model.account.id,
        userId: model.user?.id,
        accountTitle: model.account.title,
        userName: model.user?.name ?? '',
        userPhoto: model.user?.photo ?? '',
        balance: model.balance,
        isDebt: model.account.isDebt,
      );
}
