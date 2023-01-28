import 'package:equatable/equatable.dart';

import '../account/account.dart';
import '../category/category.dart';
import '../enum/operation_type.dart';

class Operation extends Equatable {
  final int id;
  final String cloudId;
  final bool synced;
  final bool deleted;
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
    this.deleted = false,
    required this.date,
    required this.type,
    required this.account,
    this.category,
    this.recAccount,
    required this.sum,
  });

  const Operation.input({
    this.id = 0,
    this.cloudId = '',
    this.synced = false,
    this.deleted = false,
    required this.date,
    required this.account,
    required this.category,
    required this.sum,
  })  : type = OperationType.INPUT,
        recAccount = null;

  const Operation.output({
    this.id = 0,
    this.cloudId = '',
    this.synced = false,
    this.deleted = false,
    required this.date,
    required this.account,
    required this.category,
    required this.sum,
  })  : type = OperationType.OUTPUT,
        recAccount = null;

  const Operation.transfer({
    this.id = 0,
    this.cloudId = '',
    this.synced = false,
    this.deleted = false,
    required this.date,
    required this.account,
    required this.recAccount,
    required this.sum,
  })  : type = OperationType.TRANSFER,
        category = null;

  Operation copyWith({
    int? id,
    String? cloudId,
    bool? synced,
    bool? deleted,
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
        deleted: deleted ?? this.deleted,
        date: date ?? this.date,
        type: type ?? this.type,
        account: account ?? this.account,
        category: category ?? this.category,
        recAccount: recAccount ?? this.recAccount,
        sum: sum ?? this.sum,
      );

  @override
  List<Object?> get props => [
        id,
        cloudId,
        synced,
        deleted,
        date,
        type,
        account,
        category,
        recAccount,
        sum,
      ];
}
