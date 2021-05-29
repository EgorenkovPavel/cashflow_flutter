import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/objects/operation_type.dart';

class Operation {
  final int id;
  final DateTime date;
  final OperationType type;
  final Account account;
  final Category? category;
  final Account? recAccount;
  final int sum;

  const Operation(
      {this.id = 0,
      required this.date,
      required this.type,
      required this.account,
      this.category,
      this.recAccount,
      required this.sum});

  Operation copyWith(
          {int? id,
          DateTime? date,
          OperationType? type,
          Account? account,
          Category? category,
          Account? recAccount,
          int? sum}) =>
      Operation(
        id: id ?? this.id,
        date: date ?? this.date,
        type: type ?? this.type,
        account: account ?? this.account,
        category: category ?? this.category,
        recAccount: recAccount ?? this.recAccount,
        sum: sum ?? this.sum,
      );
}
