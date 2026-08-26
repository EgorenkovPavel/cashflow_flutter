// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interactors/operation_interactor.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/utils/logger.dart';
import 'package:money_tracker/src/utils/result.dart';

part 'operation_input_bloc.freezed.dart';

@freezed
class MasterEvent with _$MasterEvent {
  const factory MasterEvent.start() = _StartMasterEvent;

  const factory MasterEvent.changeOperationType(OperationType operationType) =
      _ChangeOperationTypeMasterEvent;

  const factory MasterEvent.changeAccount(int id) = _ChangeAccountMasterEvent;

  const factory MasterEvent.changeCategory(int? id) =
      _ChangeCategoryMasterEvent;

  const factory MasterEvent.changeRecAccount(int id) =
      _ChangeRecAccountMasterEvent;

  const factory MasterEvent.changeSum(Money sum) = _ChangeSumMasterEvent;

  const factory MasterEvent.changeRecSum(Money sum) = _ChangeRecSumMasterEvent;

  const factory MasterEvent.cancelOperation() = _CancelOperationMasterEvent;

  const factory MasterEvent.nextTap() = _NextTapMasterEvent;
}

enum MasterStateAction {
  SHOW_EMPTY_ACCOUNT_MESSAGE,
  SHOW_EMPTY_CATEGORY_MESSAGE,
  SHOW_EMPTY_REC_ACCOUNT_MESSAGE,
  SHOW_EMPTY_SUM_MESSAGE,
  SHOW_EMPTY_REC_SUM_MESSAGE,
  SHOW_OPERATION_CREATED_MESSAGE,
  SHOW_OPERATION_CANCELED_MESSAGE,
}

@freezed
abstract class MasterState with _$MasterState {
  const factory MasterState.input({
    int? accountId,
    int? categoryId,
    required Money sum,
    Operation? operation,
    MasterStateAction? action,
  }) = _InputMasterState;

  const factory MasterState.output({
    int? accountId,
    int? categoryId,
    required Money sum,
    Operation? operation,
    MasterStateAction? action,
  }) = _OutputMasterState;

  const factory MasterState.transfer({
    int? accountId,
    int? recAccountId,
    required Money sum,
    Operation? operation,
    MasterStateAction? action,
  }) = _TransferMasterState;

  const factory MasterState.exchange({
    int? accountId,
    required Money sum,
    required Money recSum,
    Operation? operation,
    MasterStateAction? action,
  }) = _ExchangeMasterState;
}

class MasterBloc extends Bloc<MasterEvent, MasterState> {
  final OperationInteractor _operationInteractor;

  MasterBloc(this._operationInteractor)
    : super(MasterState.input(sum: Money(0, Currency.RUB))) {
    on<MasterEvent>(
      (event, emitter) => event.map(
        start: (event) => _start(event, emitter),
        changeOperationType: (event) => _changeOperationType(event, emitter),
        changeAccount: (event) => _changeAccount(event, emitter),
        changeCategory: (event) => _changeCategory(event, emitter),
        changeRecAccount: (event) => _changeRecAccount(event, emitter),
        cancelOperation: (event) => _cancelOperation(event, emitter),
        nextTap: (event) => _nextTap(event, emitter),
        changeSum: (event) => _changeSum(event, emitter),
        changeRecSum: (event) => _changeRecSum(event, emitter),
      ),
    );

    add(const MasterEvent.start());
  }

  FutureOr<void> _start(
    _StartMasterEvent event,
    Emitter<MasterState> emit,
  ) async {
    final result = await _operationInteractor.getLast();
    final op = result.getOrNull();

    if (op == null) {
      return;
    }

    switch (op) {
      case InputOperation(:final category):
        emit(
          MasterState.input(
            accountId: op.account,
            categoryId: category,
            sum: state.sum,
          ),
        );
      case OutputOperation(:final category):
        emit(
          MasterState.output(
            accountId: op.account,
            categoryId: category,
            sum: state.sum,
          ),
        );
      case TransferOperation(:final accountReceived):
        emit(
          MasterState.transfer(
            accountId: op.accountSend,
            recAccountId: accountReceived,
            sum: state.sum,
          ),
        );
      case ExchangeOperation():
        emit(
          MasterState.exchange(
            accountId: op.account,
            sum: state.sum,
            recSum: Money(0, .RUB),
          ),
        );
    }
  }

  FutureOr<void> _changeOperationType(
    _ChangeOperationTypeMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    switch (event.operationType) {
      case .INPUT:
        emit(MasterState.input(accountId: state.accountId, sum: state.sum));
      case .OUTPUT:
        emit(MasterState.output(accountId: state.accountId, sum: state.sum));
      case .TRANSFER:
        emit(MasterState.transfer(accountId: state.accountId, sum: state.sum));
      case .EXCHANGE:
        emit(
          MasterState.exchange(
            accountId: state.accountId,
            sum: state.sum,
            recSum: Money(0, .RUB),
          ),
        );
    }
  }

  FutureOr<void> _changeAccount(
    _ChangeAccountMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    emit(state.copyWith(accountId: event.id, action: null));
  }

  FutureOr<void> _changeSum(
    _ChangeSumMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    emit(state.copyWith(sum: event.sum, action: null));
  }

  FutureOr<void> _changeRecSum(
    _ChangeRecSumMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    state.maybeMap(
      exchange: (s) => emit(s.copyWith(recSum: event.sum, action: null)),
      orElse: () {},
    );
  }

  FutureOr<void> _changeCategory(
    _ChangeCategoryMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    state.maybeMap(
      input: (s) => emit(s.copyWith(categoryId: event.id, action: null)),
      output: (s) => emit(s.copyWith(categoryId: event.id, action: null)),
      orElse: () {},
    );
  }

  FutureOr<void> _changeRecAccount(
    _ChangeRecAccountMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    state.maybeMap(
      transfer: (s) => emit(s.copyWith(recAccountId: event.id, action: null)),
      orElse: () {},
    );
  }

  FutureOr<void> _cancelOperation(
    _CancelOperationMasterEvent event,
    Emitter<MasterState> emit,
  ) async {
    await _operationInteractor.delete(state.operation!);
    emit(
      state.copyWith(
        operation: null,
        action: MasterStateAction.SHOW_OPERATION_CANCELED_MESSAGE,
      ),
    );
  }

  FutureOr<void> _nextTap(
    _NextTapMasterEvent event,
    Emitter<MasterState> emit,
  ) async {
    if (state.accountId == null) {
      emit(
        state.copyWith(action: MasterStateAction.SHOW_EMPTY_ACCOUNT_MESSAGE),
      );

      return;
    }

    state.map(
      input: (s) {
        if (s.categoryId == null) {
          emit(
            state.copyWith(
              action: MasterStateAction.SHOW_EMPTY_CATEGORY_MESSAGE,
            ),
          );

          return;
        }
      },
      output: (s) {
        if (s.categoryId == null) {
          emit(
            state.copyWith(
              action: MasterStateAction.SHOW_EMPTY_CATEGORY_MESSAGE,
            ),
          );

          return;
        }
      },
      transfer: (s) {
        if (s.recAccountId == null) {
          emit(
            state.copyWith(
              action: MasterStateAction.SHOW_EMPTY_REC_ACCOUNT_MESSAGE,
            ),
          );

          return;
        }
      },
      exchange: (s) {
        if (s.recSum.isEmpty) {
          emit(
            state.copyWith(
              action: MasterStateAction.SHOW_EMPTY_REC_SUM_MESSAGE,
            ),
          );

          return;
        }
      },
    );

    if (state.sum.isEmpty) {
      emit(state.copyWith(action: MasterStateAction.SHOW_EMPTY_SUM_MESSAGE));

      return;
    }

    try {
      final result = await _saveOperation();
      result.fold(
        onSuccess: (operation) {
          emit(
            state.copyWith(
              operation: operation,
              sum: state.sum.copyWith(sum: 0),
              action: MasterStateAction.SHOW_OPERATION_CREATED_MESSAGE,
            ),
          );
        },
        onFailure: (_) {
          //TODO
        },
      );
    } catch (e, stacktrace) {
      AppLogger.error('Error while saving operation', e, stacktrace);
    }
  }

  Future<Result<Operation>> _saveOperation() => state.map(
    input: (s) => _operationInteractor.insertInput(
      date: DateTime.now(),
      accountId: s.accountId!,
      categoryId: s.categoryId!,
      sum: s.sum,
    ),
    output: (s) => _operationInteractor.insertOutput(
      date: DateTime.now(),
      accountId: s.accountId!,
      categoryId: s.categoryId!,
      sum: s.sum,
    ),
    transfer: (s) => _operationInteractor.insertTransfer(
      date: DateTime.now(),
      accountId: s.accountId!,
      recAccountId: s.recAccountId!,
      sum: s.sum,
    ),
    exchange: (s) => _operationInteractor.insertExchange(
      date: DateTime.now(),
      accountId: s.accountId!,
      sum: s.sum,
      recSum: s.recSum,
    ),
  );
}

extension MasterExt on BuildContext {
  MasterBloc _bloc() => read<MasterBloc>();

  void _add(MasterEvent event) => _bloc().add(event);

  void onNextTap() => _add(const MasterEvent.nextTap());

  void onCancelOperation() => _add(const MasterEvent.cancelOperation());

  void onChangeOperationType(OperationType type) =>
      _add(MasterEvent.changeOperationType(type));

  void onChangeAccount(int id) => _add(MasterEvent.changeAccount(id));

  void onChangeRecAccount(int id) => _add(MasterEvent.changeRecAccount(id));

  void onChangeCategory(int? id) => _add(MasterEvent.changeCategory(id));

  void onChangeSum(Money sum) => _add(MasterEvent.changeSum(sum));

  void onChangeRecSum(Money sum) => _add(MasterEvent.changeRecSum(sum));

  OperationType type() => select<MasterBloc, OperationType>(
    (bloc) => bloc.state.map(
      input: (_) => .INPUT,
      output: (_) => .OUTPUT,
      transfer: (_) => .TRANSFER,
      exchange: (_) => .EXCHANGE,
    ),
  );

  Money sum() => select<MasterBloc, Money>((bloc) => bloc.state.sum);

  Money recSum() => select<MasterBloc, Money>(
    (bloc) => bloc.state.maybeMap(
      exchange: (s) => s.recSum,
      orElse: () => Money(0, .RUB),
    ),
  );

  int? accountId() => select<MasterBloc, int?>((bloc) => bloc.state.accountId);

  int? recAccountId() => select<MasterBloc, int?>(
    (bloc) => bloc.state.maybeMap(
      transfer: (s) => s.recAccountId,
      orElse: () => null,
    ),
  );

  int? categoryId() => select<MasterBloc, int?>(
    (bloc) => bloc.state.maybeMap(
      input: (s) => s.accountId,
      output: (s) => s.accountId,
      orElse: () => null,
    ),
  );
}
