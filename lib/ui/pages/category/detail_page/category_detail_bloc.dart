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
  final List<SumOnDate> cashflows;

  CategoryDetailState({this.cashflows = const [],
    this.budgetType = BudgetType.MONTH,
    this.title = '',
    this.budget = 0});

  CategoryDetailState copyWith({List<SumOnDate>? cashflows,
    BudgetType? budgetType,
    String? title,
    int? budget}) {
    return CategoryDetailState(
      title: title ?? this.title,
      budget: budget ?? this.budget,
      budgetType: budgetType ?? this.budgetType,
      cashflows: cashflows ?? this.cashflows,
    );
  }
}

class CategoryDetailBloc
    extends Bloc<CategoryDetailEvent, CategoryDetailState> {
  final LocalSource _repository;

  StreamSubscription<Category>? _subCategory;

  CategoryDetailBloc(this._repository) : super(CategoryDetailState()) {
    on<Fetch>(_fetch);
    on<ChangeCategory>(_changeCategory);
  }

  void _fetch(Fetch event, Emitter<CategoryDetailState> emit) {
    _subCategory =
        _repository.categories.watchById(event.categoryId).listen((category) {
          add(ChangeCategory(category));
        });
  }

  void _changeCategory(ChangeCategory event,
      Emitter<CategoryDetailState> emit) {
    emit(state.copyWith(title: event.category.title,
      budget: event.category.budget,
      budgetType: event.category.budgetType,));
  }

  @override
  Future<void> close() async {
    await _subCategory?.cancel();
    return super.close();
  }
}
