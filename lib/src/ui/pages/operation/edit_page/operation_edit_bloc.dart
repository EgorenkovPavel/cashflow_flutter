import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/src/domain/models.dart';

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

  const factory OperationEditEvent.changeRecSum({required int sum}) =
      _ChangeRecSumOperationEditEvent;

  const factory OperationEditEvent.save() = _SaveOperationEditEvent;
}

@freezed
class OperationEditState with _$OperationEditState {
  const OperationEditState._();

  const factory OperationEditState({
    Operation? operation,
    required DateTime date,
    required TimeOfDay time,
    required OperationType operationType,
    Account? account,
    Category? category,
    Account? recAccount,
    required int sum,
    required int recSum,
    required bool isSaved,
  }) = _OperationEditState;
}

class OperationEditBloc extends Bloc<OperationEditEvent, OperationEditState> {
  final DataRepository _repository;

  OperationEditBloc(this._repository)
      : super(OperationEditState(
          date: DateTime.now(),
          time: TimeOfDay.now(),
          operationType: OperationType.INPUT,
          sum: 0,
          recSum: 0,
          isSaved: false,
        )) {
    on<OperationEditEvent>((event, emitter) => event.map(
          fetch: (event) => _fetch(event, emitter),
          changeDate: (event) => _changeDate(event, emitter),
          changeTime: (event) => _changeTime(event, emitter),
          changeOperationType: (event) => _changeOperationType(event, emitter),
          changeAccount: (event) => _changeAccount(event, emitter),
          changeCategory: (event) => _changeCategory(event, emitter),
          changeRecAccount: (event) => _changeRecAccount(event, emitter),
          changeSum: (event) => _changeSum(event, emitter),
          changeRecSum: (event) => _changeRecSum(event, emitter),
          save: (event) => _save(event, emitter),
        ));
  }

  Future<void> _fetch(
    _FetchOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) async {
    final operation = await _repository.operations.getById(event.operationId);
    emit(state.copyWith(
      operation: operation,
      operationType: operation.type,
      date: operation.date,
      account: operation.account,
      category: operation.map(
        input: (operation) => operation.category,
        output: (operation) => operation.category,
        transfer: (operation) => null,
      ),
      recAccount: operation.map(
        input: (operation) => null,
        output: (operation) => null,
        transfer: (operation) => operation.recAccount,
      ),
      sum: operation.sum,
      recSum: operation.maybeMap(
        transfer: (operation) => operation.recSum,
        orElse: () => 0,
      ),
      time: TimeOfDay.fromDateTime(operation.date),
    ));
  }

  void _changeDate(
    _ChangeDateOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(state.copyWith(date: event.date));
  }

  void _changeTime(
    _ChangeTimeOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(state.copyWith(time: event.time));
  }

  void _changeOperationType(
    _ChangeOperationTypeOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(state.copyWith(operationType: event.operationType, category: null));
  }

  void _changeAccount(
    _ChangeAccountOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(state.copyWith(account: event.account));
  }

  void _changeCategory(
    _ChangeCategoryOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(state.copyWith(category: event.category));
  }

  void _changeRecAccount(
    _ChangeRecAccountOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(state.copyWith(recAccount: event.recAccount));
  }

  void _changeSum(
    _ChangeSumOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(state.copyWith(sum: event.sum));
  }

  Future<void> _save(
    _SaveOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) async {
    if (state.operation == null) {
      emit(state.copyWith(
        operation: await _insertOperation(),
        isSaved: true,
      ));
    } else {
      emit(state.copyWith(
        operation: await _updateOperation(),
        isSaved: true,
      ));
    }
  }

  Future<Operation> _insertOperation() async {
    final date = DateTime(
      state.date.year,
      state.date.month,
      state.date.day,
      state.time.hour,
      state.time.minute,
    );

    return state.operationType.map(
      TRANSFER: () {
        var newOperation = Operation.transfer(
          date: date,
          account: state.account!,
          recAccount: state.recAccount!,
          sum: state.sum,
          recSum: state.recSum,
        );

        return _repository.operations.insert(newOperation);
      },
      INPUT: () {
        var newOperation = Operation.input(
          date: date,
          account: state.account!,
          category: state.category!,
          sum: state.sum,
        );

        return _repository.operations.insert(newOperation);
      },
      OUTPUT: () {
        var newOperation = Operation.output(
          date: date,
          account: state.account!,
          category: state.category!,
          sum: state.sum,
        );

        return _repository.operations.insert(newOperation);
      },
    );
  }

  Future<Operation> _updateOperation() async {
    final date = DateTime(
      state.date.year,
      state.date.month,
      state.date.day,
      state.time.hour,
      state.time.minute,
    );

    return state.operation!.map(
      transfer: (operation) async {
        var newOperation = operation.copyWith(
          date: date,
          account: state.account!,
          recAccount: state.recAccount!,
          sum: state.sum,
          recSum: state.recSum,
        );

        await _repository.operations.update(newOperation);

        return newOperation;
      },
      input: (operation) async {
        var newOperation = operation.copyWith(
          date: date,
          account: state.account!,
          category: state.category!,
          sum: state.sum,
        );

        await _repository.operations.update(newOperation);

        return newOperation;
      },
      output: (operation) async {
        var newOperation = operation.copyWith(
          date: date,
          account: state.account!,
          category: state.category!,
          sum: state.sum,
        );

        await _repository.operations.update(newOperation);

        return newOperation;
      },
    );
  }

  _changeRecSum(
    _ChangeRecSumOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(state.copyWith(recSum: event.sum));
  }
}
