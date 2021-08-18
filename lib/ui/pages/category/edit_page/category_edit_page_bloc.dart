import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';

abstract class CategoryState {}

class DateState extends CategoryState {
  final String title;
  final int budget;
  final BudgetType budgetType;

  DateState(
      {required this.budgetType, required this.title, required this.budget});
}

class Close extends CategoryState {}

class CategoryBloc extends Cubit<CategoryState> {
  final Repository _repository;

  StreamSubscription<Category>? sub;

  CategoryBloc(this._repository)
      : super(DateState(title: '', budget: 0, budgetType: BudgetType.MONTH));

  Future<void> fetch(int id) async {
    sub = _repository.watchCategoryById(id).listen((event) {
      emit(DateState(title: event.title, budget: event.budget, budgetType: event.budgetType));
    });
  }

  @override
  Future<void> close() async {
    sub?.cancel();
    return super.close();
  }
}
