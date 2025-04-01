import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class OperationListFilter extends Equatable {
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
}
