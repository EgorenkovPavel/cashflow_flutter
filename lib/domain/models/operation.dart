import 'account.dart';
import 'category.dart';
import 'operation_type.dart';

class Operation {
  final int id;
  final String cloudId;
  final bool synced;
  final DateTime date;
  final OperationType type;
  final Account account;
  final Category? category;
  final Account? recAccount;
  final int sum;

  const Operation({
    this.id = 0,
    this.cloudId = '',
    this.synced = false,
    required this.date,
    required this.type,
    required this.account,
    this.category,
    this.recAccount,
    required this.sum,
  });

  Operation copyWith({
    int? id,
    String? cloudId,
    bool? synced,
    DateTime? date,
    OperationType? type,
    Account? account,
    Category? category,
    Account? recAccount,
    int? sum,
  }) =>
      Operation(
        id: id ?? this.id,
        cloudId: cloudId ?? this.cloudId,
        synced: synced ?? this.synced,
        date: date ?? this.date,
        type: type ?? this.type,
        account: account ?? this.account,
        category: category ?? this.category,
        recAccount: recAccount ?? this.recAccount,
        sum: sum ?? this.sum,
      );
}
