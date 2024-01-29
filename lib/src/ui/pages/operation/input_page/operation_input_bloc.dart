// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/domain/use_cases/insert_operation_input_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/insert_operation_output_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/insert_operation_transfer_use_case.dart';

import '../../../../domain/use_cases/delete_operation_use_case.dart';
import '../../../../domain/use_cases/get_last_operation_use_case.dart';

part 'operation_input_bloc.freezed.dart';

@freezed
class MasterEvent with _$MasterEvent {
  const factory MasterEvent.backPressed() = _BackPressedMasterEvent;

  const factory MasterEvent.start() = _StartMasterEvent;

  const factory MasterEvent.addNewItem() = _AddNewItemMassterEvent;

  const factory MasterEvent.sumTap() = _SumTapMasterEvent;

  const factory MasterEvent.recSumTap() = _RecSumTapMasterEvent;

  const factory MasterEvent.changeOperationType({
    required OperationType operationType,
  }) = _ChangeOperationTypeMasterEvent;

  const factory MasterEvent.digitTap({required int digit}) =
      _DigitTapMasterEvent;

  const factory MasterEvent.backKeyTap() = _BackKeyTapMasterEvent;

  const factory MasterEvent.moreTap() = _MoreTapMasterEvent;

  const factory MasterEvent.changeAccount({required AccountBalance account}) =
      _ChangeAccountMasterEvent;

  const factory MasterEvent.changeInCategory({required Category category}) =
      _ChangeInCategoryMasterEvent;

  const factory MasterEvent.changeOutCategory({required Category category}) =
      _ChangeOutCategoryMasterEvent;

  const factory MasterEvent.changeRecAccount({
    required AccountBalance account,
  }) = _ChangeRecAccountMasterEvent;

  const factory MasterEvent.cancelOperation() = _CancelOperationMasterEvent;

  const factory MasterEvent.nextTap() = _NextTapMasterEvent;
}

enum MasterStateAction {
  DATA,
  CLOSE,
  SHOW_KEYBOARD,
  HIDE_KEYBOARD,
  SET_ACCOUNT,
  SET_IN_CATEGORY,
  SET_OUT_CATEGORY,
  SET_REC_ACCOUNT,
  SHOW_EMPTY_ACCOUNT_MESSAGE,
  SHOW_EMPTY_CATEGORY_MESSAGE,
  SHOW_EMPTY_REC_ACCOUNT_MESSAGE,
  SHOW_EMPTY_SUM_MESSAGE,
  SHOW_OPERATION_CREATED_MESSAGE,
  SHOW_OPERATION_CANCELED_MESSAGE,
}

@freezed
class MasterState with _$MasterState {
  const factory MasterState({
    required MasterStateAction action,
    required OperationType operationType,
    required int sum,
    required int recSum,
    required bool showKeyboard,
    required bool highlightSum,
    required bool highlightRecSum,
    AccountBalance? account,
    Category? categoryIn,
    Category? categoryOut,
    AccountBalance? recAccount,
    Operation? operation,
  }) = _MasterState;
}

class MasterBloc extends Bloc<MasterEvent, MasterState> {
  final InsertOperationInputUseCase _insertOperationInputUseCase;
  final InsertOperationOutputUseCase _insertOperationOutputUseCase;
  final InsertOperationTransferUseCase _insertOperationTransferUseCase;
  final GetLastOperationUseCase _getLastOperationUseCase;
  final DeleteOperationUseCase _deleteOperationUseCase;

  MasterBloc(
    this._insertOperationInputUseCase,
    this._insertOperationOutputUseCase,
    this._insertOperationTransferUseCase,
    this._getLastOperationUseCase,
    this._deleteOperationUseCase,
  ) : super(const MasterState(
          action: MasterStateAction.DATA,
          operationType: OperationType.INPUT,
          sum: 0,
          recSum: 0,
          showKeyboard: false,
          highlightSum: false,
          highlightRecSum: false,
        )) {
    on<MasterEvent>(
      (event, emitter) => event.map(
        backPressed: (event) => _backPressed(event, emitter),
        start: (event) => _start(event, emitter),
        addNewItem: (event) => _addNewItem(event, emitter),
        sumTap: (event) => _sumTap(event, emitter),
        recSumTap: (event) => _recSumTap(event, emitter),
        changeOperationType: (event) => _changeOperationType(event, emitter),
        digitTap: (event) => _digitTap(event, emitter),
        backKeyTap: (event) => _backKeyTap(event, emitter),
        moreTap: (event) => _moreTap(event, emitter),
        changeAccount: (event) => _changeAccount(event, emitter),
        changeInCategory: (event) => _changeInCategory(event, emitter),
        changeOutCategory: (event) => _changeOutCategory(event, emitter),
        changeRecAccount: (event) => _changeRecAccount(event, emitter),
        cancelOperation: (event) => _cancelOperation(event, emitter),
        nextTap: (event) => _nextTap(event, emitter),
      ),
    );

    add(const MasterEvent.start());
  }

  FutureOr<void> _start(
    _StartMasterEvent event,
    Emitter<MasterState> emit,
  ) async {
    var op = await _getLastOperationUseCase();

    if (op == null) {
      return;
    }

    emit(state.copyWith(
      account: AccountBalance(
        id: op.account.id,
        cloudId: op.cloudId,
        title: op.account.title,
        currency: op.account.currency,
        balance: 0,
      ),
      action: MasterStateAction.SET_ACCOUNT,
    ));

    emit(state.copyWith(
      operationType: op.type,
      action: MasterStateAction.DATA,
    ));
    op.map(
      input: (operation) => emit(state.copyWith(
        categoryIn: operation.category,
        action: MasterStateAction.SET_IN_CATEGORY,
      )),
      output: (operation) => emit(state.copyWith(
        categoryOut: operation.category,
        action: MasterStateAction.SET_OUT_CATEGORY,
      )),
      transfer: (operation) => emit(state.copyWith(
        recAccount: AccountBalance(
          id: operation.recAccount.id,
          cloudId: operation.recAccount.cloudId,
          title: operation.recAccount.title,
          currency: operation.recAccount.currency,
          balance: 0,
        ),
        action: MasterStateAction.SET_REC_ACCOUNT,
      )),
    );
  }

  FutureOr<void> _backPressed(
    _BackPressedMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    if (state.showKeyboard) {
      emit(state.copyWith(
        action: MasterStateAction.HIDE_KEYBOARD,
        showKeyboard: false,
      ));
    } else {
      emit(state.copyWith(action: MasterStateAction.CLOSE));
    }
  }

  FutureOr<void> _addNewItem(
    _AddNewItemMassterEvent event,
    Emitter<MasterState> emit,
  ) {
    if (state.showKeyboard) {
      emit(state.copyWith(
        action: MasterStateAction.HIDE_KEYBOARD,
        showKeyboard: false,
        highlightSum: false,
        highlightRecSum: false,
      ));
    }
  }

  FutureOr<void> _sumTap(_SumTapMasterEvent event, Emitter<MasterState> emit) {
    emit(state.copyWith(
      action: !state.showKeyboard
          ? MasterStateAction.SHOW_KEYBOARD
          : MasterStateAction.DATA,
      showKeyboard: true,
      highlightSum: true,
      highlightRecSum: false,
    ));
  }

  FutureOr<void> _recSumTap(
    _RecSumTapMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    emit(state.copyWith(
      action: !state.showKeyboard
          ? MasterStateAction.SHOW_KEYBOARD
          : MasterStateAction.DATA,
      showKeyboard: true,
      highlightSum: false,
      highlightRecSum: true,
    ));
  }

  FutureOr<void> _changeOperationType(
    _ChangeOperationTypeMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    emit(state.copyWith(
      operationType: event.operationType,
      action: MasterStateAction.DATA,
    ));
  }

  FutureOr<void> _digitTap(
    _DigitTapMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    if (state.highlightSum) {
      emit(state.copyWith(
        sum: state.sum * 10 + event.digit,
        action: MasterStateAction.DATA,
      ));
    } else if (state.highlightRecSum) {
      emit(state.copyWith(
        recSum: state.recSum * 10 + event.digit,
        action: MasterStateAction.DATA,
      ));
    }
  }

  FutureOr _backKeyTap(
    _BackKeyTapMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    if (state.highlightSum) {
      emit(state.copyWith(
        sum: (state.sum / 10).floor(),
        action: MasterStateAction.DATA,
      ));
    } else if (state.highlightRecSum) {
      emit(state.copyWith(
        recSum: (state.recSum / 10).floor(),
        action: MasterStateAction.DATA,
      ));
    }
  }

  FutureOr<void> _moreTap(
    _MoreTapMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    emit(state.copyWith(action: MasterStateAction.CLOSE));
  }

  FutureOr<void> _changeAccount(
    _ChangeAccountMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    emit(state.copyWith(
      account: event.account,
      action: MasterStateAction.DATA,
    ));
  }

  FutureOr<void> _changeInCategory(
    _ChangeInCategoryMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    emit(state.copyWith(
      categoryIn: event.category,
      action: MasterStateAction.DATA,
    ));
  }

  FutureOr<void> _changeOutCategory(
    _ChangeOutCategoryMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    emit(state.copyWith(
      categoryOut: event.category,
      action: MasterStateAction.DATA,
    ));
  }

  FutureOr<void> _changeRecAccount(
    _ChangeRecAccountMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    emit(state.copyWith(
      recAccount: event.account,
      action: MasterStateAction.DATA,
    ));
  }

  FutureOr<void> _cancelOperation(
    _CancelOperationMasterEvent event,
    Emitter<MasterState> emit,
  ) async {
    await _deleteOperationUseCase(state.operation!);
    emit(state.copyWith(
      operation: null,
      action: MasterStateAction.SHOW_OPERATION_CANCELED_MESSAGE,
    ));
  }

  FutureOr<void> _nextTap(
    _NextTapMasterEvent event,
    Emitter<MasterState> emit,
  ) async {
    if (state.account == null) {
      emit(
        state.copyWith(
          action: MasterStateAction.SHOW_EMPTY_ACCOUNT_MESSAGE,
        ),
      );

      return;
    }

    if (state.operationType == OperationType.TRANSFER &&
        state.recAccount == null) {
      emit(state.copyWith(
        action: MasterStateAction.SHOW_EMPTY_REC_ACCOUNT_MESSAGE,
      ));

      return;
    }

    if (state.operationType == OperationType.INPUT &&
        state.categoryIn == null) {
      emit(state.copyWith(
        action: MasterStateAction.SHOW_EMPTY_CATEGORY_MESSAGE,
      ));

      return;
    }

    if (state.operationType == OperationType.OUTPUT &&
        state.categoryOut == null) {
      emit(state.copyWith(
        action: MasterStateAction.SHOW_EMPTY_CATEGORY_MESSAGE,
      ));

      return;
    }

    if (state.sum == 0) {
      emit(state.copyWith(action: MasterStateAction.SHOW_EMPTY_SUM_MESSAGE));

      return;
    }

    final operation = await _saveOperation();
    emit(state.copyWith(
      operation: operation,
      action: MasterStateAction.SHOW_OPERATION_CREATED_MESSAGE,
    ));

    emit(state.copyWith(
      action: MasterStateAction.HIDE_KEYBOARD,
      sum: 0,
      recSum: 0,
      showKeyboard: false,
    ));
  }

  Future<Operation> _saveOperation() {
    switch (state.operationType) {
      case OperationType.INPUT:
        {
          return _insertOperationInputUseCase(
            date: DateTime.now(),
            account: state.account!.account,
            category: state.categoryIn!,
            sum: state.sum,
          );
        }
      case OperationType.OUTPUT:
        {
          return _insertOperationOutputUseCase(
            date: DateTime.now(),
            account: state.account!.account,
            category: state.categoryOut!,
            sum: state.sum,
          );
        }
      case OperationType.TRANSFER:
        {
          return _insertOperationTransferUseCase(
            date: DateTime.now(),
            account: state.account!.account,
            recAccount: state.recAccount!.account,
            sum: state.sum,
            recSum: state.recSum,
          );
        }
      default:
        {
          throw 'Unknown value';
        }
    }
  }
}
