import 'account.dart';

class AccountBalance {
  final int id;
  final String cloudId;
  final String title;
  final int balance;
  final bool isDebt;

  const AccountBalance(
      {required this.id,
      required this.cloudId,
      required this.title,
      required this.balance,
      this.isDebt = false});

  AccountBalance copyWith(
          {int? id,
          String? cloudId,
          String? title,
          bool? isDebt,
          int? balance}) =>
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountBalance &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
