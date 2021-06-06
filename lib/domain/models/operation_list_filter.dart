import 'package:flutter/material.dart';

class OperationListFilter {
  final DateTimeRange? date;
  final Set<int> accountsIds;
  final Set<int> categoriesIds;

  const OperationListFilter({
    this.date,
    this.accountsIds = const {},
    this.categoriesIds = const {},
  });

  OperationListFilter copyWith({
    DateTimeRange? date,
    Set<int>? accountsIds,
    Set<int>? categoriesIds,
  }) =>
      OperationListFilter(
        date: date ?? this.date,
        accountsIds: accountsIds ?? this.accountsIds,
        categoriesIds: categoriesIds ?? this.categoriesIds,
      );
}
