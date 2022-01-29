import 'package:flutter/material.dart';
import 'package:money_tracker/domain/models.dart';

class OperationListFilter {
  final DateTimeRange? period;
  final Set<Account> accounts;
  final Set<Category> categories;

  const OperationListFilter({
    this.period,
    required this.accounts,
    required this.categories,
  });

  OperationListFilter.empty()
      : period = null,
        accounts = {},
        categories = {};

  OperationListFilter copyWith({
    DateTimeRange? period,
    Set<Account>? accounts,
    Set<Category>? categories,
  }) =>
      OperationListFilter(
        period: period ?? this.period,
        accounts: accounts ?? this.accounts,
        categories: categories ?? this.categories,
      );
}
