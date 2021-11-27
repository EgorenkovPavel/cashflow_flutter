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

  int? _id;
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
    _id = id;
    var category = await _repository.categories.getById(id);
    _type = category.operationType;
    _budgetType = category.budgetType;
    emit(InputState(
        type: _type,
        budgetType: _budgetType,
        title: category.title,
        budget: category.budget));
  }

  void setbudgetType(BudgetType budgetType) {
    _budgetType = budgetType;
    emit(InputState(type: _type, budgetType: _budgetType));
  }

  Future<void> save(String title, String budget) async {
    if (_id == null) {
      var category = Category(
        title: title,
        operationType: _type,
        budgetType: _budgetType,
        budget: int.parse(budget),
      );

      var id = await _repository.categories.insert(category);
      emit(Saved(category.copyWith(id: id)));
    } else {
      var category = Category(
        id: _id!,
        title: title,
        operationType: _type,
        budgetType: _budgetType,
        budget: int.parse(budget),
      );

      var id = await _repository.categories.update(category);
      emit(Saved(category));
    }
  }
}
