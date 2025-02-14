import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../account/account.dart';
import '../category/category.dart';



class OperationListFilter extends Equatable {
  final DateTimeRange? period;
  final Set<BaseAccount> accounts;
  final Set<Category> categories;

  const OperationListFilter({
    this.period,
    this.accounts = const {},
    this.categories = const {},
  });

  @override
  List<Object?> get props => [period, accounts, categories];
}
