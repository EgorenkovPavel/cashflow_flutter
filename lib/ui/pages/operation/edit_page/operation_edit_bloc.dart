import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

part 'operation_edit_bloc.freezed.dart';

@freezed
class OperationEditEvent with _$OperationEditEvent {
  const factory OperationEditEvent.fetch({required int operationId}) =
      _FetchOperationEditEvent;

  const factory OperationEditEvent.changeDate({required DateTime date}) =
      _ChangeDateOperationEditEvent;

  const factory OperationEditEvent.changeTime({required TimeOfDay time}) =
      _ChangeTimeOperationEditEvent;

  const factory OperationEditEvent.changeOperationType({
    required OperationType operationType,
  }) = _ChangeOperationTypeOperationEditEvent;

  const factory OperationEditEvent.changeAccount({required Account account}) =
      _ChangeAccountOperationEditEvent;

  const factory OperationEditEvent.changeCategory({
    required Category category,
  }) = _ChangeCategoryOperationEditEvent;

  const factory OperationEditEvent.changeRecAccount({
    required Account recAccount,
  }) = _ChangeRecAccountOperationEditEvent;

  const factory OperationEditEvent.changeSum({required int sum}) =
      _ChangeSumOperationEditEvent;

  const factory OperationEditEvent.save() = _SaveOperationEditEvent;
}

@freezed
class OperationEditState with _$OperationEditState {
  const OperationEditState._();

  const factory OperationEditState.main({
    required Operation operation,
    required DateTime date,
    required TimeOfDay time,
    required OperationType operationType,
    required Account account,
    Category? category,
    Account? recAccount,
    required int sum,
    required List<Account> accounts,
    required List<Category> inCategories,
    required List<Category> outCategories,
  }) = _MainOperationEditState;

  const factory OperationEditState.fetched({
    required Operation operation,
    required DateTime date,
    required TimeOfDay time,
    required OperationType operationType,
    required Account account,
    Category? category,
    Account? recAccount,
    required int sum,
    required List<Account> accounts,
    required List<Category> inCategories,
    required List<Category> outCategories,
  }) = _FetchedOperationEditState;

  const factory OperationEditState.saved({
    required Operation operation,
    required DateTime date,
    required TimeOfDay time,
    required OperationType operationType,
    required Account account,
    Category? category,
    Account? recAccount,
    required int sum,
    required List<Account> accounts,
    required List<Category> inCategories,
    required List<Category> outCategories,
  }) = _SavedOperationEditState;

  factory OperationEditState.initial() => OperationEditState.main(
        operation: Operation(
          date: DateTime.now(),
          type: OperationType.INPUT,
          account: const Account(title: '', isDebt: false),
          sum: 0,
        ),
        date: DateTime.now(),
        time: TimeOfDay.now(),
        operationType: OperationType.INPUT,
        account: const Account(title: '', isDebt: false),
        sum: 0,
        accounts: [],
        inCategories: [],
        outCategories: [],
      );

  factory OperationEditState.state({
    required OperationEditState state,
    Operation? operation,
    DateTime? date,
    TimeOfDay? time,
    OperationType? operationType,
    Account? account,
    Category? category,
    Account? recAccount,
    int? sum,
    List<Account>? accounts,
    List<Category>? inCategories,
    List<Category>? outCategories,
  }) =>
      OperationEditState.main(
        operation: operation ?? state.operation,
        date: date ?? state.date,
        time: time ?? state.time,
        operationType: operationType ?? state.operationType,
        account: account ?? state.account,
        category: category ?? state.category,
        recAccount: recAccount ?? state.recAccount,
        sum: sum ?? state.sum,
        accounts: accounts ?? state.accounts,
        inCategories: inCategories ?? state.inCategories,
        outCategories: outCategories ?? state.outCategories,
      );

  factory OperationEditState.resetCategory({
    required OperationEditState state,
  }) =>
      OperationEditState.main(
        operation: state.operation,
        date: state.date,
        time: state.time,
        operationType: state.operationType,
        account: state.account,
        category: null,
        recAccount: state.recAccount,
        sum: state.sum,
        accounts: state.accounts,
        inCategories: state.inCategories,
        outCategories: state.outCategories,
      );

  factory OperationEditState.fetchOperation({
    required Operation operation,
    required OperationEditState state,
  }) =>
      OperationEditState.fetched(
        operation: operation,
        operationType: operation.type,
        date: operation.date,
        account: operation.account,
        category: operation.category,
        recAccount: operation.recAccount,
        sum: operation.sum,
        time: TimeOfDay.fromDateTime(operation.date),
        accounts: state.accounts,
        inCategories: state.inCategories,
        outCategories: state.outCategories,
      );

  factory OperationEditState.savedOperation({
    required OperationEditState state,
  }) =>
      OperationEditState.saved(
        operation: state.operation,
        date: state.date,
        time: state.time,
        operationType: state.operationType,
        account: state.account,
        category: state.category,
        recAccount: state.recAccount,
        sum: state.sum,
        accounts: state.accounts,
        inCategories: state.inCategories,
        outCategories: state.outCategories,
      );

  bool get isFetched => maybeMap(
        fetched: (_) => true,
        orElse: () => false,
      );

  bool get isSaved => maybeMap(
    saved: (_) => true,
    orElse: () => false,
  );
}

class OperationEditBloc extends Bloc<OperationEditEvent, OperationEditState> {
  final DataRepository _repository;

  OperationEditBloc(this._repository) : super(OperationEditState.initial()) {
    on<OperationEditEvent>((event, emitter) => event.map(
          fetch: (event) => _fetch(event, emitter),
          changeDate: (event) => _changeDate(event, emitter),
          changeTime: (event) => _changeTime(event, emitter),
          changeOperationType: (event) => _changeOperationType(event, emitter),
          changeAccount: (event) => _changeAccount(event, emitter),
          changeCategory: (event) => _changeCategory(event, emitter),
          changeRecAccount: (event) => _changeRecAccount(event, emitter),
          changeSum: (event) => _changeSum(event, emitter),
          save: (event) => _save(event, emitter),
        ));
  }

  Future<void> _fetch(
    _FetchOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) async {
    final operation = await _repository.operations.getById(event.operationId);
    emit(OperationEditState.fetchOperation(operation: operation, state: state));

    final accounts = await _repository.accounts.getAll();
    final categories = await _repository.categories.getAll();

    emit(OperationEditState.state(
      state: state,
      accounts: accounts,
      inCategories: categories
          .where((category) => category.operationType == OperationType.INPUT)
          .toList(),
      outCategories: categories
          .where((category) => category.operationType == OperationType.OUTPUT)
          .toList(),
    ));
  }

  void _changeDate(
    _ChangeDateOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(OperationEditState.state(state: state, date: event.date));
  }

  void _changeTime(
    _ChangeTimeOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(OperationEditState.state(state: state, time: event.time));
  }

  void _changeOperationType(
    _ChangeOperationTypeOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(OperationEditState.state(
      state: state,
      operationType: event.operationType,
    ));
    emit(OperationEditState.resetCategory(state: state));
  }

  void _changeAccount(
    _ChangeAccountOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(OperationEditState.state(state: state, account: event.account));
  }

  void _changeCategory(
    _ChangeCategoryOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(OperationEditState.state(state: state, category: event.category));
  }

  void _changeRecAccount(
    _ChangeRecAccountOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(OperationEditState.state(state: state, recAccount: event.recAccount));
  }

  void _changeSum(
    _ChangeSumOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(OperationEditState.state(state: state, sum: event.sum));
  }

  Future<void> _save(
    _SaveOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) async {
    final date = DateTime(
      state.date.year,
      state.date.month,
      state.date.day,
      state.time.hour,
      state.time.minute,
    );
    if (state.operationType == OperationType.TRANSFER) {
      var newOperation = state.operation.copyWith(
        date: date,
        synced: false,
        type: state.operationType,
        account: state.account,
        category: null,
        recAccount: state.recAccount,
        sum: state.sum,
      );

      await _repository.operations.update(newOperation);
    } else {
      var newOperation = state.operation.copyWith(
        date: date,
        synced: false,
        type: state.operationType,
        account: state.account,
        category: state.category,
        recAccount: null,
        sum: state.sum,
      );

      await _repository.operations.update(newOperation);
    }

    emit(OperationEditState.savedOperation(state: state));
  }
}
