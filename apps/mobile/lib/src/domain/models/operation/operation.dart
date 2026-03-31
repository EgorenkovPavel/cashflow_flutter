import 'package:freezed_annotation/freezed_annotation.dart';

import '../../finance_models.dart';

part 'operation.freezed.dart';

@freezed
sealed class Operation with _$Operation{
  const Operation._();

  const factory Operation.input({
    @Default(0) int id,
    @Default('') String cloudId,
    @Default(false) bool synced,
    @Default(false) bool deleted,
    required DateTime date,
    required int account,
    required int category,
    required Sum sum,
  }) = InputOperation;
  const factory Operation.output({
    @Default(0) int id,
    @Default('') String cloudId,
    @Default(false) bool synced,
    @Default(false) bool deleted,
    required DateTime date,
    required int account,
    required int category,
    required Sum sum,
  }) = OutputOperation;
  const factory Operation.transfer({
    @Default(0) int id,
    @Default('') String cloudId,
    @Default(false) bool synced,
    @Default(false) bool deleted,
    required DateTime date,
    required int account,
    required int recAccount,
    required Sum sum,
  }) = TransferOperation;
  const factory Operation.exchange({
    @Default(0) int id,
    @Default('') String cloudId,
    @Default(false) bool synced,
    @Default(false) bool deleted,
    required DateTime date,
    required int account,
    required Sum sum,
    required Sum recSum,
  }) = ExchangeOperation;

  OperationType get operationType => switch (this) {
    InputOperation() => OperationType.INPUT,
    OutputOperation() => OperationType.OUTPUT,
    TransferOperation() => OperationType.TRANSFER,
    ExchangeOperation() => OperationType.EXCHANGE,
  };
}

