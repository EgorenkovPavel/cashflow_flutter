import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

part 'budget_bloc.freezed.dart';

@freezed
class BudgetEvent with _$BudgetEvent {
  const factory BudgetEvent.fetch({required OperationType operationtype}) =
      _FetchBudgetEvent;

  const factory BudgetEvent.previousYear() = _PreviousYearBudgetEvent;

  const factory BudgetEvent.nextYear() = _NextYearBudgetEvent;

  const factory BudgetEvent.showAll({required BudgetType budgetType}) =
      _ShowAllBudgetEvent;

  const factory BudgetEvent.changeItems({
    required List<CategoryCashflow> items,
  }) = _ChangeItemsBudgetEvent;
}

@freezed
class BudgetState with _$BudgetState {
  const factory BudgetState({
    required DateTime date,
    required OperationType operationType,
    required List<CategoryCashflow> itemsMonthBudget,
    required List<CategoryCashflow> itemsYearBudget,
    required List<CategoryCashflow> itemsAll,
    required bool showAllMonthBudget,
    required bool showAllYearBudget,
  }) = _BudgetState;
}

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final DataRepository repo;

  StreamSubscription<List<CategoryCashflow>>? _subscription;

  BudgetBloc(this.repo)
      : super(BudgetState(
          itemsAll: [],
          itemsMonthBudget: [],
          itemsYearBudget: [],
          showAllMonthBudget: false,
          showAllYearBudget: false,
          date: DateTime.now(),
          operationType: OperationType.INPUT,
        )) {
    on<BudgetEvent>((event, emitter) => event.map(
          fetch: (event) => _fetch(event, emitter),
          previousYear: (event) => _previousYear(event, emitter),
          nextYear: (event) => _nextYear(event, emitter),
          showAll: (event) => _showAll(event, emitter),
          changeItems: (event) => _changeItems(event, emitter),
        ));
  }

  void _fetch(_FetchBudgetEvent event, Emitter<BudgetState> emit) {
    emit(state.copyWith(operationType: event.operationtype));
    _watchCashflow(state.date, event.operationtype);
  }

  void _previousYear(
    _PreviousYearBudgetEvent event,
    Emitter<BudgetState> emit,
  ) {
    final date = state.date.month == 1
        ? DateTime(state.date.year - 1, 12)
        : DateTime(state.date.year, state.date.month - 1);

    emit(state.copyWith(date: date));
    _watchCashflow(date, state.operationType);
  }

  void _nextYear(_NextYearBudgetEvent event, Emitter<BudgetState> emit) {
    final date = state.date.month == 12
        ? DateTime(state.date.year + 1, 1)
        : DateTime(state.date.year, state.date.month + 1);

    emit(state.copyWith(date: date));
    _watchCashflow(date, state.operationType);
  }

  void _showAll(_ShowAllBudgetEvent event, Emitter<BudgetState> emit) {
    if (event.budgetType == BudgetType.MONTH) {
      emit(state.copyWith(
        showAllMonthBudget: !state.showAllMonthBudget,
      ));
    } else if (event.budgetType == BudgetType.YEAR) {
      emit(state.copyWith(
        showAllYearBudget: !state.showAllYearBudget,
      ));
    }
    add(BudgetEvent.changeItems(items: state.itemsAll));
  }

  Future<void> _watchCashflow(DateTime date, OperationType type) async {
    await _subscription?.cancel();
    _subscription =
        repo.categories.watchCashflowByType(date, type).listen((items) {
      items.sort((c1, c2) => c2.monthCashflow - c1.monthCashflow);

      add(BudgetEvent.changeItems(items: items));
    });
  }

  void _changeItems(_ChangeItemsBudgetEvent event, Emitter<BudgetState> emit) {
    emit(state.copyWith(
      itemsAll: event.items,
      itemsMonthBudget: event.items
          .where((element) => element.category.budgetType == BudgetType.MONTH)
          .where((element) =>
              state.showAllMonthBudget || element.monthCashflow > 0)
          .toList(),
      itemsYearBudget: event.items
          .where((element) => element.category.budgetType == BudgetType.YEAR)
          .where(
            (element) => state.showAllYearBudget || element.yearCashflow > 0,
          )
          .toList(),
    ));
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }
}
