import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

part 'category_detail_bloc.freezed.dart';

@freezed
class CategoryDetailEvent with _$CategoryDetailEvent {
  const factory CategoryDetailEvent.fetch({required int categoryId}) =
      _FetchCategoryDetailEvent;

  const factory CategoryDetailEvent.changeCategory({
    required Category category,
  }) = _ChangeCategoryCategoryDetailEvent;

  const factory CategoryDetailEvent.changeOperations({
    required List<Operation> operations,
  }) = _ChangeOperationsCategoryDetailEvent;
}

@freezed
class CategoryDetailState with _$CategoryDetailState {
  const factory CategoryDetailState({
    required BudgetType budgetType,
    required String title,
    required int budget,
    required List<Operation> operations,
  }) = _CategoryDetailState;
}

class CategoryDetailBloc
    extends Bloc<CategoryDetailEvent, CategoryDetailState> {
  final DataRepository _repository;

  StreamSubscription<Category>? _subCategory;
  StreamSubscription? _subOperations;

  CategoryDetailBloc(this._repository)
      : super(const CategoryDetailState(
          budgetType: BudgetType.MONTH,
          title: '',
          operations: [],
          budget: 0,
        )) {
    on<CategoryDetailEvent>((event, emitter) => event.map(
          fetch: (event) => _fetch(event, emitter),
          changeCategory: (event) => _changeCategory(event, emitter),
          changeOperations: (event) => _changeOperations(event, emitter),
        ));
  }

  void _fetch(
    _FetchCategoryDetailEvent event,
    Emitter<CategoryDetailState> emit,
  ) {
    _subCategory =
        _repository.categories.watchById(event.categoryId).listen((category) {
      add(CategoryDetailEvent.changeCategory(category: category));
    });
    _subOperations = _repository.operations
        .watchAllByCategory(event.categoryId)
        .listen((items) {
      add(CategoryDetailEvent.changeOperations(operations: items));
    });
  }

  void _changeCategory(
    _ChangeCategoryCategoryDetailEvent event,
    Emitter<CategoryDetailState> emit,
  ) {
    emit(state.copyWith(
      budget: event.category.budget,
      title: event.category.title,
      budgetType: event.category.budgetType,
    ));
  }

  void _changeOperations(
    _ChangeOperationsCategoryDetailEvent event,
    Emitter<CategoryDetailState> emit,
  ) {
    emit(state.copyWith(operations: event.operations));
  }

  @override
  Future<void> close() async {
    await _subCategory?.cancel();
    await _subOperations?.cancel();

    return super.close();
  }
}
