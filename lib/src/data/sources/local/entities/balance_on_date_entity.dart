import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_on_date_entity.freezed.dart';

@freezed
class BalanceOnDate with _$BalanceOnDate {
  const factory BalanceOnDate({
    required DateTime date,
    required int sum,
  }) = _BalanceOnDate;
}
