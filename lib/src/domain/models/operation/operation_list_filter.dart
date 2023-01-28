import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../account/account.dart';
import '../category/category.dart';

part 'operation_list_filter.freezed.dart';

@freezed
class OperationListFilter with _$OperationListFilter {
  const factory OperationListFilter({
    DateTimeRange? period,
    @Default({}) Set<Account> accounts,
    @Default({}) Set<Category> categories,
  }) = _OperationListFilter;
}
