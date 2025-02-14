import 'package:equatable/equatable.dart';

import '../../../utils/sum.dart';
import '../../models.dart';

sealed class Operation extends Equatable {
  final int id;
  final String cloudId;
  final bool synced;
  final bool deleted;
  final DateTime date;
  final BaseAccount account;
  final Sum sum;

  const Operation(
      {required this.id,
      required this.cloudId,
      required this.synced,
      required this.deleted,
      required this.date,
      required this.account,
      required this.sum});

  String get analyticTitle => switch (this) {
        InputOperation(category: final category) => category.title,
        OutputOperation(category: final category) => category.title,
        TransferOperation(recAccount: final recAccount) => recAccount.title,
      };

  OperationType get type => switch (this) {
        InputOperation() => OperationType.INPUT,
        OutputOperation() => OperationType.OUTPUT,
        TransferOperation() => OperationType.TRANSFER,
      };
}

class InputOperation extends Operation {
  final InputCategoryItem category;

  const InputOperation(
      {super.id = 0,
      super.cloudId = '',
      super.synced = false,
      super.deleted = false,
      required super.date,
      required Account super.account,
      required this.category,
      required super.sum});

  @override
  List<Object?> get props =>
      [id, cloudId, synced, deleted, date, account, category, sum];
}

class OutputOperation extends Operation {
  final OutputCategoryItem category;

  const OutputOperation(
      {super.id = 0,
      super.cloudId = '',
      super.synced = false,
      super.deleted = false,
      required super.date,
      required Account super.account,
      required this.category,
      required super.sum});

  @override
  List<Object?> get props =>
      [id, cloudId, synced, deleted, date, account, category, sum];
}

class TransferOperation extends Operation {
  final BaseAccount recAccount;
  final Sum recSum;

  const TransferOperation(
      {super.id = 0,
      super.cloudId = '',
      super.synced = false,
      super.deleted = false,
      required super.date,
      required super.account,
      required this.recAccount,
      required super.sum,
      required this.recSum});

  @override
  List<Object?> get props =>
      [id, cloudId, synced, deleted, date, account, recAccount, sum, recSum];
}
