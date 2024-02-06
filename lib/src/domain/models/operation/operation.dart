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
  }) = InputOperation;

  const factory Operation.output({
    @Default(0) int id,
    @Default('') String cloudId,
    @Default(false) bool synced,
    @Default(false) bool deleted,
    required DateTime date,
    required Account account,
    required Category category,
    required int sum,
  }) = OutputOperation;

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
  }) = TransferOperation;

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

}

// sealed class Operation {
//   final int id;
//   final String cloudId;
//   final bool synced;
//   final bool deleted;
//   final DateTime date;
//   final Account account;
//   final int sum;
//
//   Operation({
//     this.id = 0,
//     this.cloudId = '',
//     this.synced = false,
//     this.deleted = false,
//     required this.date,
//     required this.account,
//     required this.sum,
//   });
//
//   factory Operation.input({
//     int id = 0,
//     String cloudId = '',
//     bool synced = false,
//     bool deleted = false,
//     required DateTime date,
//     required Account account,
//     required int sum,
//     required Category category,
//   }) =>
//       InputOperation(
//         id: id,
//         cloudId: cloudId,
//         deleted: deleted,
//         synced: synced,
//         date: date,
//         account: account,
//         sum: sum,
//         category: category,
//       );
//
//   factory Operation.output({
//     int id = 0,
//     String cloudId = '',
//     bool synced = false,
//     bool deleted = false,
//     required DateTime date,
//     required Account account,
//     required int sum,
//     required Category category,
//   }) =>
//       OutputOperation(
//         id: id,
//         cloudId: cloudId,
//         deleted: deleted,
//         synced: synced,
//         date: date,
//         account: account,
//         sum: sum,
//         category: category,
//       );
//
//   factory Operation.transfer({
//     int id = 0,
//     String cloudId = '',
//     bool synced = false,
//     bool deleted = false,
//     required DateTime date,
//     required Account account,
//     required int sum,
//     required Account recAccount,
//     required int recSum,
//   }) =>
//       TransferOperation(
//         id: id,
//         cloudId: cloudId,
//         deleted: deleted,
//         synced: synced,
//         date: date,
//         account: account,
//         sum: sum,
//         recAccount: recAccount,
//         recSum: recSum,
//       );
//
//   String get analyticTitle;
//
//   OperationType get type;
//
//   Category? get category;
//
//   Account? get recAccount;
//
//   int get recSum;
// }
//
// class InputOperation extends Operation {
//   final Category category;
//
//   InputOperation({
//     super.id,
//     super.cloudId,
//     super.synced,
//     super.deleted,
//     required super.date,
//     required super.account,
//     required super.sum,
//     required this.category,
//   });
//
//   @override
//   String get analyticTitle => category.title;
//
//   @override
//   Account? get recAccount => null;
//
//   @override
//   int get recSum => 0;
//
//   @override
//   OperationType get type => OperationType.INPUT;
// }
//
// class OutputOperation extends Operation {
//   final Category category;
//
//   OutputOperation({
//     super.id,
//     super.cloudId,
//     super.synced,
//     super.deleted,
//     required super.date,
//     required super.account,
//     required super.sum,
//     required this.category,
//   });
//
//   @override
//   String get analyticTitle => category.title;
//
//   @override
//   Account? get recAccount => null;
//
//   @override
//   int get recSum => 0;
//
//   @override
//   OperationType get type => OperationType.OUTPUT;
// }
//
// class TransferOperation extends Operation {
//   final Account recAccount;
//   final int recSum;
//
//   TransferOperation({
//     super.id,
//     super.cloudId,
//     super.synced,
//     super.deleted,
//     required super.date,
//     required super.account,
//     required super.sum,
//     required this.recAccount,
//     required this.recSum,
//   });
//
//   @override
//   String get analyticTitle => recAccount.title;
//
//   @override
//   Category? get category => null;
//
//   @override
//   OperationType get type => OperationType.TRANSFER;
// }
