import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';

class StateBloc {
  final DateTimeRange? dateRange;
  final List<Account> accounts;
  final List<Category> categoryIn;
  final List<Category> categoryOut;

  StateBloc([
    this.dateRange,
    this.accounts = const [],
    this.categoryIn = const [],
    this.categoryOut = const [],
  ]);
}

class OperationFilterPageBloc extends Cubit<StateBloc> {
  final Repository model;
  late List<Account> accountList;
  late List<Category> categoryInList;
  late List<Category> categoryOutList;
  late StateBloc state;

  OperationFilterPageBloc(this.model) : super(StateBloc());

  Future<void> init(OperationListFilter filter) async {
    accountList = await model.getAllAccounts();

    categoryInList = await model.getAllCategoriesByType(OperationType.INPUT);

    categoryOutList = await model.getAllCategoriesByType(OperationType.OUTPUT);

    state = StateBloc(
      filter.date,
      accountList
          .where((element) => filter.accountsIds.contains(element.id))
          .toList(),
      categoryInList
          .where((element) => filter.categoriesIds.contains(element.id))
          .toList(),
      categoryOutList
          .where((element) => filter.categoriesIds.contains(element.id))
          .toList(),
    );
    emit(state);
  }

  void clearPeriod() {
    state =
        StateBloc(null, state.accounts, state.categoryIn, state.categoryOut);
    emit(state);
  }

  void setPeriod(DateTimeRange date) {
    state =
        StateBloc(date, state.accounts, state.categoryIn, state.categoryOut);
    emit(state);
  }

  void addAccount(Account account) {
    state.accounts.add(account);
    emit(state);
  }

  void removeAccount(Account account) {
    state.accounts.removeWhere((element) => element.id == account.id);
    emit(state);
  }

  void addCategory(Category category) {
    if (category.type == OperationType.INPUT) {
      state.categoryIn.add(category);
    } else if (category.type == OperationType.OUTPUT) {
      state.categoryOut.add(category);
    }
    ;

    emit(state);
  }

  void removeCategory(Category category) {
    if (category.type == OperationType.INPUT) {
      state.categoryIn.removeWhere((element) => element.id == category.id);
    } else if (category.type == OperationType.OUTPUT) {
      state.categoryOut.removeWhere((element) => element.id == category.id);
    }

    emit(state);
  }

  OperationListFilter getFilter() {
    return OperationListFilter(
      date: state.dateRange,
      accountsIds: state.accounts.map((e) => e.id).toSet(),
      categoriesIds: state.categoryIn.map((e) => e.id).toSet()
        ..addAll(state.categoryOut.map((e) => e.id)),
    );
  }
}
