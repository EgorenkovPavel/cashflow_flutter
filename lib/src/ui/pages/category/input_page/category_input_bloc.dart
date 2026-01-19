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

  const factory CategoryInputEvent.changeParent({required int? parentId}) =
      _ChangeParentCategoryInputEvent;

  const factory CategoryInputEvent.save() = _SaveCategoryInputEvent;
}

@freezed
sealed class CategoryInputState with _$CategoryInputState {
  const CategoryInputState._();

  const factory CategoryInputState.item({
    CategoryItem? category,
    required CategoryType type,
    required BudgetType budgetType,
    required String title,
    required int budget,
    required int? parent,
    required bool isSaved,
  }) = _ItemCategoryInputState;

  const factory CategoryInputState.group({
    CategoryGroup? category,
    required CategoryType type,
    required String title,
    required bool isSaved,
  }) = _GroupCategoryInputState;

  bool get isNew => category == null;

  bool get isGroup => map(item: (_) => false, group: (_) => true);
}

class CategoryInputBloc extends Bloc<CategoryInputEvent, CategoryInputState> {
  final CategoryInteractor _interactor;

  CategoryInputBloc(this._interactor)
    : super(
        const CategoryInputState.item(
          type: CategoryType.INPUT,
          budgetType: BudgetType.MONTH,
          title: '',
          budget: 0,
          isSaved: false,
          parent: null,
        ),
      ) {
    on<CategoryInputEvent>(
      (event, emitter) => event.map(
        initByType: (event) => _initByType(event, emitter),
        initById: (event) => _initById(event, emitter),
        changeTitle: (event) => _changeTitle(event, emitter),
        changeBudget: (event) => _changeBudget(event, emitter),
        changeBudgetType: (event) => _changeBudgetType(event, emitter),
        changeParent: (event) => _changeParent(event, emitter),
        save: (event) => _save(event, emitter),
      ),
    );
  }

  void _initByType(
    _InitByTypeCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) {
    if (event.isGroup) {
      emit(
        CategoryInputState.group(type: event.type, title: '', isSaved: false),
      );
    } else {
      emit(
        CategoryInputState.item(
          type: event.type,
          budgetType: BudgetType.MONTH,
          title: '',
          budget: 0,
          parent: null,
          isSaved: false,
        ),
      );
    }
  }

  Future<void> _initById(
    _InitByIdCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) async {
    final categoryResult = await _interactor.getById(event.categoryId);

    categoryResult.fold(
      onSuccess: (category) {
        switch (category) {
          case CategoryItem():
            emit(
              CategoryInputState.item(
                category: category,
                budgetType: category.budgetType,
                title: category.title,
                budget: category.budget,
                parent: category.parentId,
                isSaved: false,
                type: category.type,
              ),
            );
          case CategoryGroup():
            emit(
              CategoryInputState.group(
                category: category,
                title: category.title,
                isSaved: false,
                type: category.type,
              ),
            );
        }
      },
      onFailure: (exception) {
        // TODO Можно добавить состояние ошибки или отдельное поле error в state
        // emit(state.copyWith(
        //   // ... можно account: null, users: users,
        //   // error: exception.toString(),
        // ));
      },
    );
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
      item: (s) => emit(s.copyWith(budget: event.budget)),
      orElse: () {},
    );
  }

  void _changeParent(
    _ChangeParentCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) {
    state.maybeMap(
      item: (s) => emit(s.copyWith(parent: event.parentId)),
      orElse: () {},
    );
  }

  void _changeBudgetType(
    _ChangeBudgetTypeCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) {
    state.maybeMap(
      item: (s) => emit(s.copyWith(budgetType: event.budgetType)),
      orElse: () {},
    );
  }

  Future<void> _save(
    _SaveCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) async {
    if (state.isNew) {
      await state.map(
        item: (s) async {
          final result = await _interactor.insertCategoryItem(
            title: s.title,
            budget: s.budget,
            budgetType: s.budgetType,
            parent: s.parent,
            type: s.type,
          );

          result.fold(
            onSuccess: (category) {
              emit(s.copyWith(isSaved: true, category: category));
            },
            onFailure: (_) {
              //TODO
            },
          );
        },
        group: (s) async {
          final result = await _interactor.insertCategoryGroup(
            title: s.title,
            type: s.type,
          );
          result.fold(
            onSuccess: (category) {
              emit(s.copyWith(isSaved: true, category: category));
            },
            onFailure: (_) {
              //TODO
            },
          );
        },
      );
    } else {
      await state.map(
        item: (s) async {
          final result = await _interactor.updateCategoryItem(
            category: s.category!,
            title: s.title,
            budget: s.budget,
            budgetType: s.budgetType,
            parent: s.parent,
          );
          result.fold(
            onSuccess: (category) {
              emit(s.copyWith(isSaved: true, category: category));
            },
            onFailure: (_) {
              //TODO
            },
          );
        },
        group: (s) async {
          final result = await _interactor.updateCategoryGroup(
            category: s.category!,
            title: s.title,
          );
          result.fold(
            onSuccess: (category) {
              emit(s.copyWith(isSaved: true, category: category));
            },
            onFailure: (_) {
              //TODO
            },
          );
        },
      );
    }
  }
}
