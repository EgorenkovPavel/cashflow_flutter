import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_list_filter.freezed.dart';

@freezed
abstract class OperationListFilter with _$OperationListFilter {
  const factory OperationListFilter({
    DateTimeRange? period,
    @Default({}) Set<int> accountIds,
    @Default({}) Set<int> categoryIds,
  }) = _OperationListFilter;
}
