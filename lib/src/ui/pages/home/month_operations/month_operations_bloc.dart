import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/src/domain/models.dart';

part 'month_operations_bloc.freezed.dart';

@freezed
class MonthOperationsEvent with _$MonthOperationsEvent {
  const factory MonthOperationsEvent.fetch({
    required OperationType operationType,
  }) = _FetchMonthOperationsEvent;

  const factory MonthOperationsEvent.changeCategories({
    required OperationType operationType,
    required List<CategoryCashflow> categories,
  }) = _ChangeCategoriesMonthOperationsEvent;
}

@freezed
class MonthOperationsState with _$MonthOperationsState {
  const factory MonthOperationsState({
    required Map<OperationType, int> cashflow,
    required Map<OperationType, int> budget,
  }) = _MonthOperationsState;
}

class MonthOperationsBloc
    extends Bloc<MonthOperationsEvent, MonthOperationsState> {
  final DataRepository _repository;
  StreamSubscription? _sub;

  MonthOperationsBloc(this._repository)
      : super(const MonthOperationsState(
          budget: {},
          cashflow: {},
        )) {
    on<MonthOperationsEvent>((event, emitter) => event.map(
          fetch: (event) => _fetch(event, emitter),
          changeCategories: (event) => _changeCategories(event, emitter),
        ));
  }

  void _fetch(
    _FetchMonthOperationsEvent event,
    Emitter<MonthOperationsState> emit,
  ) {
    _sub = _repository.categories
        .watchCashflowByType(DateTime.now(), event.operationType)
        .listen((items) {
      add(MonthOperationsEvent.changeCategories(
        categories: items,
        operationType: event.operationType,
      ));
    });
  }

  void _changeCategories(
    _ChangeCategoriesMonthOperationsEvent event,
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
