import 'package:freezed_annotation/freezed_annotation.dart';

part 'sum_on_date.freezed.dart';

@freezed
class SumOnDate with _$SumOnDate {
  const factory SumOnDate({
    required DateTime date,
    required int sum,
  }) = _SumOnDate;
}
