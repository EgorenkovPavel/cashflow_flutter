import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

abstract class MonthOperationsEvent {}

class Fetch extends MonthOperationsEvent {
  final OperationType operationType;

  Fetch(this.operationType);
}

class ChangeCategories extends MonthOperationsEvent {
  final List<CategoryCashflow> categories;
  final OperationType operationType;

  ChangeCategories({required this.operationType, required this.categories});
}

class MonthOperationsState {
  final Map<OperationType, int> cashflow;
  final Map<OperationType, int> budget;

  MonthOperationsState({
    required this.cashflow,
    required this.budget,
  });

  MonthOperationsState.initial()
      : budget = Map.fromIterable(OperationType.values, value: (_) => 0),
        cashflow = Map.fromIterable(OperationType.values, value: (_) => 0);
}

class MonthOperationsBloc
    extends Bloc<MonthOperationsEvent, MonthOperationsState> {
  final DataRepository _repository;
  StreamSubscription? _sub;

  MonthOperationsBloc(this._repository)
      : super(MonthOperationsState.initial()) {
    on<Fetch>(_fetch);
    on<ChangeCategories>(_changeCategories);
  }

  void _fetch(Fetch event, Emitter<MonthOperationsState> emit) {
    _sub = _repository.categories
        .watchCashflowByType(DateTime.now(), event.operationType)
        .listen((items) {
      add(ChangeCategories(
        categories: items,
        operationType: event.operationType,
      ));
    });
  }

  void _changeCategories(
    ChangeCategories event,
    Emitter<MonthOperationsState> emit,
  ) {
    emit(MonthOperationsState(
      cashflow: Map.from(state.cashflow)
        ..update(event.operationType, (_) => _calcCashflow(event.categories)),
      budget: Map.from(state.budget)
        ..update(event.operationType, (_) => _calcBudget(event.categories)),
    ));
  }

  int _calcCashflow(List<CategoryCashflow> list) {
    return list.fold(
      0,
      (previousValue, element) => previousValue + element.monthCashflow,
    );
  }

  int _calcBudget(List<CategoryCashflow> list) {
    return list
            .where((element) => element.category.budgetType == BudgetType.MONTH)
            .fold<int>(
              0,
              (previousValue, element) =>
                  previousValue + element.category.budget,
            ) +
        list
            .where((element) => element.category.budgetType == BudgetType.YEAR)
            .fold<int>(
              0,
              (previousValue, element) =>
                  previousValue + (element.category.budget / 12).floor(),
            );
  }

  @override
  Future<void> close() {
    _sub?.cancel();

    return super.close();
  }
}
