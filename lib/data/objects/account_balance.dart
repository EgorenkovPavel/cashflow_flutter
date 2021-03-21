import 'package:cashflow/data/objects/account.dart';

class AccountBalance {
  final int id;
  final String title;
  final bool archive;
  final int balance;

  const AccountBalance({this.id, this.title, this.archive, this.balance});

  AccountBalance copyWith({int id, String title, bool archive, int balance}) =>
      AccountBalance(
        id: id ?? this.id,
        title: title ?? this.title,
        archive: archive ?? this.archive,
        balance: balance ?? this.balance,
      );

  Account getAccount() => Account(id: id, title: title, archive: archive);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AccountBalance &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

}
