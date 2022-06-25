import 'package:equatable/equatable.dart';

import 'account.dart';

class AccountBalance extends Equatable{
  final int id;
  final String cloudId;
  final String title;
  final int balance;
  final bool isDebt;

  const AccountBalance({
    required this.id,
    required this.cloudId,
    required this.title,
    required this.balance,
    this.isDebt = false,
  });

  AccountBalance copyWith({
    int? id,
    String? cloudId,
    String? title,
    bool? isDebt,
    int? balance,
  }) =>
      AccountBalance(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        title: title ?? this.title,
        isDebt: isDebt ?? this.isDebt,
        balance: balance ?? this.balance,
      );

  Account toAccount() => Account(
        id: id,
        cloudId: cloudId,
        title: title,
        isDebt: isDebt,
      );

  @override
  List<Object?> get props => [id, cloudId, title, balance, isDebt];
}
