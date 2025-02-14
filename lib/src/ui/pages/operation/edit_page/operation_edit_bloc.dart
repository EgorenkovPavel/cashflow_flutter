import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/domain/use_cases/get_operation_by_id_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/insert_operation_input_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/insert_operation_output_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/insert_operation_transfer_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/update_operation_input_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/update_operation_output_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/update_operation_transfer_use_case.dart';

import '../../../../utils/sum.dart';

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

  const factory OperationEditEvent.changeAccount(
      {required BaseAccount account}) = _ChangeAccountOperationEditEvent;

  const factory OperationEditEvent.changeCategory({
    required Category category,
  }) = _ChangeCategoryOperationEditEvent;

  const factory OperationEditEvent.changeRecAccount({
    required BaseAccount recAccount,
  }) = _ChangeRecAccountOperationEditEvent;

  const factory OperationEditEvent.changeSum({required int sum}) =
      _ChangeSumOperationEditEvent;

  const factory OperationEditEvent.changeRecSum({required int sum}) =
      _ChangeRecSumOperationEditEvent;

  const factory OperationEditEvent.changeCurrency(
      {required Currency currency}) = _ChangeCurrencyOperationEditEvent;

  const factory OperationEditEvent.changeRecCurrency(
      {required Currency currency}) = _ChangeRecCurrencyOperationEditEvent;

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
    BaseAccount? account,
    Category? category,
    BaseAccount? recAccount,
    required Sum sum,
    required Sum recSum,
    required bool isSaved,
  }) = _OperationEditState;

  OperationEditState fromOperation(Operation operation) => switch (operation) {
        InputOperation() => copyWith(
            operation: operation,
            operationType: operation.type,
            date: operation.date,
            account: operation.account,
            category: operation.category,
            sum: operation.sum,
            time: TimeOfDay.fromDateTime(operation.date),
          ),
        OutputOperation() => copyWith(
            operation: operation,
            operationType: operation.type,
            date: operation.date,
            account: operation.account,
            category: operation.category,
            sum: operation.sum,
            time: TimeOfDay.fromDateTime(operation.date),
          ),
        TransferOperation() => copyWith(
            operation: operation,
            operationType: operation.type,
            date: operation.date,
            account: operation.account,
            recAccount: operation.recAccount,
            sum: operation.sum,
            recSum: operation.recSum,
            time: TimeOfDay.fromDateTime(operation.date),
          ),
      };
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
          sum: Sum(0, Currency.RUB),
          recSum: Sum(0, Currency.RUB),
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
          changeSum: (event) =>
              emitter(state.copyWith(sum: state.sum.copyWith(sum: event.sum))),
          changeRecSum: (event) => emitter(
              state.copyWith(recSum: state.recSum.copyWith(sum: event.sum))),
          changeCurrency: (event) => emitter(state.copyWith(
              sum: state.sum.copyWith(currency: event.currency))),
          changeRecCurrency: (event) => emitter(state.copyWith(
              sum: state.recSum.copyWith(currency: event.currency))),
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
          account: state.account! as Account,
          category: state.category! as InputCategoryItem,
          sum: state.sum,
        );
      },
      OUTPUT: () {
        return _insertOperationOutputUseCase(
          date: date,
          account: state.account! as Account,
          category: state.category! as OutputCategoryItem,
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

    return state.operationType.map(
      TRANSFER: () {
        return _updateOperationTransferUseCase(
          operation: state.operation!,
          date: date,
          account: state.account!,
          recAccount: state.recAccount!,
          sum: state.sum,
          recSum: state.recSum,
        );
      },
      INPUT: () {
        return _updateOperationInputUseCase(
          operation: state.operation!,
          date: date,
          account: state.account! as Account,
          category: state.category! as InputCategoryItem,
          sum: state.sum,
        );
      },
      OUTPUT: () {
        return _updateOperationOutputUseCase(
          operation: state.operation!,
          date: date,
          account: state.account! as Account,
          category: state.category! as OutputCategoryItem,
          sum: state.sum,
        );
      },
    );
  }
}
