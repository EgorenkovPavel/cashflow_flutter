import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';

abstract class CategoryState{}

class DateState extends CategoryState{
  final String title;
  final int budget;
  final BudgetType budgetType;

  DateState({required this.budgetType, required this.title, required this.budget});
}

class Close extends CategoryState{}

class CategoryBloc extends Cubit<CategoryState> {
  final Repository _repository;

  late Category _category;

  String _title = '';
  int _budget = 0;
  BudgetType _budgetType = BudgetType.MONTH;

  CategoryBloc(this._repository) : super(DateState(title: '', budget: 0, budgetType: BudgetType.MONTH));

  Future<void> fetch(int id) async {
    _category = await _repository.getCategoryById(id);

    _title = _category.title;
    _budget = _category.budget;
    _budgetType = _category.budgetType;

    emit(DateState(title: _title, budget: _budget, budgetType: _budgetType));
  }

  void onBudgetTypeChanged(BudgetType type){
    _budgetType = type;
  }

  Future<void> save(String title, int budget) async {
    _category = _category.copyWith(title: title, budget: budget, budgetType: _budgetType);
    await _repository.updateCategory(_category);
    emit(Close());
  }
}
