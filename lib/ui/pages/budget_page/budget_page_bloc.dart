import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/data_source.dart';
import 'package:money_tracker/domain/models.dart';

class BudgetPageState {
  final DateTime date;
  final List<CategoryCashflow> itemsMonthBudget;
  final List<CategoryCashflow> itemsYearBudget;
  final List<CategoryCashflow> itemsAll;

  final bool showAllMonthBudget;
  final bool showAllYearBudget;

  BudgetPageState(
      {this.itemsYearBudget = const [],
      this.showAllYearBudget = false,
      this.showAllMonthBudget = false,
      required this.date,
      this.itemsMonthBudget = const [],
      this.itemsAll = const []});
}

class BudgetPageBloc extends Cubit<BudgetPageState> {
  final DataSource repo;

  DateTime _date = DateTime(DateTime.now().year, DateTime.now().month);
  late OperationType _type;
  List<CategoryCashflow> _items = [];
  bool _showAllMonthBudget = false;
  bool _showAllYearBudget = false;

  StreamSubscription<List<CategoryCashflow>>? _subscription;

  BudgetPageBloc(this.repo) : super(BudgetPageState(date: DateTime.now()));

  void fetch(OperationType type) {
    _type = type;
    watchCashflow();
  }

  void onBackPressed() {
    if (_date.month == 1) {
      _date = DateTime(_date.year - 1, 12);
    } else {
      _date = DateTime(_date.year, _date.month - 1);
    }
    watchCashflow();
  }

  void onForwardPressed() {
    if (_date.month == 12) {
      _date = DateTime(_date.year + 1, 1);
    } else {
      _date = DateTime(_date.year, _date.month + 1);
    }
    watchCashflow();
  }

  void changeShowAll(BudgetType budgetType){
    if (budgetType == BudgetType.MONTH) {
      _showAllMonthBudget = !_showAllMonthBudget;
    } else if (budgetType == BudgetType.YEAR) {
      _showAllYearBudget = !_showAllYearBudget;
    }
    _emitState();
  }

  Future<void> watchCashflow() async {
    await _subscription?.cancel();
    _subscription =
        repo.watchCategoryCashflowByType(_date, _type).listen((items) {
      items.sort((c1, c2) => c2.monthCashflow - c1.monthCashflow);

      _items = items;
      _emitState();
    });
  }

  void _emitState() {
    emit(BudgetPageState(
      date: _date,
      showAllMonthBudget: _showAllMonthBudget,
      showAllYearBudget: _showAllYearBudget,
      itemsMonthBudget: _items
          .where((element) => element.category.budgetType == BudgetType.MONTH)
          .where((element) => _showAllMonthBudget || element.monthCashflow > 0)
          .toList(),
      itemsYearBudget: _items
          .where((element) => element.category.budgetType == BudgetType.YEAR)
          .where((element) => _showAllYearBudget || element.monthCashflow > 0)
          .toList(),
      itemsAll: _items
    ));
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }
}
