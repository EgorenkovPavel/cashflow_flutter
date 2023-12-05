import 'package:freezed_annotation/freezed_annotation.dart';

import '../account/account.dart';
import '../category/category.dart';
import '../enum/operation_type.dart';

part 'operation.freezed.dart';

@freezed
class Operation with _$Operation {
  const Operation._();

  const factory Operation.input({
    @Default(0) int id,
    @Default('') String cloudId,
    @Default(false) bool synced,
    @Default(false) bool deleted,
    required DateTime date,
    required Account account,
    required Category category,
    required int sum,
  }) = _InputOperation;

  const factory Operation.output({
    @Default(0) int id,
    @Default('') String cloudId,
    @Default(false) bool synced,
    @Default(false) bool deleted,
    required DateTime date,
    required Account account,
    required Category category,
    required int sum,
  }) = _OutputOperation;

  const factory Operation.transfer({
    @Default(0) int id,
    @Default('') String cloudId,
    @Default(false) bool synced,
    @Default(false) bool deleted,
    required DateTime date,
    required Account account,
    required Account recAccount,
    required int sum,
    required int recSum,
  }) = _TransferOperation;

  String get analyticTitle => map(
        input: (operation) => operation.category.title,
        output: (operation) => operation.category.title,
        transfer: (operation) => operation.recAccount.title,
      );

  OperationType get type => map(
        input: (_) => OperationType.INPUT,
        output: (_) => OperationType.OUTPUT,
        transfer: (_) => OperationType.TRANSFER,
      );

  Category? get category => map(
        input: (operation) => operation.category,
        output: (operation) => operation.category,
        transfer: (operation) => null,
      );

  Account? get recAccount => map(
        input: (operation) => null,
        output: (operation) => null,
        transfer: (operation) => operation.recAccount,
      );

  int get recSum => map(
    input: (operation) => 0,
    output: (operation) => 0,
    transfer: (operation) => operation.recSum,
  );
}
