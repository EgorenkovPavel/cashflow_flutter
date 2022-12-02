import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

part 'operation_filter_bloc.freezed.dart';

@freezed
class OperationFilterEvent with _$OperationFilterEvent {
  const factory OperationFilterEvent.init({
    required OperationListFilter filter,
  }) = _InitOperationFilterEvent;

  const factory OperationFilterEvent.resetPeriod() =
      _ResetPeriodOperationFilterEvent;

  const factory OperationFilterEvent.setPeriod({
    required DateTimeRange period,
  }) = _SetPeriodOperationFilterEvent;

  const factory OperationFilterEvent.addAccount({required Account account}) =
      _AddAccountOperationFilterEvent;

  const factory OperationFilterEvent.removeAccount({required Account account}) =
      _RemoveAccountOperationFilterEvent;

  const factory OperationFilterEvent.addCategory({required Category category}) =
      _AddCategoryOperationFilterEvent;

  const factory OperationFilterEvent.removeCategory({
    required Category category,
  }) = _RemoveCategoryOperationFilterEvent;
}

@freezed
class OperationFilterState with _$OperationFilterState {
  const factory OperationFilterState({
    required OperationListFilter filter,
    required List<Account> accounts,
    required List<Category> inCategories,
    required List<Category> outCategories,
  }) = _OperationFilterState;

  factory OperationFilterState.initial() => const OperationFilterState(
        filter: OperationListFilter.empty(),
        accounts: [],
        inCategories: [],
        outCategories: [],
      );

  factory OperationFilterState.resetPeriod(OperationFilterState state) =>
      OperationFilterState(
        filter: state.filter.copyWith(period: null),
        accounts: state.accounts,
        inCategories: state.inCategories,
        outCategories: state.outCategories,
      );

  factory OperationFilterState.period(
    OperationFilterState state,
    DateTimeRange period,
  ) =>
      OperationFilterState(
        filter: state.filter.copyWith(period: period),
        accounts: state.accounts,
        inCategories: state.inCategories,
        outCategories: state.outCategories,
      );

  factory OperationFilterState.addAccount(
    OperationFilterState state,
    Account account,
  ) =>
      OperationFilterState(
        filter: state.filter
            .copyWith(accounts: state.filter.accounts..add(account)),
        accounts: state.accounts,
        inCategories: state.inCategories,
        outCategories: state.outCategories,
      );

  factory OperationFilterState.removeAccount(
    OperationFilterState state,
    Account account,
  ) =>
      OperationFilterState(
        filter: state.filter.copyWith(
          accounts: state.filter.accounts
            ..removeWhere((a) => a.id == account.id),
        ),
        accounts: state.accounts,
        inCategories: state.inCategories,
        outCategories: state.outCategories,
      );

  factory OperationFilterState.addCategory(
    OperationFilterState state,
    Category category,
  ) =>
      OperationFilterState(
        filter: state.filter
            .copyWith(categories: state.filter.categories..add(category)),
        accounts: state.accounts,
        inCategories: state.inCategories,
        outCategories: state.outCategories,
      );

  factory OperationFilterState.removeCategory(
    OperationFilterState state,
    Category category,
  ) =>
      OperationFilterState(
        filter: state.filter.copyWith(
          categories: state.filter.categories
            ..removeWhere((c) => c.id == category.id),
        ),
        accounts: state.accounts,
        inCategories: state.inCategories,
        outCategories: state.outCategories,
      );
}

class OperationFilterBloc
    extends Bloc<OperationFilterEvent, OperationFilterState> {
  final DataRepository _repository;

  OperationFilterBloc(this._repository)
      : super(OperationFilterState.initial()) {
    on<OperationFilterEvent>((event, emitter) => event.map(
          init: (event) => _init(event, emitter),
          resetPeriod: (event) => _resetPeriod(event, emitter),
          setPeriod: (event) => _setPeriod(event, emitter),
          addAccount: (event) => _addAccount(event, emitter),
          removeAccount: (event) => _removeAccount(event, emitter),
          addCategory: (event) => _addCategory(event, emitter),
          removeCategory: (event) => _removeCategory(event, emitter),
        ));
  }

  FutureOr<void> _init(
    _InitOperationFilterEvent event,
    Emitter<OperationFilterState> emit,
  ) async {
    final accounts = await _repository.accounts.getAll();
    final inCategories =
        await _repository.categories.getAllByType(OperationType.INPUT);
    final outCategories =
        await _repository.categories.getAllByType(OperationType.OUTPUT);

    emit(OperationFilterState(
      filter: event.filter,
      accounts: accounts,
      inCategories: inCategories,
      outCategories: outCategories,
    ));
  }

  FutureOr<void> _resetPeriod(
    _ResetPeriodOperationFilterEvent event,
    Emitter<OperationFilterState> emit,
  ) {
    emit(OperationFilterState.resetPeriod(state));
  }

  FutureOr<void> _setPeriod(
    _SetPeriodOperationFilterEvent event,
    Emitter<OperationFilterState> emit,
  ) {
    emit(OperationFilterState.period(state, event.period));
  }

  FutureOr<void> _addAccount(
    _AddAccountOperationFilterEvent event,
    Emitter<OperationFilterState> emit,
  ) {
    emit(OperationFilterState.addAccount(state, event.account));
  }

  FutureOr<void> _removeAccount(
    _RemoveAccountOperationFilterEvent event,
    Emitter<OperationFilterState> emit,
  ) {
    emit(OperationFilterState.removeAccount(state, event.account));
  }

  FutureOr<void> _addCategory(
    _AddCategoryOperationFilterEvent event,
    Emitter<OperationFilterState> emit,
  ) {
    emit(OperationFilterState.addCategory(state, event.category));
  }

  FutureOr<void> _removeCategory(
    _RemoveCategoryOperationFilterEvent event,
    Emitter<OperationFilterState> emit,
  ) {
    emit(OperationFilterState.removeCategory(state, event.category));
  }
}
