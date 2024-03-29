import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/domain/models.dart';

class CategoryState {
  final String title;
  final int budget;
  final BudgetType budgetType;
  final List<SumOnDate> cashflows;

  CategoryState(
      {this.cashflows = const [],
      this.budgetType = BudgetType.MONTH,
      this.title = '',
      this.budget = 0});

  CategoryState copyWith(
      {List<SumOnDate>? cashflows,
      BudgetType? budgetType,
      String? title,
      int? budget}) {
    return CategoryState(
      title: title ?? this.title,
      budget: budget ?? this.budget,
      budgetType: budgetType ?? this.budgetType,
      cashflows: cashflows ?? this.cashflows,
    );
  }
}

class CategoryBloc extends Cubit<CategoryState> {
  final LocalSource _repository;

  StreamSubscription<Category>? subCategory;

  CategoryBloc(this._repository) : super(CategoryState());

  void fetch(int id) {
    subCategory = _repository.categories.watchById(id).listen((event) {
      emit(state.copyWith(
          title: event.title,
          budget: event.budget,
          budgetType: event.budgetType));
    });
  }

  @override
  Future<void> close() async {
    await subCategory?.cancel();
    return super.close();
  }
}
