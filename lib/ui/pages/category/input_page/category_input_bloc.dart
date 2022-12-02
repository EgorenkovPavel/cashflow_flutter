import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

part 'category_input_bloc.freezed.dart';

@freezed
class CategoryInputEvent with _$CategoryInputEvent {
  const factory CategoryInputEvent.initByType({
    required OperationType operationType,
  }) = _InitByTypeCategoryInputEvent;

  const factory CategoryInputEvent.initById({required int categoryId}) =
      _InitByIdCategoryInputEvent;

  const factory CategoryInputEvent.changeTitle({required String title}) =
      _ChangeTitleCategoryInputEvent;

  const factory CategoryInputEvent.changeBudget({required int budget}) =
      _ChangeBudgetCategoryInputEvent;

  const factory CategoryInputEvent.changeBudgetType({
    required BudgetType budgetType,
  }) = _ChangeBudgetTypeCategoryInputEvent;

  const factory CategoryInputEvent.save() = _SaveCategoryInputEvent;
}

@freezed
class CategoryInputState with _$CategoryInputState {
  const CategoryInputState._();

  const factory CategoryInputState.main({
    Category? category,
    required OperationType operationType,
    required BudgetType budgetType,
    required String title,
    required int budget,
  }) = _MainCategoryInputState;

  const factory CategoryInputState.fetched({
    required Category fetchedCategory,
    required OperationType operationType,
    required BudgetType budgetType,
    required String title,
    required int budget,
  }) = _FetchedCategoryInputState;

  const factory CategoryInputState.saved({
    required Category savedCategory,
    required OperationType operationType,
    required BudgetType budgetType,
    required String title,
    required int budget,
  }) = _SavedCategoryInputState;

  Category? get category => map(
        main: (state) => state.category,
        saved: (state) => state.savedCategory,
        fetched: (state) => state.fetchedCategory,
      );

  bool get isSaved => maybeMap(
        saved: (_) => true,
        orElse: () => false,
      );

  bool get isFetched => maybeMap(
        fetched: (_) => true,
        orElse: () => false,
      );
}

class CategoryInputBloc extends Bloc<CategoryInputEvent, CategoryInputState> {
  final DataRepository _repository;

  CategoryInputBloc(this._repository)
      : super(const CategoryInputState.main(
          operationType: OperationType.INPUT,
          budgetType: BudgetType.MONTH,
          title: '',
          budget: 0,
        )) {
    on<CategoryInputEvent>((event, emitter) => event.map(
          initByType: (event) => _initByType(event, emitter),
          initById: (event) => _initById(event, emitter),
          changeTitle: (event) => _changeTitle(event, emitter),
          changeBudget: (event) => _changeBudget(event, emitter),
          changeBudgetType: (event) => _changeBudgetType(event, emitter),
          save: (event) => _save(event, emitter),
        ));
  }

  void _initByType(
    _InitByTypeCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) {
    emit(CategoryInputState.main(
      operationType: event.operationType,
      budgetType: state.budgetType,
      title: state.title,
      budget: state.budget,
    ));
  }

  Future<void> _initById(
    _InitByIdCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) async {
    var category = await _repository.categories.getById(event.categoryId);

    emit(CategoryInputState.fetched(
      fetchedCategory: category,
      operationType: category.operationType,
      budgetType: category.budgetType,
      title: category.title,
      budget: category.budget,
    ));
  }

  void _changeTitle(
    _ChangeTitleCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) {
    emit(CategoryInputState.main(
      category: state.category,
      operationType: state.operationType,
      budgetType: state.budgetType,
      title: event.title,
      budget: state.budget,
    ));
  }

  void _changeBudget(
    _ChangeBudgetCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) {
    emit(CategoryInputState.main(
      category: state.category,
      operationType: state.operationType,
      budgetType: state.budgetType,
      title: state.title,
      budget: event.budget,
    ));
  }

  void _changeBudgetType(
    _ChangeBudgetTypeCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) {
    emit(CategoryInputState.main(
      category: state.category,
      operationType: state.operationType,
      budgetType: event.budgetType,
      title: state.title,
      budget: state.budget,
    ));
  }

  Future<void> _save(
    _SaveCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) async {
    if (state.category == null) {
      var category = Category(
        title: state.title,
        operationType: state.operationType,
        budgetType: state.budgetType,
        budget: state.budget,
      );

      var id = await _repository.categories.insert(category);
      emit(CategoryInputState.saved(
        title: state.title,
        budget: state.budget,
        budgetType: state.budgetType,
        operationType: state.operationType,
        savedCategory: category.copyWith(id: id),
      ));
    } else {
      var newCategory = state.category!.copyWith(
        title: state.title,
        operationType: state.operationType,
        budgetType: state.budgetType,
        budget: state.budget,
      );

      await _repository.categories.update(newCategory);
      emit(CategoryInputState.saved(
        title: state.title,
        budget: state.budget,
        budgetType: state.budgetType,
        operationType: state.operationType,
        savedCategory: newCategory,
      ));
    }
  }
}
