import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/interfaces/data_source.dart';
import 'package:money_tracker/domain/models.dart';

abstract class BudgetEvent {}

class Fetch extends BudgetEvent {
  final OperationType operationtype;

  Fetch(this.operationtype);
}

class PreviousYear extends BudgetEvent {}

class NextYear extends BudgetEvent {}

class ShowAll extends BudgetEvent {
  final BudgetType budgetType;

  ShowAll(this.budgetType);
}

class ChangeItems extends BudgetEvent{
  final List<CategoryCashflow> items;

  ChangeItems(this.items);
}

class BudgetState {
  final DateTime date;
  final OperationType operationType;
  final List<CategoryCashflow> itemsMonthBudget;
  final List<CategoryCashflow> itemsYearBudget;
  final List<CategoryCashflow> itemsAll;

  final bool showAllMonthBudget;
  final bool showAllYearBudget;

  BudgetState.initial(
      {required this.operationType,
      this.itemsYearBudget = const [],
      this.showAllYearBudget = false,
      this.showAllMonthBudget = false,
      required this.date,
      this.itemsMonthBudget = const [],
      this.itemsAll = const []});

  BudgetState.state(
      {required BudgetState state,
      OperationType? operationType,
      List<CategoryCashflow>? itemsYearBudget,
      bool? showAllYearBudget = false,
      bool? showAllMonthBudget = false,
      DateTime? date,
      List<CategoryCashflow>? itemsMonthBudget,
      List<CategoryCashflow>? itemsAll})
      : operationType = operationType ?? state.operationType,
        date = date ?? state.date,
        showAllMonthBudget = showAllMonthBudget ?? state.showAllMonthBudget,
        showAllYearBudget = showAllYearBudget ?? state.showAllYearBudget,
        itemsAll = itemsAll ?? state.itemsAll,
        itemsYearBudget = itemsYearBudget ?? state.itemsYearBudget,
        itemsMonthBudget = itemsMonthBudget ?? state.itemsMonthBudget;
}

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  final DataSource repo;

  StreamSubscription<List<CategoryCashflow>>? _subscription;

  BudgetBloc(this.repo)
      : super(BudgetState.initial(
            date: DateTime.now(), operationType: OperationType.INPUT)) {
    on<Fetch>(_fetch);
    on<PreviousYear>(_previousYear);
    on<NextYear>(_nextYear);
    on<ShowAll>(_showAll);
    on<ChangeItems>(_changeItems);
  }

  void _fetch(Fetch event, Emitter<BudgetState> emit) {
    emit(BudgetState.state(state: state, operationType: event.operationtype));
    _watchCashflow(state.date, event.operationtype);
  }

  void _previousYear(PreviousYear event, Emitter<BudgetState> emit) {
    final _date = state.date.month == 1
        ? DateTime(state.date.year - 1, 12)
        : DateTime(state.date.year, state.date.month - 1);

    emit(BudgetState.state(state: state, date: _date));
    _watchCashflow(_date, state.operationType);
  }

  void _nextYear(NextYear event, Emitter<BudgetState> emit) {
    final _date = state.date.month == 12
        ? DateTime(state.date.year + 1, 1)
        : DateTime(state.date.year, state.date.month + 1);

    emit(BudgetState.state(state: state, date: _date));
    _watchCashflow(_date, state.operationType);
  }

  void _showAll(ShowAll event, Emitter<BudgetState> emit) {
    if (event.budgetType == BudgetType.MONTH) {
      emit(BudgetState.state(state: state, showAllMonthBudget: !state.showAllMonthBudget));
    } else if (event.budgetType == BudgetType.YEAR) {
      emit(BudgetState.state(state: state, showAllYearBudget: !state.showAllYearBudget));
    }
    add(ChangeItems(state.itemsAll));
  }

  Future<void> _watchCashflow(DateTime date, OperationType type) async {
    await _subscription?.cancel();
    _subscription =
        repo.categories.watchCashflowByType(date, type).listen((items) {
      items.sort((c1, c2) => c2.monthCashflow - c1.monthCashflow);

      add(ChangeItems(items));
    });
  }

  void _changeItems(ChangeItems event, Emitter<BudgetState> emit){
    emit(BudgetState.state(state: state,
    itemsAll: event.items,
      itemsMonthBudget: event.items
          .where((element) => element.category.budgetType == BudgetType.MONTH)
          .where(
              (element) => state.showAllMonthBudget || element.monthCashflow > 0)
          .toList(),
      itemsYearBudget: event.items
          .where((element) => element.category.budgetType == BudgetType.YEAR)
          .where((element) => state.showAllYearBudget || element.yearCashflow > 0)
          .toList()
    ));
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }
}
