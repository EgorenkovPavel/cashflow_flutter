
import 'package:finance_models/finance_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid_value.dart';

import '../uuid_converter.dart';

part 'operation.freezed.dart';
part 'operation.g.dart';

@freezed
sealed class OperationResponse with _$OperationResponse{
  const OperationResponse._();

  const factory OperationResponse.input({
    @UuidValueConverter() required UuidValue id,
    @Default(false) bool deleted,
    required DateTime date,
    @UuidValueConverter() required UuidValue account,
    @UuidValueConverter() required UuidValue category,
    required Money sum,
  }) = InputOperationResponse;

  const factory OperationResponse.output({
    @UuidValueConverter() required UuidValue id,
    @Default(false) bool deleted,
    required DateTime date,
    @UuidValueConverter() required UuidValue account,
    @UuidValueConverter() required UuidValue category,
    required Money sum,
  }) = OutputOperationResponse;

  const factory OperationResponse.transfer({
    @UuidValueConverter() required UuidValue id,
    @Default(false) bool deleted,
    required DateTime date,
    @UuidValueConverter() required UuidValue account,
    @UuidValueConverter() required UuidValue recAccount,
    required Money sum,
  }) = TransferOperationResponse;

  const factory OperationResponse.exchange({
    @UuidValueConverter() required UuidValue id,
    @Default(false) bool deleted,
    required DateTime date,
    @UuidValueConverter() required UuidValue account,
    required Money sum,
    required Money recSum,
  }) = ExchangeOperationResponse;

  factory OperationResponse.fromJson(Map<String, Object?> json) => _$OperationResponseFromJson(json);
}

@freezed
sealed class CreateOperationRequest with _$CreateOperationRequest {
  const factory CreateOperationRequest.input({
    required DateTime date,
    @UuidValueConverter() required UuidValue account,
    @UuidValueConverter() required UuidValue category,
    required Money sum,
  }) = InputCreateOperationRequest;

  const factory CreateOperationRequest.output({
    required DateTime date,
    @UuidValueConverter() required UuidValue account,
    @UuidValueConverter() required UuidValue category,
    required Money sum,
  }) = OutputCreateOperationRequest;

  const factory CreateOperationRequest.transfer({
    required DateTime date,
    @UuidValueConverter() required UuidValue account,
    @UuidValueConverter() required UuidValue recAccount,
    required Money sum,
  }) = TransferCreateOperationRequest;

  const factory CreateOperationRequest.exchange({
    required DateTime date,
    @UuidValueConverter() required UuidValue account,
    required Money sum,
    required Money recSum,
  }) = ExchangeCreateOperationRequest;

  factory CreateOperationRequest.fromJson(Map<String, Object?> json) =>
      _$CreateOperationRequestFromJson(json);
}

@freezed
sealed class UpdateOperationRequest with _$UpdateOperationRequest{
  const UpdateOperationRequest._();

  const factory UpdateOperationRequest.input({
    @UuidValueConverter() required UuidValue id,
    @Default(false) bool deleted,
    required DateTime date,
    @UuidValueConverter() required UuidValue account,
    @UuidValueConverter() required UuidValue category,
    required Money sum,
  }) = InputUpdateOperationRequest;

  const factory UpdateOperationRequest.output({
    @UuidValueConverter() required UuidValue id,
    @Default(false) bool deleted,
    required DateTime date,
    @UuidValueConverter() required UuidValue account,
    @UuidValueConverter() required UuidValue category,
    required Money sum,
  }) = OutputUpdateOperationRequest;

  const factory UpdateOperationRequest.transfer({
    @UuidValueConverter() required UuidValue id,
    @Default(false) bool deleted,
    required DateTime date,
    @UuidValueConverter() required UuidValue account,
    @UuidValueConverter() required UuidValue recAccount,
    required Money sum,
  }) = TransferUpdateOperationRequest;

  const factory UpdateOperationRequest.exchange({
    @UuidValueConverter() required UuidValue id,
    @Default(false) bool deleted,
    required DateTime date,
    @UuidValueConverter() required UuidValue account,
    required Money sum,
    required Money recSum,
  }) = ExchangeUpdateOperationRequest;

  factory UpdateOperationRequest.fromJson(Map<String, Object?> json) => _$UpdateOperationRequestFromJson(json);
}