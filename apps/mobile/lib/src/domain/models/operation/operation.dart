import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models.dart';

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
    required Money sum,
  }) = InputOperation;
  const factory Operation.output({
    @Default(0) int id,
    @Default('') String cloudId,
    @Default(false) bool synced,
    @Default(false) bool deleted,
    required DateTime date,
    required int account,
    required int category,
    required Money sum,
  }) = OutputOperation;
  const factory Operation.transfer({
    @Default(0) int id,
    @Default('') String cloudId,
    @Default(false) bool synced,
    @Default(false) bool deleted,
    required DateTime date,
    required int accountSend,
    required int accountReceived,
    required Money sum,
  }) = TransferOperation;
  const factory Operation.exchange({
    @Default(0) int id,
    @Default('') String cloudId,
    @Default(false) bool synced,
    @Default(false) bool deleted,
    required DateTime date,
    required int account,
    required Money sumSend,
    required Money sumReceived,
  }) = ExchangeOperation;

  OperationType get operationType => switch (this) {
    InputOperation() => OperationType.INPUT,
    OutputOperation() => OperationType.OUTPUT,
    TransferOperation() => OperationType.TRANSFER,
    ExchangeOperation() => OperationType.EXCHANGE,
  };
}

