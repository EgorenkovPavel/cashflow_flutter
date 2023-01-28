import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../account/account.dart';
import '../category/category.dart';

class OperationListFilter extends Equatable{
  final DateTimeRange? period;
  final Set<Account> accounts;
  final Set<Category> categories;

  const OperationListFilter({
    this.period,
    required this.accounts,
    required this.categories,
  });

  const OperationListFilter.empty()
      : period = null,
        accounts = const {},
        categories = const {};

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

  @override
  List<Object?> get props => [period, accounts, categories];
}
