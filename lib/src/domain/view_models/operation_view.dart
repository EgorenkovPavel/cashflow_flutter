import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/sum.dart';
import '../models.dart';

part 'operation_view.freezed.dart';

@freezed
sealed class OperationView with _$OperationView{
  const OperationView._();

  const factory OperationView.input({
    required int id,
    required DateTime date,
    required bool deleted,
    required bool synced,
    required String userPhotoUrl,
    required String userName,
    required String account,
    required String category,
    required Sum sum,
}) = InputOperationView;

  const factory OperationView.output({
    required int id,
    required DateTime date,
    required bool deleted,
    required bool synced,
    required String userPhotoUrl,
    required String userName,
    required String account,
    required String category,
    required Sum sum,
  }) = OutputOperationView;

  const factory OperationView.transfer({
    required int id,
    required DateTime date,
    required bool deleted,
    required bool synced,
    required String userPhotoUrl,
    required String userName,
    required String account,
    required String recAccount,
    required Sum sum,
  }) = TransferOperationView;

  const factory OperationView.exchange({
    required int id,
    required DateTime date,
    required bool deleted,
    required bool synced,
    required String userPhotoUrl,
    required String userName,
    required String account,
    required Sum sendSum,
    required Sum receivedSum,
  }) = ExchangeOperationView;

  OperationType get type => switch(this) {
    InputOperationView() => .INPUT,
    OutputOperationView() => .OUTPUT,
    TransferOperationView() => .TRANSFER,
    ExchangeOperationView() => .EXCHANGE,
  };
}

// sealed class OperationView extends Equatable {
//   //TODO to freezed
//   final int id;
//   final DateTime date;
//   final bool deleted;
//   final bool synced;
//   final String account;
//   final String userPhotoUrl;
//   final String userName;
//
//   OperationType get type => switch(this){
//     InputOperationView() => .INPUT,
//     OutputOperationView() => .OUTPUT,
//     TransferOperationView() => .TRANSFER,
//     ExchangeOperationView() => .EXCHANGE,
//   };
//
//   const OperationView({
//     required this.id,
//     required this.date,
//     required this.account,
//     required this.deleted,
//     required this.synced,
//     required this.userPhotoUrl,
//     required this.userName,
//   });
// }
//
// class InputOperationView extends OperationView {
//   final String categoryName;
//   final Sum sum;
//
//   const InputOperationView({
//     required super.id,
//     required super.date,
//     required super.account,
//     required super.deleted,
//     required super.synced,
//     required super.userPhotoUrl,
//     required super.userName,
//     required this.categoryName,
//     required this.sum,
//   });
//
//   @override
//   List<Object?> get props => [
//     id,
//     date,
//     account,
//     categoryName,
//     deleted,
//     synced,
//     userPhotoUrl,
//     userName,
//     sum,
//   ];
// }
//
// class OutputOperationView extends OperationView {
//   final String categoryName;
//   final Sum sum;
//
//   const OutputOperationView({
//     required super.id,
//     required super.date,
//     required super.account,
//     required super.deleted,
//     required super.synced,
//     required super.userPhotoUrl,
//     required super.userName,
//     required this.categoryName,
//     required this.sum,
//   });
//
//   @override
//   List<Object?> get props => [
//     id,
//     date,
//     account,
//     categoryName,
//     deleted,
//     synced,
//     userPhotoUrl,
//     userName,
//     sum,
//   ];
// }
//
// class TransferOperationView extends OperationView {
//   final String recAccount;
//   final Sum sum;
//
//   const TransferOperationView({
//     required super.id,
//     required super.date,
//     required super.account,
//     required super.deleted,
//     required super.synced,
//     required super.userPhotoUrl,
//     required super.userName,
//     required this.recAccount,
//     required this.sum,
//   });
//
//   @override
//   List<Object?> get props => [
//     id,
//     date,
//     account,
//     recAccount,
//     deleted,
//     synced,
//     userPhotoUrl,
//     userName,
//     sum,
//   ];
// }
//
// class ExchangeOperationView extends OperationView {
//   final Sum sendSum;
//   final Sum receivedSum;
//
//   const ExchangeOperationView({
//     required super.id,
//     required super.date,
//     required super.account,
//     required super.deleted,
//     required super.synced,
//     required super.userPhotoUrl,
//     required super.userName,
//     required this.sendSum,
//     required this.receivedSum,
//   });
//
//   @override
//   List<Object?> get props => [
//     id,
//     date,
//     account,
//     sendSum,
//     deleted,
//     synced,
//     userPhotoUrl,
//     userName,
//     receivedSum,
//   ];
// }
