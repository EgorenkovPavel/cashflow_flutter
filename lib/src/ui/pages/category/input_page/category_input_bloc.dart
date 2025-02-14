import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interactors/category_interactor.dart';
import 'package:money_tracker/src/domain/models.dart';

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
  const factory CategoryInputState({
    Category? category,
    required OperationType operationType,
    required bool isGroup,
    required BudgetType budgetType,
    required String title,
    required int budget,
    required bool isSaved,
    required CategoryGroup? parent,
  }) = _CategoryInputState;
}

class CategoryInputBloc extends Bloc<CategoryInputEvent, CategoryInputState> {
  final CategoryInteractor _interactor;

  CategoryInputBloc(this._interactor)
      : super(const CategoryInputState(
          operationType: OperationType.INPUT,
          budgetType: BudgetType.MONTH,
          title: '',
          budget: 0,
          isGroup: false,
          isSaved: false,
          parent: null,
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
    emit(state.copyWith(operationType: event.operationType));
  }

  Future<void> _initById(
    _InitByIdCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) async {
    final category = await _interactor.getById(categoryId: event.categoryId);

    switch (category) {
      case InputCategoryItem():
        emit(state.copyWith(
          category: category,
          operationType: OperationType.INPUT,
          isGroup: false,
          budgetType: category.budgetType,
          title: category.title,
          budget: category.budget,
          parent: category.parent,
          isSaved: false,
        ));
      case OutputCategoryItem():
        emit(state.copyWith(
          category: category,
          operationType: OperationType.OUTPUT,
          isGroup: false,
          budgetType: category.budgetType,
          title: category.title,
          budget: category.budget,
          parent: category.parent,
          isSaved: false,
        ));
      case InputCategoryGroup():
        emit(state.copyWith(
          category: category,
          operationType: OperationType.INPUT,
          isGroup: true,
          title: category.title,
          parent: null,
          isSaved: false,
        ));
      case OutputCategoryGroup():
        emit(state.copyWith(
          category: category,
          operationType: OperationType.OUTPUT,
          isGroup: true,
          title: category.title,
          parent: null,
          isSaved: false,
        ));
    }
  }

  void _changeTitle(
    _ChangeTitleCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  void _changeBudget(
    _ChangeBudgetCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) {
    emit(state.copyWith(budget: event.budget));
  }

  void _changeBudgetType(
    _ChangeBudgetTypeCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) {
    emit(state.copyWith(budgetType: event.budgetType));
  }

  Future<void> _save(
    _SaveCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) async {
    if (state.category == null) {
      if (state.operationType == OperationType.INPUT) {
        if (state.isGroup) {
          emit(state.copyWith(
            isSaved: true,
            category:
                await _interactor.insertInputCategoryGroup(title: state.title),
          ));
        } else {
          emit(state.copyWith(
            isSaved: true,
            category: await _interactor.insertInputCategoryItem(
              title: state.title,
              budget: state.budget,
              budgetType: state.budgetType,
              parent: state.parent as InputCategoryGroup,
            ),
          ));
        }
      } else if (state.operationType == OperationType.OUTPUT) {
        if (state.isGroup) {
          emit(state.copyWith(
            isSaved: true,
            category:
                await _interactor.insertOutputCategoryGroup(title: state.title),
          ));
        } else {
          emit(state.copyWith(
            isSaved: true,
            category: await _interactor.insertOutputCategoryItem(
              title: state.title,
              budget: state.budget,
              budgetType: state.budgetType,
              parent: state.parent as OutputCategoryGroup,
            ),
          ));
        }
      }
    } else {
      if (state.operationType == OperationType.INPUT) {
        if (state.isGroup) {
          emit(state.copyWith(
            isSaved: true,
            category: await _interactor.updateInputCategoryGroup(
                category: state.category as InputCategoryGroup,
                title: state.title),
          ));
        } else {
          emit(state.copyWith(
            isSaved: true,
            category: await _interactor.updateInputCategoryItem(
              category: state.category as InputCategoryItem,
              title: state.title,
              budget: state.budget,
              budgetType: state.budgetType,
              parent: state.parent as InputCategoryGroup,
            ),
          ));
        }
      } else if (state.operationType == OperationType.OUTPUT) {
        if (state.isGroup) {
          emit(state.copyWith(
            isSaved: true,
            category:
                await _interactor.updateOutputCategoryGroup(
                    category: state.category as OutputCategoryGroup,
                    title: state.title),
          ));
        } else {
          emit(state.copyWith(
            isSaved: true,
            category: await _interactor.updateOutputCategoryItem(
              category: state.category as OutputCategoryItem,
              title: state.title,
              budget: state.budget,
              budgetType: state.budgetType,
              parent: state.parent as OutputCategoryGroup,
            ),
          ));
        }
      }
    }
  }
}
