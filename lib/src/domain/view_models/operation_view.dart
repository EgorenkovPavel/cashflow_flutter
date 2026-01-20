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
