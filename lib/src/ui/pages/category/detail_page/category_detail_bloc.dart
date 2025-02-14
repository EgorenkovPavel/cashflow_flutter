import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/domain/use_cases/watch_operations_by_category_use_case.dart';

import '../../../../domain/use_cases/watch_category_by_id_use_case.dart';

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
  final WatchOperationsByCategoryUseCase _watchOperationsByCategoryUseCase;
  final WatchCategoryByIdUseCase _watchCategoryByIdUseCase;

  StreamSubscription<Category>? _subCategory;
  StreamSubscription? _subOperations;

  CategoryDetailBloc(
    this._watchOperationsByCategoryUseCase,
    this._watchCategoryByIdUseCase,
  ) : super(const CategoryDetailState(
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
    _subCategory = _watchCategoryByIdUseCase(categoryId: event.categoryId)
        .listen((category) {
      add(CategoryDetailEvent.changeCategory(category: category));
    });
    _subOperations =
        _watchOperationsByCategoryUseCase(categoryId: event.categoryId)
            .listen((items) {
      add(CategoryDetailEvent.changeOperations(operations: items));
    });
  }

  void _changeCategory(
    _ChangeCategoryCategoryDetailEvent event,
    Emitter<CategoryDetailState> emit,
  ) {
    final category = event.category;
    switch(category){
      case InputCategoryItem():
        emit(state.copyWith(
          title: category.title,
          budget: category.budget,
          budgetType: category.budgetType,
        ));
      case OutputCategoryItem():
        emit(state.copyWith(
          title: category.title,
          budget: category.budget,
          budgetType: category.budgetType,
        ));
      case InputCategoryGroup():
        emit(state.copyWith(
          title: category.title,
        ));
      case OutputCategoryGroup():
        emit(state.copyWith(
          title: category.title,
        ));
    }
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
