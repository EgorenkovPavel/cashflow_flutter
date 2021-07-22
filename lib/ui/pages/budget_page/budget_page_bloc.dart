import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';

class BudgetPageState {
  final DateTime date;
  final List<CategoryCashflow> items;

  BudgetPageState({required this.date, required this.items});
}

class BudgetPageBloc extends Cubit<BudgetPageState> {
  final Repository repo;

  DateTime _date =DateTime(DateTime.now().year, DateTime.now().month);
  late OperationType _type;

  StreamSubscription<List<CategoryCashflow>>? _subscription;

  BudgetPageBloc(this.repo)
      : super(BudgetPageState(date: DateTime.now(), items: []));

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

  Future<void> watchCashflow() async {
    await _subscription?.cancel();
    _subscription = repo.watchCategoryCashflowByType(_date, _type).listen((items) {
      items.sort((c1, c2) => c2.monthCashflow - c1.monthCashflow);
      emit(BudgetPageState(date: _date, items: items));
    });
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }
}
