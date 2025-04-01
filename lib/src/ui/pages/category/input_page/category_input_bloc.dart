import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interactors/category_interactor.dart';
import 'package:money_tracker/src/domain/models.dart';

part 'category_input_bloc.freezed.dart';

@freezed
class CategoryInputEvent with _$CategoryInputEvent {
  const factory CategoryInputEvent.initByType({
    required CategoryType type,
    required bool isGroup,
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

  const factory CategoryInputEvent.changeParent({
    required int? parentId,
  }) = _ChangeParentCategoryInputEvent;

  const factory CategoryInputEvent.save() = _SaveCategoryInputEvent;
}

@freezed
class CategoryInputState with _$CategoryInputState {
  const CategoryInputState._();

  const factory CategoryInputState.inputItem({
    InputCategoryItem? category,
    required BudgetType budgetType,
    required String title,
    required int budget,
    required int? parent,
    required bool isSaved,
  }) = _InputItemCategoryInputState;

  const factory CategoryInputState.outputItem({
    OutputCategoryItem? category,
    required BudgetType budgetType,
    required String title,
    required int budget,
    required int? parent,
    required bool isSaved,
  }) = _OutputItemCategoryInputState;

  const factory CategoryInputState.inputGroup({
    InputCategoryGroup? category,
    required String title,
    required bool isSaved,
  }) = _InputGroupCategoryInputState;

  const factory CategoryInputState.outputGroup({
    OutputCategoryGroup? category,
    required String title,
    required bool isSaved,
  }) = _OutputGroupCategoryInputState;

  bool get isNew => category == null;

  bool get isGroup => map(
      inputItem: (_) => false,
      outputItem: (_) => false,
      inputGroup: (_) => true,
      outputGroup: (_) => true);

  CategoryType get type => map(
    inputItem: (_) => CategoryType.INPUT,
    outputItem: (_) => CategoryType.OUTPUT,
    inputGroup: (_) => CategoryType.INPUT,
    outputGroup: (_) => CategoryType.OUTPUT,
  );
}

class CategoryInputBloc extends Bloc<CategoryInputEvent, CategoryInputState> {
  final CategoryInteractor _interactor;

  CategoryInputBloc(this._interactor)
      : super(const CategoryInputState.inputItem(
          budgetType: BudgetType.MONTH,
          title: '',
          budget: 0,
          isSaved: false,
          parent: null,
        )) {
    on<CategoryInputEvent>((event, emitter) => event.map(
          initByType: (event) => _initByType(event, emitter),
          initById: (event) => _initById(event, emitter),
          changeTitle: (event) => _changeTitle(event, emitter),
          changeBudget: (event) => _changeBudget(event, emitter),
          changeBudgetType: (event) => _changeBudgetType(event, emitter),
          changeParent: (event) => _changeParent(event, emitter),
          save: (event) => _save(event, emitter),
        ));
  }

  void _initByType(
    _InitByTypeCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) {
    switch (event.type) {
      case CategoryType.INPUT:
        {
          if (event.isGroup) {
            emit(CategoryInputState.inputGroup(title: '', isSaved: false));
          } else {
            emit(CategoryInputState.inputItem(
                budgetType: BudgetType.MONTH,
                title: '',
                budget: 0,
                parent: null,
                isSaved: false));
          }
        }
      case CategoryType.OUTPUT:
        if (event.isGroup) {
          emit(CategoryInputState.outputGroup(title: '', isSaved: false));
        } else {
          emit(CategoryInputState.outputItem(
              budgetType: BudgetType.MONTH,
              title: '',
              budget: 0,
              parent: null,
              isSaved: false));
        }
    }
  }

  Future<void> _initById(
    _InitByIdCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) async {
    final category = await _interactor.getById(categoryId: event.categoryId);

    switch (category) {
      case InputCategoryItem():
        emit(CategoryInputState.inputItem(
          category: category,
          budgetType: category.budgetType,
          title: category.title,
          budget: category.budget,
          parent: category.parentId,
          isSaved: false,
        ));
      case OutputCategoryItem():
        emit(CategoryInputState.outputItem(
          category: category,
          budgetType: category.budgetType,
          title: category.title,
          budget: category.budget,
          parent: category.parentId,
          isSaved: false,
        ));
      case InputCategoryGroup():
        emit(CategoryInputState.inputGroup(
          category: category,
          title: category.title,
          isSaved: false,
        ));
      case OutputCategoryGroup():
        emit(CategoryInputState.outputGroup(
          category: category,
          title: category.title,
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
    state.maybeMap(
      inputItem: (s) => emit(s.copyWith(budget: event.budget)),
      outputItem: (s) => emit(s.copyWith(budget: event.budget)),
      orElse: () {},
    );
  }

  void _changeParent(
      _ChangeParentCategoryInputEvent event,
      Emitter<CategoryInputState> emit,
      ) {
    state.maybeMap(
      inputItem: (s) => emit(s.copyWith(parent: event.parentId)),
      outputItem: (s) => emit(s.copyWith(parent: event.parentId)),
      orElse: () {},
    );
  }

  void _changeBudgetType(
    _ChangeBudgetTypeCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) {
    state.maybeMap(
      inputItem: (s) => emit(s.copyWith(budgetType: event.budgetType)),
      outputItem: (s) => emit(s.copyWith(budgetType: event.budgetType)),
      orElse: () {},
    );
  }

  Future<void> _save(
    _SaveCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) async {
    if (state.isNew) {
      await state.map(inputItem: (s) async {
        final category = await _interactor.insertInputCategoryItem(
          title: s.title,
          budget: s.budget,
          budgetType: s.budgetType,
          parent: s.parent,
        );

        emit(s.copyWith(
          isSaved: true,
          category: category,
        ));
      }, outputItem: (s) async {
        final category =  await _interactor.insertOutputCategoryItem(
          title: s.title,
          budget: s.budget,
          budgetType: s.budgetType,
          parent: s.parent,
        );
        emit(s.copyWith(
          isSaved: true,
          category: category,
        ));
      }, inputGroup: (s) async {
        final category = await _interactor.insertInputCategoryGroup(title: s.title);
        emit(s.copyWith(
          isSaved: true,
          category: category,
        ));
      }, outputGroup: (s) async {
        final category = await _interactor.insertOutputCategoryGroup(title: s.title);
        emit(s.copyWith(
          isSaved: true,
          category: category,
        ));
      });
    } else {
      await state.map(inputItem: (s) async {
        final category = await _interactor.updateInputCategoryItem(
          category: s.category!,
          title: s.title,
          budget: s.budget,
          budgetType: s.budgetType,
          parent: s.parent,
        );
        emit(s.copyWith(
          isSaved: true,
          category: category,
        ));
      }, outputItem: (s) async {
        final category = await _interactor.updateOutputCategoryItem(
          category: s.category!,
          title: s.title,
          budget: s.budget,
          budgetType: s.budgetType,
          parent: s.parent,
        );
        emit(s.copyWith(
          isSaved: true,
          category: category,
        ));
      }, inputGroup: (s) async {
        final category = await _interactor.updateInputCategoryGroup(
            category: s.category!, title: s.title);
        emit(s.copyWith(
          isSaved: true,
          category: category,
        ));
      }, outputGroup: (s) async {
        final category = await _interactor.updateOutputCategoryGroup(
            category: s.category!, title: s.title);
        emit(s.copyWith(
          isSaved: true,
          category: category,
        ));
      });
    }
  }
}
