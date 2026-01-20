import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class OperationListFilter extends Equatable {
  //TODO to freezed
  final DateTimeRange? period;
  final Set<int> accountIds;
  final Set<int> categoryIds;

  const OperationListFilter({
    this.period,
    this.accountIds = const {},
    this.categoryIds = const {},
  });

  @override
  List<Object?> get props => [period, accountIds, categoryIds];

  OperationListFilter copyWith({
    DateTimeRange? period,
    Set<int>? accountIds,
    Set<int>? categoryIds,
  }) =>
      OperationListFilter(
        period: period ?? this.period,
        accountIds: accountIds ?? this.accountIds,
        categoryIds: categoryIds ?? this.categoryIds,
      );
}
