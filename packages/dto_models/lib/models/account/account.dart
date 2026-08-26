import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../uuid_converter.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
sealed class BaseAccountResponse with _$BaseAccountResponse {
  const factory BaseAccountResponse.account({
    @UuidValueConverter() required UuidValue id,
    required String title,
    @UuidValueConverter() required UuidValue userId,
  }) = AccountResponse;

  const factory BaseAccountResponse.debt({
    @UuidValueConverter() required UuidValue id,
    required String title,
    @UuidValueConverter() required UuidValue userId,
  }) = DebtResponse;

  factory BaseAccountResponse.fromJson(Map<String, Object?> json) =>
      _$BaseAccountResponseFromJson(json);
}

@freezed
sealed class CreateBaseAccountRequest with _$CreateBaseAccountRequest {
  const factory CreateBaseAccountRequest.account({
    required String title,
    @UuidValueConverter() required UuidValue userId,
  }) = CreateAccountRequest;

  const factory CreateBaseAccountRequest.debt({
    required String title,
    @UuidValueConverter() required UuidValue userId,
  }) = CreateDebtRequest;

  factory CreateBaseAccountRequest.fromJson(Map<String, Object?> json) =>
      _$CreateBaseAccountRequestFromJson(json);
}

@freezed
abstract class UpdateBaseAccountRequest with _$UpdateBaseAccountRequest {
  const UpdateBaseAccountRequest._();

  const factory UpdateBaseAccountRequest({
    @UuidValueConverter() required UuidValue id,
    required String name,
  }) = _UpdateBaseAccountRequest;

  factory UpdateBaseAccountRequest.fromJson(Map<String, Object?> json) =>
      _$UpdateBaseAccountRequestFromJson(json);
}
