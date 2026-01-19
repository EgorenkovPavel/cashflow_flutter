import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

@freezed
sealed class BaseAccount with _$BaseAccount {
  const factory BaseAccount.account({
    @Default(0) int id,
    @Default('') String cloudId,
    required String title,
    required int? userId,
  }) = Account;

  const factory BaseAccount.debt({
    @Default(0) int id,
    @Default('') String cloudId,
    required String title,
    required int? userId,
  }) = Debt;
}
