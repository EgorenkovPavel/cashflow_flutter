import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models.dart';

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
    required Money sum,
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
    required Money sum,
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
    required Money sum,
  }) = TransferOperationView;

  const factory OperationView.exchange({
    required int id,
    required DateTime date,
    required bool deleted,
    required bool synced,
    required String userPhotoUrl,
    required String userName,
    required String account,
    required Money sendSum,
    required Money receivedSum,
  }) = ExchangeOperationView;

  OperationType get type => switch(this) {
    InputOperationView() => .INPUT,
    OutputOperationView() => .OUTPUT,
    TransferOperationView() => .TRANSFER,
    ExchangeOperationView() => .EXCHANGE,
  };

  static OperationView fromDomain(OperationListItem model) {
    final operation = model.operation;
    return switch (operation) {
      InputOperation() => OperationView.input(
        id: operation.id,
        date: operation.date,
        deleted: operation.deleted,
        synced: operation.synced,
        userName: model.user?.name ?? '',
        userPhotoUrl: model.user?.photo ?? '',
        account: model.accountTitle,
        category: model.analyticTitle,
        sum: operation.sum,
      ),
      OutputOperation() => OperationView.output(
        id: operation.id,
        date: operation.date,
        deleted: operation.deleted,
        synced: operation.synced,
        userName: model.user?.name ?? '',
        userPhotoUrl: model.user?.photo ?? '',
        account: model.accountTitle,
        category: model.analyticTitle,
        sum: operation.sum,
      ),
      TransferOperation() => OperationView.transfer(
        id: operation.id,
        date: operation.date,
        deleted: operation.deleted,
        synced: operation.synced,
        userName: model.user?.name ?? '',
        userPhotoUrl: model.user?.photo ?? '',
        account: model.accountTitle,
        recAccount: model.analyticTitle,
        sum: operation.sum,
      ),
      ExchangeOperation() => OperationView.exchange(
        id: operation.id,
        date: operation.date,
        deleted: operation.deleted,
        synced: operation.synced,
        userName: model.user?.name ?? '',
        userPhotoUrl: model.user?.photo ?? '',
        account: model.accountTitle,
        sendSum: operation.sumSend,
        receivedSum: operation.sumReceived,
      ),
    };
  }
}
