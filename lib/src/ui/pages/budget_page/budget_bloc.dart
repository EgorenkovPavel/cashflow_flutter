import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interfaces/data_repository.dart';
import 'package:money_tracker/src/domain/models.dart';

part 'budget_bloc.freezed.dart';

@freezed
class BudgetEvent with _$BudgetEvent {
  const factory BudgetEvent.fetch({required CategoryType type}) =
      _FetchBudgetEvent;

  const factory BudgetEvent.previousYear() = _PreviousYearBudgetEvent;

  const factory BudgetEvent.nextYear() = _NextYearBudgetEvent;

  const factory BudgetEvent.showAll({required BudgetType budgetType}) =
      _ShowAllBudgetEvent;

  const factory BudgetEvent.changeItems({
    required List<CategoryCashFlow> items,
  }) = _ChangeItemsBudgetEvent;
}

@freezed
class BudgetState with _$BudgetState {
  const factory BudgetState({
    required DateTime date,
    required CategoryType type,
    required List<CategoryCashFlow> itemsMonthBudget,
    required List<CategoryCashFlow> itemsYearBudget,
    required List<CategoryCashFlow> itemsAll,
    required bool showAllMonthBudget,
    required bool showAllYearBudget,
  }) = _BudgetState;
}

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final DataRepository repo;

  StreamSubscription<List<CategoryCashFlow>>? _subscription;

  BudgetBloc(this.repo)
      : super(BudgetState(
          itemsAll: [],
          itemsMonthBudget: [],
          itemsYearBudget: [],
          showAllMonthBudget: false,
          showAllYearBudget: false,
          date: DateTime.now(),
          type: CategoryType.INPUT,
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
    emit(state.copyWith(type: event.type));
    _watchCashflow(state.date, event.type);
  }

  void _previousYear(
    _PreviousYearBudgetEvent event,
    Emitter<BudgetState> emit,
  ) {
    final date = state.date.month == 1
        ? DateTime(state.date.year - 1, 12)
        : DateTime(state.date.year, state.date.month - 1);

    emit(state.copyWith(date: date));
    _watchCashflow(date, state.type);
  }

  void _nextYear(_NextYearBudgetEvent event, Emitter<BudgetState> emit) {
    final date = state.date.month == 12
        ? DateTime(state.date.year + 1, 1)
        : DateTime(state.date.year, state.date.month + 1);

    emit(state.copyWith(date: date));
    _watchCashflow(date, state.type);
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

  Future<void> _watchCashflow(DateTime date, CategoryType type) async {
    await _subscription?.cancel();
    _subscription =
        repo.watchCashFlowByType(date, type).listen((items) {
      //items.sort((c1, c2) => c2.monthCashflow - c1.monthCashflow); //TODO

      add(BudgetEvent.changeItems(items: items));
    });
  }

  void _changeItems(_ChangeItemsBudgetEvent event, Emitter<BudgetState> emit) {
    emit(state.copyWith(
      itemsAll: event.items,
      itemsMonthBudget: event.items
          .where((element) => element.budgetType == BudgetType.MONTH)
          .where((element) =>
              state.showAllMonthBudget || !element.monthCashFlow.isEmpty)
          .toList(),
      itemsYearBudget: event.items
          .where((element) => element.budgetType == BudgetType.YEAR)
          .where(
            (element) => state.showAllYearBudget || !element.yearCashFlow.isEmpty,
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
