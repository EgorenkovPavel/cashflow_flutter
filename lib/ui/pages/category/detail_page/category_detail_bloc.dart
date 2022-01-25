import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/domain/models.dart';

abstract class CategoryDetailEvent {}

class Fetch extends CategoryDetailEvent {
  final int categoryId;

  Fetch(this.categoryId);
}

class ChangeCategory extends CategoryDetailEvent {
  final Category category;

  ChangeCategory(this.category);
}

class CategoryDetailState {
  final String title;
  final int budget;
  final BudgetType budgetType;

  CategoryDetailState(
      {required this.budgetType, required this.title, required this.budget});

  CategoryDetailState.initial(
      {this.budgetType = BudgetType.MONTH, this.title = '', this.budget = 0});

  CategoryDetailState.category({
    required Category category,
  }) :
      title = category.title,
      budget = category.budget,
      budgetType = category.budgetType;
}

class CategoryDetailBloc
    extends Bloc<CategoryDetailEvent, CategoryDetailState> {
  final LocalSource _repository;

  StreamSubscription<Category>? _subCategory;

  CategoryDetailBloc(this._repository) : super(CategoryDetailState.initial()) {
    on<Fetch>(_fetch);
    on<ChangeCategory>(_changeCategory);
  }

  void _fetch(Fetch event, Emitter<CategoryDetailState> emit) {
    _subCategory =
        _repository.categories.watchById(event.categoryId).listen((category) {
      add(ChangeCategory(category));
    });
  }

  void _changeCategory(
      ChangeCategory event, Emitter<CategoryDetailState> emit) {
    emit(CategoryDetailState.category(category: event.category));
  }

  @override
  Future<void> close() async {
    await _subCategory?.cancel();
    return super.close();
  }
}
