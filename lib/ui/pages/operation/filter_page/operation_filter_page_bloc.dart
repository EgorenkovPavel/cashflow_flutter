import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';

class StateBloc {
  final DateTimeRange? dateRange;
  final List<Account> accounts;
  final List<Category> categoryIn;
  final List<Category> categoryOut;

  StateBloc({
    this.dateRange,
    this.accounts = const [],
    this.categoryIn = const [],
    this.categoryOut = const [],
  });

  copyWith({DateTimeRange? date, List<Account>? accounts, List<Category>? categoriesIn, List<Category>? categoriesOut}){
    return StateBloc(
      dateRange: date ?? this.dateRange,
      accounts: accounts ?? this.accounts,
      categoryIn: categoriesIn ?? this.categoryIn,
      categoryOut: categoriesOut ?? this.categoryOut,
    );

  }
}

class OperationFilterPageBloc extends Cubit<StateBloc> {
  final Repository model;
  late List<Account> accountList;
  late List<Category> categoryInList;
  late List<Category> categoryOutList;
  StateBloc _state = StateBloc();

  OperationFilterPageBloc(this.model) : super(StateBloc());

  Future<void> init(OperationListFilter filter) async {
    accountList = await model.getAllAccounts();

    categoryInList = await model.getAllCategoriesByType(OperationType.INPUT);

    categoryOutList = await model.getAllCategoriesByType(OperationType.OUTPUT);

    _state = StateBloc(
      dateRange: filter.date,
      accounts: accountList
          .where((element) => filter.accountsIds.contains(element.id))
          .toList(),
      categoryIn: categoryInList
          .where((element) => filter.categoriesIds.contains(element.id))
          .toList(),
      categoryOut: categoryOutList
          .where((element) => filter.categoriesIds.contains(element.id))
          .toList(),
    );
    emit(_state);
  }

  void clearPeriod() {
    _state = _state.copyWith(date: null);
    emit(_state);
  }

  void setPeriod(DateTimeRange date) {
    _state = _state.copyWith(date: date);
    emit(_state);
  }

  void addAccount(Account account) {
    _state = _state.copyWith(accounts: _state.accounts..add(account));
    emit(_state);
  }

  void removeAccount(Account account) {
    _state = _state.copyWith(accounts: _state.accounts..removeWhere((element) => element.id == account.id));
    emit(_state);
  }

  void addCategory(Category category) {
    if (category.operationType == OperationType.INPUT) {
      _state = _state.copyWith(categoriesIn: _state.categoryIn..add(category));
    } else if (category.operationType == OperationType.OUTPUT) {
      _state = _state.copyWith(categoriesOut: _state.categoryOut..add(category));
    };

    emit(_state);
  }

  void removeCategory(Category category) {
    if (category.operationType == OperationType.INPUT) {
      _state = _state.copyWith(categoriesIn: _state.categoryIn..removeWhere((element) => element.id == category.id));
    } else if (category.operationType == OperationType.OUTPUT) {
      _state = _state.copyWith(categoriesOut: _state.categoryOut..removeWhere((element) => element.id == category.id));
    }

    emit(_state);
  }

  OperationListFilter getFilter() {
    return OperationListFilter(
      date: _state.dateRange,
      accountsIds: _state.accounts.map((e) => e.id).toSet(),
      categoriesIds: _state.categoryIn.map((e) => e.id).toSet()
        ..addAll(_state.categoryOut.map((e) => e.id)),
    );
  }
}
