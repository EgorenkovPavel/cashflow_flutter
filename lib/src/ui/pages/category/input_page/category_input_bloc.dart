import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/domain/models/enum/currency.dart';
import 'package:money_tracker/src/domain/use_cases/get_category_by_id_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/insert_category_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/update_category_use_case.dart';

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

  const factory CategoryInputEvent.changeCurrency({
    required Currency currency,
  }) = _ChangeCurrencyCategoryInputEvent;

  const factory CategoryInputEvent.save() = _SaveCategoryInputEvent;
}

@freezed
class CategoryInputState with _$CategoryInputState {
  const factory CategoryInputState({
    Category? category,
    required OperationType operationType,
    required BudgetType budgetType,
    required String title,
    required int budget,
    required Currency currency,
    required bool isSaved,
  }) = _CategoryInputState;
}

class CategoryInputBloc extends Bloc<CategoryInputEvent, CategoryInputState> {
  final GetCategoryByIdUseCase _getCategoryByIdUseCase;
  final InsertCategoryUseCase _insertCategoryUseCase;
  final UpdateCategoryUseCase _updateCategoryUseCase;

  CategoryInputBloc(
    this._getCategoryByIdUseCase,
    this._insertCategoryUseCase,
    this._updateCategoryUseCase,
  ) : super(const CategoryInputState(
          operationType: OperationType.INPUT,
          budgetType: BudgetType.MONTH,
          title: '',
          budget: 0,
          currency: Currency.RUB,
          isSaved: false,
        )) {
    on<CategoryInputEvent>((event, emitter) => event.map(
          initByType: (event) => _initByType(event, emitter),
          initById: (event) => _initById(event, emitter),
          changeTitle: (event) => _changeTitle(event, emitter),
          changeBudget: (event) => _changeBudget(event, emitter),
          changeBudgetType: (event) => _changeBudgetType(event, emitter),
          changeCurrency: (event) => _changeCurrency(event, emitter),
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
    final category =
        await _getCategoryByIdUseCase(categoryId: event.categoryId);

    emit(CategoryInputState(
      category: category,
      operationType: category.operationType,
      budgetType: category.budgetType,
      title: category.title,
      budget: category.budget,
      currency: category.currency,
      isSaved: false,
    ));
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
      emit(state.copyWith(
        isSaved: true,
        category: await _insertCategoryUseCase(
          title: state.title,
          operationType: state.operationType,
          budgetType: state.budgetType,
          budget: state.budget,
          currency: state.currency,
        ),
      ));
    } else {
      emit(state.copyWith(
        isSaved: true,
        category: await _updateCategoryUseCase(
          category: state.category!,
          title: state.title,
          operationType: state.operationType,
          budgetType: state.budgetType,
          budget: state.budget,
          currency: state.currency,
        ),
      ));
    }
  }

  _changeCurrency(
    _ChangeCurrencyCategoryInputEvent event,
    Emitter<CategoryInputState> emit,
  ) {
    emit(state.copyWith(currency: event.currency));
  }
}
