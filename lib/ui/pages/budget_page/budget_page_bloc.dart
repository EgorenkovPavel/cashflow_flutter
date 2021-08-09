import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';

class BudgetPageState {
  final DateTime date;
  final List<CategoryCashflow> items;
  final bool showAll;

  BudgetPageState({required this.showAll, required this.date, required this.items});
}

class BudgetPageBloc extends Cubit<BudgetPageState> {
  final Repository repo;

  DateTime _date = DateTime(DateTime.now().year, DateTime.now().month);
  late OperationType _type;
  bool _showAll = false;
  List<CategoryCashflow> _items = [];

  StreamSubscription<List<CategoryCashflow>>? _subscription;

  BudgetPageBloc(this.repo)
      : super(BudgetPageState(date: DateTime.now(), items: [], showAll: false));

  void fetch(OperationType type) {
    _type = type;
    watchCashflow();
  }

  void onBackPressed(){
    if(_date.month == 1){
      _date = DateTime(_date.year - 1, 12);
    }else{
      _date = DateTime(_date.year, _date.month - 1);
    }
    watchCashflow();
  }

  void onForwardPressed(){
    if(_date.month == 12){
      _date = DateTime(_date.year + 1, 1);
    }else{
      _date = DateTime(_date.year, _date.month + 1);
    }
    watchCashflow();
  }

  void expand(){
    _showAll = true;
    _emitState();
  }

  void collapse(){
    _showAll = false;
    _emitState();
  }

  Future<void> watchCashflow() async {
    await _subscription?.cancel();
    _subscription = repo.watchCategoryCashflowByType(_date, _type).listen((items) {
      items.sort((c1, c2) => c2.monthCashflow - c1.monthCashflow);

      _items = items;
      _emitState();
    });
  }

  void _emitState(){
    emit(BudgetPageState(date: _date, items: _items.where((element) => _showAll || element.monthCashflow > 0).toList(), showAll: _showAll));
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }
}
