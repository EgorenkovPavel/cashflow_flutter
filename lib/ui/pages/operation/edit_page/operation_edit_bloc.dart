import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

abstract class OperationEditEvent {}

class Fetch extends OperationEditEvent {
  final int operationId;

  Fetch(this.operationId);
}

class ChangeDate extends OperationEditEvent {
  final DateTime date;

  ChangeDate(this.date);
}

class ChangeTime extends OperationEditEvent {
  final TimeOfDay time;

  ChangeTime(this.time);
}

class ChangeOperationType extends OperationEditEvent {
  final OperationType operationType;

  ChangeOperationType(this.operationType);
}

class ChangeAccount extends OperationEditEvent {
  final Account account;

  ChangeAccount(this.account);
}

class ChangeCategory extends OperationEditEvent {
  final Category category;

  ChangeCategory(this.category);
}

class ChangeRecAccount extends OperationEditEvent {
  final Account recAccount;

  ChangeRecAccount(this.recAccount);
}

class ChangeSum extends OperationEditEvent {
  final int sum;

  ChangeSum(this.sum);
}

class Save extends OperationEditEvent {}

abstract class OperationEditState {
  final Operation operation;
  final DateTime date;
  final TimeOfDay time;
  final OperationType operationType;
  final Account account;
  final Category? category;
  final Account? recAccount;
  final int sum;

  final List<Account> accounts;
  final List<Category> inCategories;
  final List<Category> outCategories;

  OperationEditState({
    required this.operation,
    required this.date,
    required this.time,
    required this.operationType,
    required this.account,
    this.category,
    this.recAccount,
    required this.sum,
    required this.accounts,
    required this.inCategories,
    required this.outCategories,
  });
}

class Data extends OperationEditState {
  Data(
    Operation operation,
    DateTime date,
    TimeOfDay time,
    OperationType operationType,
    Account account,
    Category? category,
    Account? recAccount,
    int sum,
    List<Account> accounts,
    List<Category> inCategories,
    List<Category> outCategories,
  ) : super(
          operation: operation,
          date: date,
          time: time,
          operationType: operationType,
          account: account,
          category: category,
          recAccount: recAccount,
          sum: sum,
          accounts: accounts,
          inCategories: inCategories,
          outCategories: outCategories,
        );

  Data.initial()
      : super(
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

  Data.state({
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
  }) : super(
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

  Data.resetCategory({
    required OperationEditState state,
  }) : super(
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
}

class FetchOperation extends OperationEditState {
  FetchOperation({
    required Operation operation,
    required OperationEditState state,
  }) : super(
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
}

class Saved extends OperationEditState {
  Saved({required OperationEditState state})
      : super(
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
}

class OperationEditBloc extends Bloc<OperationEditEvent, OperationEditState> {
  final DataRepository _repository;

  OperationEditBloc(this._repository) : super(Data.initial()) {
    on<Fetch>(_fetch);
    on<ChangeDate>(_changeDate);
    on<ChangeTime>(_changeTime);
    on<ChangeOperationType>(_changeOperationType);
    on<ChangeAccount>(_changeAccount);
    on<ChangeCategory>(_changeCategory);
    on<ChangeRecAccount>(_changeRecAccount);
    on<ChangeSum>(_changeSum);
    on<Save>(_save);
  }

  Future<void> _fetch(Fetch event, Emitter<OperationEditState> emit) async {
    final operation = await _repository.operations.getById(event.operationId);
    emit(FetchOperation(operation: operation, state: state));

    final accounts = await _repository.accounts.getAll();
    final categories = await _repository.categories.getAll();

    emit(Data.state(
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

  void _changeDate(ChangeDate event, Emitter<OperationEditState> emit) {
    emit(Data.state(state: state, date: event.date));
  }

  void _changeTime(ChangeTime event, Emitter<OperationEditState> emit) {
    emit(Data.state(state: state, time: event.time));
  }

  void _changeOperationType(
    ChangeOperationType event,
    Emitter<OperationEditState> emit,
  ) {
    emit(Data.state(state: state, operationType: event.operationType));
    emit(Data.resetCategory(state: state));
  }

  void _changeAccount(ChangeAccount event, Emitter<OperationEditState> emit) {
    emit(Data.state(state: state, account: event.account));
  }

  void _changeCategory(ChangeCategory event, Emitter<OperationEditState> emit) {
    emit(Data.state(state: state, category: event.category));
  }

  void _changeRecAccount(
    ChangeRecAccount event,
    Emitter<OperationEditState> emit,
  ) {
    emit(Data.state(state: state, recAccount: event.recAccount));
  }

  void _changeSum(ChangeSum event, Emitter<OperationEditState> emit) {
    emit(Data.state(state: state, sum: event.sum));
  }

  Future<void> _save(Save event, Emitter<OperationEditState> emit) async {
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
        type: state.operationType,
        account: state.account,
        category: state.category,
        recAccount: null,
        sum: state.sum,
      );

      await _repository.operations.update(newOperation);
    }

    emit(Saved(state: state));
  }
}
