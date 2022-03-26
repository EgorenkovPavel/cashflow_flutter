import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

abstract class OperationFilterEvent {}

class Init extends OperationFilterEvent {
  final OperationListFilter filter;

  Init(this.filter);
}

class ResetPediod extends OperationFilterEvent {}

class SetPeriod extends OperationFilterEvent {
  final DateTimeRange period;

  SetPeriod(this.period);
}

class AddAccount extends OperationFilterEvent {
  final Account account;

  AddAccount(this.account);
}

class RemoveAccount extends OperationFilterEvent {
  final Account account;

  RemoveAccount(this.account);
}

class AddCategory extends OperationFilterEvent {
  final Category category;

  AddCategory(this.category);
}

class RemoveCategory extends OperationFilterEvent {
  final Category category;

  RemoveCategory(this.category);
}

class OperationFilterState {
  final OperationListFilter filter;

  final List<Account> accounts;
  final List<Category> inCategories;
  final List<Category> outCategories;

  OperationFilterState({
    required this.filter,
    required this.accounts,
    required this.inCategories,
    required this.outCategories,
  });

  OperationFilterState.initial()
      : filter = const OperationListFilter.empty(),
        accounts = [],
        inCategories = [],
        outCategories = [];

  OperationFilterState.resetPeriod(OperationFilterState state)
      : filter = state.filter.copyWith(period: null),
        accounts = state.accounts,
        inCategories = state.inCategories,
        outCategories = state.outCategories;

  OperationFilterState.period(OperationFilterState state, DateTimeRange period)
      : filter = state.filter.copyWith(period: period),
        accounts = state.accounts,
        inCategories = state.inCategories,
        outCategories = state.outCategories;

  OperationFilterState.addAccount(OperationFilterState state, Account account)
      : filter = state.filter
            .copyWith(accounts: state.filter.accounts..add(account)),
        accounts = state.accounts,
        inCategories = state.inCategories,
        outCategories = state.outCategories;

  OperationFilterState.removeAccount(
    OperationFilterState state,
    Account account,
  )   : filter = state.filter.copyWith(
          accounts: state.filter.accounts
            ..removeWhere((a) => a.id == account.id),
        ),
        accounts = state.accounts,
        inCategories = state.inCategories,
        outCategories = state.outCategories;

  OperationFilterState.addCategory(
    OperationFilterState state,
    Category category,
  )   : filter = state.filter
            .copyWith(categories: state.filter.categories..add(category)),
        accounts = state.accounts,
        inCategories = state.inCategories,
        outCategories = state.outCategories;

  OperationFilterState.removeCategory(
    OperationFilterState state,
    Category category,
  )   : filter = state.filter.copyWith(
          categories: state.filter.categories
            ..removeWhere((c) => c.id == category.id),
        ),
        accounts = state.accounts,
        inCategories = state.inCategories,
        outCategories = state.outCategories;
}

class OperationFilterBloc
    extends Bloc<OperationFilterEvent, OperationFilterState> {
  final DataRepository _repository;

  OperationFilterBloc(this._repository)
      : super(OperationFilterState.initial()) {
    on<Init>(_init);
    on<ResetPediod>(_resetPeriod);
    on<SetPeriod>(_setPeriod);
    on<AddAccount>(_addAccount);
    on<RemoveAccount>(_removeAccount);
    on<AddCategory>(_addCategory);
    on<RemoveCategory>(_removeCategory);
  }

  Future<void> _init(Init event, Emitter<OperationFilterState> emit) async {
    final _accounts = await _repository.accounts.getAll();
    final _inCategories =
        await _repository.categories.getAllByType(OperationType.INPUT);
    final _outCategories =
        await _repository.categories.getAllByType(OperationType.OUTPUT);

    emit(OperationFilterState(
      filter: event.filter,
      accounts: _accounts,
      inCategories: _inCategories,
      outCategories: _outCategories,
    ));
  }

  void _resetPeriod(ResetPediod event, Emitter<OperationFilterState> emit) {
    emit(OperationFilterState.resetPeriod(state));
  }

  void _setPeriod(SetPeriod event, Emitter<OperationFilterState> emit) {
    emit(OperationFilterState.period(state, event.period));
  }

  void _addAccount(AddAccount event, Emitter<OperationFilterState> emit) {
    emit(OperationFilterState.addAccount(state, event.account));
  }

  void _removeAccount(RemoveAccount event, Emitter<OperationFilterState> emit) {
    emit(OperationFilterState.removeAccount(state, event.account));
  }

  void _addCategory(AddCategory event, Emitter<OperationFilterState> emit) {
    emit(OperationFilterState.addCategory(state, event.category));
  }

  void _removeCategory(
    RemoveCategory event,
    Emitter<OperationFilterState> emit,
  ) {
    emit(OperationFilterState.removeCategory(state, event.category));
  }
}
