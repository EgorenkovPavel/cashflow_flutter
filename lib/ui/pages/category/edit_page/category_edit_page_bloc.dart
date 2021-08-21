import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';

class CategoryState {
  final String title;
  final int budget;
  final BudgetType budgetType;

  CategoryState(
      {required this.budgetType, required this.title, required this.budget});
}

class CategoryBloc extends Cubit<CategoryState> {
  final Repository _repository;

  StreamSubscription<Category>? sub;

  CategoryBloc(this._repository)
      : super(
            CategoryState(title: '', budget: 0, budgetType: BudgetType.MONTH));

  Future<void> fetch(int id) async {
    sub = _repository.watchCategoryById(id).listen((event) {
      emit(CategoryState(
          title: event.title,
          budget: event.budget,
          budgetType: event.budgetType));
    });
  }

  @override
  Future<void> close() async {
    sub?.cancel();
    return super.close();
  }
}
