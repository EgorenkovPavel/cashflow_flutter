import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/domain/models.dart';

abstract class CategoryInputPageState {}

class InputState extends CategoryInputPageState {
  final OperationType type;
  final BudgetType budgetType;
  final String? title;
  final int? budget;

  InputState({
    required this.type,
    required this.budgetType,
    this.title,
    this.budget,
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

  CategoryInputPageBloc(this._repository)
      : super(InputState(
            type: OperationType.INPUT, budgetType: BudgetType.MONTH));

  void initialByType(OperationType type) {
    _type = type;
    emit(
        InputState(type: _type, budgetType: _budgetType, title: '', budget: 0));
  }

  Future<void> initialById(int id) async {
    _category = await _repository.categories.getById(id);
    _type = _category!.operationType;
    _budgetType = _category!.budgetType;
    emit(InputState(
        type: _type,
        budgetType: _budgetType,
        title: _category!.title,
        budget: _category!.budget));
  }

  void setBudgetType(BudgetType budgetType) {
    _budgetType = budgetType;
    emit(InputState(type: _type, budgetType: _budgetType));
  }

  Future<void> save(String title, String budget) async {
    if (_category == null) {
      var category = Category(
        title: title,
        operationType: _type,
        budgetType: _budgetType,
        budget: int.parse(budget),
      );

      var id = await _repository.categories.insert(category);
      emit(Saved(category.copyWith(id: id)));
    } else {
      var _newCategory = _category!.copyWith(
        title: title,
        operationType: _type,
        budgetType: _budgetType,
        budget: int.parse(budget),
      );

      var id = await _repository.categories.update(_newCategory);
      emit(Saved(_newCategory));
    }
  }
}
