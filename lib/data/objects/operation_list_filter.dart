import 'package:flutter/material.dart';

class OperationListFilter {
  final DateTimeRange date;
  final Set<int> accountsIds;
  final Set<int> categoriesIds;

  OperationListFilter({this.date, this.accountsIds, this.categoriesIds});

  OperationListFilter copyWith({
          DateTimeRange date, Set<int> accountsIds, Set<int> categoriesIds}) =>
      OperationListFilter(
          date: date ?? this.date,
          accountsIds: accountsIds ?? this.accountsIds,
          categoriesIds: categoriesIds ?? this.categoriesIds);
}
