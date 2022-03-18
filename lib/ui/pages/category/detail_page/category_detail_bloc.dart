import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';
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

class ChangeOperations extends CategoryDetailEvent{
  final List<Operation> operations;

  ChangeOperations(this.operations);
}

class CategoryDetailState {
  final String title;
  final int budget;
  final BudgetType budgetType;
  final List<Operation> operations;

  CategoryDetailState({
    required this.budgetType,
    required this.title,
    required this.budget,
    required this.operations,
  });

  CategoryDetailState.initial()
      : budgetType = BudgetType.MONTH,
        title = '',
        budget = 0,
        operations = [];

  CategoryDetailState.category({
    required Category category,
    required CategoryDetailState state,
  })  : title = category.title,
        budget = category.budget,
        budgetType = category.budgetType,
        operations = state.operations;

  CategoryDetailState.operations({
    required List<Operation> operations,
    required CategoryDetailState state,
  })  : title = state.title,
        budget = state.budget,
        budgetType = state.budgetType,
        operations = operations;
}

class CategoryDetailBloc
    extends Bloc<CategoryDetailEvent, CategoryDetailState> {
  final DataRepository _repository;

  StreamSubscription<Category>? _subCategory;
  StreamSubscription? _subOperations;

  CategoryDetailBloc(this._repository) : super(CategoryDetailState.initial()) {
    on<Fetch>(_fetch);
    on<ChangeCategory>(_changeCategory);
    on<ChangeOperations>(_changeOperations);
  }

  void _fetch(Fetch event, Emitter<CategoryDetailState> emit) {
    _subCategory =
        _repository.categories.watchById(event.categoryId).listen((category) {
      add(ChangeCategory(category));
    });
    _subOperations = _repository.operations
        .watchAllByCategory(event.categoryId).listen((items) {
          add(ChangeOperations(items));
    });
  }

  void _changeCategory(
      ChangeCategory event, Emitter<CategoryDetailState> emit) {
    emit(CategoryDetailState.category(category: event.category, state: state));
  }

  void _changeOperations(ChangeOperations event, Emitter<CategoryDetailState> emit) {
    emit(CategoryDetailState.operations(operations: event.operations, state: state));
  }

  @override
  Future<void> close() async {
    await _subCategory?.cancel();
    await _subOperations?.cancel();
    return super.close();
  }
}
