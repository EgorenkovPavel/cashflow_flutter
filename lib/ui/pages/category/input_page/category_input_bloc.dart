import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/domain/models.dart';

abstract class CategoryInputEvent {}

class InitByType extends CategoryInputEvent {
  final OperationType operationType;

  InitByType(this.operationType);
}

class InitById extends CategoryInputEvent {
  final int categoryId;

  InitById(this.categoryId);
}

class ChangeTitle extends CategoryInputEvent {
  final String title;

  ChangeTitle(this.title);
}

class ChangeBudget extends CategoryInputEvent {
  final int budget;

  ChangeBudget(this.budget);
}

class ChangeBudgetType extends CategoryInputEvent {
  final BudgetType budgetType;

  ChangeBudgetType(this.budgetType);
}

class Save extends CategoryInputEvent{}

abstract class CategoryInputState {
  final Category? category;
  final OperationType operationType;
  final BudgetType budgetType;
  final String title;
  final int budget;

  CategoryInputState({
    this.category,
    required this.operationType,
    required this.budgetType,
    required this.title,
    required this.budget,
  });
}

class Data extends CategoryInputState {
  Data({
    required OperationType operationType,
    required BudgetType budgetType,
    required String title,
    required int budget,
  }) : super(
          title: title,
          operationType: operationType,
          budgetType: budgetType,
          budget: budget,
        );

  Data.state({
    required CategoryInputState state,
    OperationType? operationType,
    BudgetType? budgetType,
    String? title,
    int? budget,
  }) : super(
          title: title ?? state.title,
          operationType: operationType ?? state.operationType,
          budgetType: budgetType ?? state.budgetType,
          budget: budget ?? state.budget,
        );

  Data.initial()
      : super(
          title: '',
          budget: 0,
          operationType: OperationType.INPUT,
          budgetType: BudgetType.MONTH,
        );
}

class Restore extends CategoryInputState {
  Restore({
    required Category category,
  }) : super(
          title: category.title,
          operationType: category.operationType,
          budgetType: category.budgetType,
          budget: category.budget,
          category: category,
        );
}

class Saved extends CategoryInputState {
  Saved({
    required Category category,
    required CategoryInputState state,
  }) : super(
          title: state.title,
          operationType: state.operationType,
          budgetType: state.budgetType,
          budget: state.budget,
          category: category,
        );
}

class CategoryInputBloc extends Bloc<CategoryInputEvent, CategoryInputState> {
  final LocalSource _repository;

  CategoryInputBloc(this._repository) : super(Data.initial()) {
    on<InitByType>(_initByType);
    on<InitById>(_initById);
    on<ChangeTitle>(_changeTitle);
    on<ChangeBudget>(_changeBudget);
    on<ChangeBudgetType>(_changeBudgetType);
    on<Save>(_save);
  }

  void _initByType(InitByType event, Emitter<CategoryInputState> emit) {
    emit(Data.state(
      state: state,
      operationType: event.operationType,
    ));
  }

  Future<void> _initById(
      InitById event, Emitter<CategoryInputState> emit) async {
    var _category = await _repository.categories.getById(event.categoryId);

    emit(Restore(category: _category));
  }

  void _changeTitle(ChangeTitle event, Emitter<CategoryInputState> emit) {
    emit(Data.state(state: state, title: event.title));
  }

  void _changeBudget(ChangeBudget event, Emitter<CategoryInputState> emit) {
    emit(Data.state(state: state, budget: event.budget));
  }

  void _changeBudgetType(ChangeBudgetType event, Emitter<CategoryInputState> emit) {
    emit(Data.state(state: state, budgetType: event.budgetType));
  }

  Future<void> _save(Save event, Emitter<CategoryInputState> emit) async {
    if (state.category == null) {
      var _category = Category(
        title: state.title,
        operationType: state.operationType,
        budgetType: state.budgetType,
        budget: state.budget,
      );

      var id = await _repository.categories.insert(_category);
      emit(Saved(category: _category.copyWith(id: id), state: state));
    } else {
      var _newCategory = state.category!.copyWith(
        title: state.title,
        operationType: state.operationType,
        budgetType: state.budgetType,
        budget: state.budget,
      );

      await _repository.categories.update(_newCategory);
      emit(Saved(category: _newCategory, state: state));
    }
  }
}
