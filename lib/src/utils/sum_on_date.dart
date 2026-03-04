import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/utils/sum.dart';

part 'sum_on_date.freezed.dart';

@freezed
abstract class SumOnDate with _$SumOnDate {
  const factory SumOnDate(DateTime date, int sum) = _SumOnDate;

}