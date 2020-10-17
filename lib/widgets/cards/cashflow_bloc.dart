
import 'package:bloc/bloc.dart';
import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';

abstract class CashflowCardEvent {}

class Fetch extends CashflowCardEvent {}

abstract class CashflowCardState {}

class Empty extends CashflowCardState {}

class Loading extends CashflowCardState {}

class Success extends CashflowCardState {
  final List<CategoryCashflowBudget> categoriesInput;
  final List<CategoryCashflowBudget> categoriesOutput;

  Success(this.categoriesInput, this.categoriesOutput);
}

class CashflowCardBloc extends Bloc<CashflowCardEvent, CashflowCardState> {
  final Repository _repository;

  CashflowCardBloc(this._repository) : super(Loading());

  @override
  Stream<CashflowCardState> mapEventToState(CashflowCardEvent event) async* {
    await for (List<CategoryCashflowBudget> categories
    in _repository.watchAllCategoryCashflowBudget(DateTime.now())) {
      if (categories.isEmpty) {
        yield Empty();
      } else {
        List<CategoryCashflowBudget> categoriesInput = categories
            .where((category) => category.type == OperationType.INPUT)
            .toList();

        List<CategoryCashflowBudget> categoriesOutput = categories
            .where((category) => category.type == OperationType.OUTPUT)
            .toList();

        yield Success(categoriesInput, categoriesOutput);
      }
    }
  }
}
