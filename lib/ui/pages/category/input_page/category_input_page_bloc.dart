import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/domain/models.dart';

abstract class CategoryInputPageState {}

class InitState extends CategoryInputPageState {
  final String title;
  final int budget;

  InitState({required this.title, required this.budget});
}

class InputState extends CategoryInputPageState {
  final OperationType type;
  final BudgetType budgetType;

  InputState({
    required this.type,
    required this.budgetType,
  });
}

class Saved extends CategoryInputPageState {
  final Category category;

  Saved(this.category);
}

class CategoryInputPageBloc extends Cubit<CategoryInputPageState> {
  final LocalSource _repository;

  Category? _category;
  OperationType _type = OperationType.INPUT;
  BudgetType _budgetType = BudgetType.MONTH;
  String _title = '';
  int _budget = 0;

  CategoryInputPageBloc(this._repository)
      : super(InputState(
          type: OperationType.INPUT,
          budgetType: BudgetType.MONTH,
        ));

  void initialByType(OperationType type) {
    _type = type;
    emit(InputState(
      type: _type,
      budgetType: _budgetType,
    ));
  }

  Future<void> initialById(int id) async {
    _category = await _repository.categories.getById(id);
    _type = _category!.operationType;
    _budgetType = _category!.budgetType;
    _title = _category!.title;
    _budget = _category!.budget;

    emit(InitState(
      title: _title,
      budget: _budget,
    ));

    emit(InputState(
      type: _type,
      budgetType: _budgetType,
    ));
  }

  void changeTitle(String title){
    _title = title;
  }

  void changeBudget(String budget){
    _budget = int.parse(budget);
  }

  void setBudgetType(BudgetType budgetType) {
    _budgetType = budgetType;
    emit(InputState(
      type: _type,
      budgetType: _budgetType,
    ));
  }

  Future<void> save() async {
    if (_category == null) {
      var category = Category(
        title: _title,
        operationType: _type,
        budgetType: _budgetType,
        budget: _budget,
      );

      var id = await _repository.categories.insert(category);
      emit(Saved(category.copyWith(id: id)));
    } else {
      var _newCategory = _category!.copyWith(
        title: _title,
        operationType: _type,
        budgetType: _budgetType,
        budget: _budget,
      );

      await _repository.categories.update(_newCategory);
      emit(Saved(_newCategory));
    }
  }
}
