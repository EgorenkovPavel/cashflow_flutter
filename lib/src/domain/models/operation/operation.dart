import 'package:equatable/equatable.dart';

import '../../../utils/sum.dart';
import '../../models.dart';

sealed class Operation extends Equatable {
  final int id;
  final String cloudId;
  final bool synced;
  final bool deleted;
  final DateTime date;
  final int account;
  final int analytic;
  final Sum sum;

  const Operation(
      {required this.id,
      required this.cloudId,
      required this.synced,
      required this.deleted,
      required this.date,
      required this.account,
      required this.analytic,
      required this.sum});

  OperationType get type => switch (this) {
        InputOperation() => OperationType.INPUT,
        OutputOperation() => OperationType.OUTPUT,
        TransferOperation() => OperationType.TRANSFER,
      };

  T map<T>({
    required T Function(InputOperation operation) input,
    required T Function(OutputOperation operation) output,
    required T Function(TransferOperation operation) transfer,
  }) {
    switch (this) {
      case InputOperation():
        return input(this as InputOperation);
      case OutputOperation():
        return output(this as OutputOperation);
      case TransferOperation():
        return transfer(this as TransferOperation);
    }
  }

  Operation copyWith({
    int? id,
    String? cloudId,
    bool? synced,
    bool? deleted,
    DateTime? date,
  }) =>
      map(
        input: (operation) => InputOperation(
          id: id ?? operation.id,
          cloudId: cloudId ?? operation.cloudId,
          synced: synced ?? operation.synced,
          deleted: deleted ?? operation.deleted,
          date: date ?? operation.date,
          account: operation.account,
          category: operation.analytic,
          sum: operation.sum,
        ),
        output: (operation) => OutputOperation(
          id: id ?? operation.id,
          cloudId: cloudId ?? operation.cloudId,
          synced: synced ?? operation.synced,
          deleted: deleted ?? operation.deleted,
          date: date ?? operation.date,
          account: operation.account,
          category: operation.analytic,
          sum: operation.sum,
        ),
        transfer: (operation) => TransferOperation(
            id: id ?? operation.id,
            cloudId: cloudId ?? operation.cloudId,
            synced: synced ?? operation.synced,
            deleted: deleted ?? operation.deleted,
            date: date ?? operation.date,
            account: operation.account,
            recAccount: operation.analytic,
            sum: operation.sum,
            recSum: operation.recSum),
      );
}

class InputOperation extends Operation {
  const InputOperation(
      {super.id = 0,
      super.cloudId = '',
      super.synced = false,
      super.deleted = false,
      required super.date,
      required super.account,
      required int category,
      required super.sum})
      : super(analytic: category);

  @override
  List<Object?> get props =>
      [id, cloudId, synced, deleted, date, account, analytic, sum];
}

class OutputOperation extends Operation {
  const OutputOperation(
      {super.id = 0,
      super.cloudId = '',
      super.synced = false,
      super.deleted = false,
      required super.date,
      required super.account,
      required int category,
      required super.sum})
      : super(analytic: category);

  @override
  List<Object?> get props =>
      [id, cloudId, synced, deleted, date, account, analytic, sum];
}

class TransferOperation extends Operation {
  final Sum recSum;

  const TransferOperation(
      {super.id = 0,
      super.cloudId = '',
      super.synced = false,
      super.deleted = false,
      required super.date,
      required super.account,
      required int recAccount,
      required super.sum,
      required this.recSum})
      : super(analytic: recAccount);

  @override
  List<Object?> get props =>
      [id, cloudId, synced, deleted, date, account, analytic, sum, recSum];
}
