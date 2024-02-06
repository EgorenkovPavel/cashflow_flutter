import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/domain/use_cases/get_operation_by_id_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/insert_operation_input_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/insert_operation_output_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/insert_operation_transfer_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/update_operation_input_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/update_operation_output_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/update_operation_transfer_use_case.dart';

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

  OperationEditState fromOperation(Operation operation) => operation.map(
        input: (o) => copyWith(
          operation: o,
          operationType: o.type,
          date: o.date,
          account: o.account,
          category: o.category,
          sum: o.sum,
          time: TimeOfDay.fromDateTime(operation.date),
        ),
        output: (o) => copyWith(
          operation: o,
          operationType: o.type,
          date: o.date,
          account: o.account,
          category: o.category,
          sum: o.sum,
          time: TimeOfDay.fromDateTime(operation.date),
        ),
        transfer: (o) => copyWith(
          operation: o,
          operationType: o.type,
          date: o.date,
          account: o.account,
          recAccount: o.recAccount,
          sum: o.sum,
          recSum: o.recSum,
          time: TimeOfDay.fromDateTime(operation.date),
        ),
      );
}

class OperationEditBloc extends Bloc<OperationEditEvent, OperationEditState> {
  final GetOperationByIdUseCase _getOperationByIdUseCase;
  final InsertOperationInputUseCase _insertOperationInputUseCase;
  final InsertOperationOutputUseCase _insertOperationOutputUseCase;
  final InsertOperationTransferUseCase _insertOperationTransferUseCase;
  final UpdateOperationInputUseCase _updateOperationInputUseCase;
  final UpdateOperationOutputUseCase _updateOperationOutputUseCase;
  final UpdateOperationTransferUseCase _updateOperationTransferUseCase;

  OperationEditBloc(
    this._getOperationByIdUseCase,
    this._insertOperationInputUseCase,
    this._insertOperationOutputUseCase,
    this._insertOperationTransferUseCase,
    this._updateOperationInputUseCase,
    this._updateOperationOutputUseCase,
    this._updateOperationTransferUseCase,
  ) : super(OperationEditState(
          date: DateTime.now(),
          time: TimeOfDay.now(),
          operationType: OperationType.INPUT,
          sum: 0,
          recSum: 0,
          isSaved: false,
        )) {
    on<OperationEditEvent>((event, emitter) => event.map(
          fetch: (event) => _fetch(event, emitter),
          changeDate: (event) => emitter(state.copyWith(date: event.date)),
          changeTime: (event) => emitter(state.copyWith(time: event.time)),
          changeOperationType: (event) => _changeOperationType(event, emitter),
          changeAccount: (event) =>
              emitter(state.copyWith(account: event.account)),
          changeCategory: (event) =>
              emitter(state.copyWith(category: event.category)),
          changeRecAccount: (event) =>
              emitter(state.copyWith(recAccount: event.recAccount)),
          changeSum: (event) => emitter(state.copyWith(sum: event.sum)),
          changeRecSum: (event) => emitter(state.copyWith(recSum: event.sum)),
          save: (event) => _save(event, emitter),
        ));
  }

  Future<void> _fetch(
    _FetchOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) async {
    final operation = await _getOperationByIdUseCase(event.operationId);
    emit(state.fromOperation(operation));
  }

  void _changeOperationType(
    _ChangeOperationTypeOperationEditEvent event,
    Emitter<OperationEditState> emit,
  ) {
    emit(state.copyWith(operationType: event.operationType, category: null));
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
        return _insertOperationTransferUseCase(
          date: date,
          account: state.account!,
          recAccount: state.recAccount!,
          sum: state.sum,
          recSum: state.recSum,
        );
      },
      INPUT: () {
        return _insertOperationInputUseCase(
          date: date,
          account: state.account!,
          category: state.category!,
          sum: state.sum,
        );
      },
      OUTPUT: () {
        return _insertOperationOutputUseCase(
          date: date,
          account: state.account!,
          category: state.category!,
          sum: state.sum,
        );
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

    return state.operationType!.map(
      TRANSFER: () {
        return _updateOperationTransferUseCase(
            operation: state.operation!,
            date: date,
            account: state.account!,
            recAccount: state.recAccount!,
            sum: state.sum,
            recSum: state.recSum);
      },
      INPUT: () {
        return _updateOperationInputUseCase(
          operation: state.operation!,
          date: date,
          account: state.account!,
          category: state.category!,
          sum: state.sum,
        );
      },
      OUTPUT: () {
        return _updateOperationOutputUseCase(
          operation: state.operation!,
          date: date,
          account: state.account!,
          category: state.category!,
          sum: state.sum,
        );
      },
    );
  }
}
