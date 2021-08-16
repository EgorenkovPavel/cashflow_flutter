import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';

abstract class CategoryInputPageState {}

class InputState extends CategoryInputPageState {
  final OperationType type;
  final BudgetType budgetType;

  InputState(this.type, this.budgetType);
}

class Saved extends CategoryInputPageState {
  final Category category;

  Saved(this.category);
}

class CategoryInputPageBloc extends Cubit<CategoryInputPageState> {
  final Repository _repository;

  late OperationType _type;
  BudgetType _budgetType = BudgetType.MONTH;

  CategoryInputPageBloc(this._repository)
      : super(InputState(OperationType.INPUT, BudgetType.MONTH));

  void initial(OperationType type) {
    _type = type;
  }

  void setbudgetType(BudgetType budgetType){
    _budgetType = budgetType;
    emit(InputState(_type, _budgetType));
  }

  Future<void> save(String title, String budget) async {
    var category = Category(
      title: title,
      operationType: _type,
      budgetType: _budgetType,
      budget: int.parse(budget),
    );
    var id = await _repository.insertCategory(category);
    emit(Saved(category.copyWith(id: id)));
  }
}
