// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interactors/operation_interactor.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/utils/sum.dart';

part 'operation_input_bloc.freezed.dart';

@freezed
class MasterEvent with _$MasterEvent {
  const factory MasterEvent.backPressed() = _BackPressedMasterEvent;

  const factory MasterEvent.start() = _StartMasterEvent;

  const factory MasterEvent.addNewItem() = _AddNewItemMassterEvent;

  const factory MasterEvent.sumTap() = _SumTapMasterEvent;

  const factory MasterEvent.recSumTap() = _RecSumTapMasterEvent;

  const factory MasterEvent.changeOperationType(
    OperationType operationType,
  ) = _ChangeOperationTypeMasterEvent;

  const factory MasterEvent.digitTap(int digit) = _DigitTapMasterEvent;

  const factory MasterEvent.backKeyTap() = _BackKeyTapMasterEvent;

  const factory MasterEvent.moreTap() = _MoreTapMasterEvent;

  const factory MasterEvent.changeAccount(int id) = _ChangeAccountMasterEvent;

  const factory MasterEvent.changeInCategory(int? id) =
      _ChangeInCategoryMasterEvent;

  const factory MasterEvent.changeInCategoryGroup(int? id) =
      _ChangeInCategoryGroupMasterEvent;

  const factory MasterEvent.changeOutCategory(int? id) =
      _ChangeOutCategoryMasterEvent;

  const factory MasterEvent.changeOutCategoryGroup(int? id) =
      _ChangeOutCategoryGroupMasterEvent;

  const factory MasterEvent.changeRecAccount(int id) =
      _ChangeRecAccountMasterEvent;

  const factory MasterEvent.changeHighlightCurrency(Currency currency) =
      _ChangeHighlightCurrencyMasterEvent;

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
    required Sum sum,
    required Sum recSum,
    required bool showKeyboard,
    required bool highlightSum,
    required bool highlightRecSum,
    int? accountId,
    int? categoryInId,
    int? categoryOutId,
    int? recAccountId,
    int? categoryInParentId,
    int? categoryOutParentId,
    Operation? operation,
  }) = _MasterState;
}

class MasterBloc extends Bloc<MasterEvent, MasterState> {
  final OperationInteractor _operationInteractor;

  MasterBloc(this._operationInteractor)
      : super(MasterState(
          action: MasterStateAction.DATA,
          operationType: OperationType.INPUT,
          sum: Sum(0, Currency.RUB),
          recSum: Sum(0, Currency.RUB),
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
        changeInCategoryGroup: (event) =>
            _changeInCategoryGroup(event, emitter),
        changeOutCategory: (event) => _changeOutCategory(event, emitter),
        changeOutCategoryGroup: (event) =>
            _changeOutCategoryGroup(event, emitter),
        changeRecAccount: (event) => _changeRecAccount(event, emitter),
        changeHighlightCurrency: (event) =>
            _changeHighlightCurrency(event, emitter),
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
    var op = await _operationInteractor.getLast();

    if (op == null) {
      return;
    }

    emit(state.copyWith(
      accountId: op.account,
      action: MasterStateAction.SET_ACCOUNT,
    ));

    emit(state.copyWith(
      operationType: op.type,
      action: MasterStateAction.DATA,
    ));
    switch (op) {
      case InputOperation():
        {
          emit(state.copyWith(
            categoryInId: op.analytic,
            action: MasterStateAction.SET_IN_CATEGORY,
          ));
        }
      case OutputOperation():
        {
          emit(state.copyWith(
            categoryOutId: op.analytic,
            action: MasterStateAction.SET_OUT_CATEGORY,
          ));
        }
      case TransferOperation():
        {
          emit(state.copyWith(
            recAccountId: op.analytic,
            action: MasterStateAction.SET_REC_ACCOUNT,
          ));
        }
    }
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
        sum: state.sum / 10,
        action: MasterStateAction.DATA,
      ));
    } else if (state.highlightRecSum) {
      emit(state.copyWith(
        recSum: state.recSum / 10,
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
      accountId: event.id,
      action: MasterStateAction.DATA,
    ));
  }

  FutureOr<void> _changeInCategory(
    _ChangeInCategoryMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    emit(state.copyWith(
      categoryInId: event.id,
      action: MasterStateAction.DATA,
    ));
  }

  FutureOr<void> _changeInCategoryGroup(
    _ChangeInCategoryGroupMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    emit(state.copyWith(
      categoryInParentId: event.id,
      action: MasterStateAction.DATA,
    ));
  }

  FutureOr<void> _changeOutCategoryGroup(
    _ChangeOutCategoryGroupMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    emit(state.copyWith(
      categoryOutParentId: event.id,
      action: MasterStateAction.DATA,
    ));
  }

  FutureOr<void> _changeOutCategory(
    _ChangeOutCategoryMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    emit(state.copyWith(
      categoryOutId: event.id,
      action: MasterStateAction.DATA,
    ));
  }

  FutureOr<void> _changeRecAccount(
    _ChangeRecAccountMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    emit(state.copyWith(
      recAccountId: event.id,
      action: MasterStateAction.DATA,
    ));
  }

  FutureOr<void> _changeHighlightCurrency(
    _ChangeHighlightCurrencyMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    if (state.highlightSum) {
      emit(state.copyWith(
        sum: state.sum.copyWith(currency: event.currency),
        action: MasterStateAction.DATA,
      ));
    } else {
      emit(state.copyWith(
        recSum: state.recSum.copyWith(currency: event.currency),
        action: MasterStateAction.DATA,
      ));
    }
  }

  FutureOr<void> _cancelOperation(
    _CancelOperationMasterEvent event,
    Emitter<MasterState> emit,
  ) async {
    await _operationInteractor.delete(state.operation!);
    emit(state.copyWith(
      operation: null,
      action: MasterStateAction.SHOW_OPERATION_CANCELED_MESSAGE,
    ));
  }

  FutureOr<void> _nextTap(
    _NextTapMasterEvent event,
    Emitter<MasterState> emit,
  ) async {
    if (state.accountId == null) {
      emit(
        state.copyWith(
          action: MasterStateAction.SHOW_EMPTY_ACCOUNT_MESSAGE,
        ),
      );

      return;
    }

    if (state.operationType == OperationType.TRANSFER &&
        state.recAccountId == null) {
      emit(state.copyWith(
        action: MasterStateAction.SHOW_EMPTY_REC_ACCOUNT_MESSAGE,
      ));

      return;
    }

    if (state.operationType == OperationType.INPUT &&
        state.categoryInId == null) {
      emit(state.copyWith(
        action: MasterStateAction.SHOW_EMPTY_CATEGORY_MESSAGE,
      ));

      return;
    }

    if (state.operationType == OperationType.OUTPUT &&
        state.categoryOutId == null) {
      emit(state.copyWith(
        action: MasterStateAction.SHOW_EMPTY_CATEGORY_MESSAGE,
      ));

      return;
    }

    if (state.sum.sum == 0) {
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
      sum: state.sum.copyWith(sum: 0),
      recSum: state.recSum.copyWith(sum: 0),
      showKeyboard: false,
    ));
  }

  Future<Operation> _saveOperation() {
    switch (state.operationType) {
      case OperationType.INPUT:
        {
          return _operationInteractor.insertInput(
            date: DateTime.now(),
            accountId: state.accountId!,
            categoryId: state.categoryInId!,
            sum: state.sum,
          );
        }
      case OperationType.OUTPUT:
        {
          return _operationInteractor.insertOutput(
            date: DateTime.now(),
            accountId: state.accountId!,
            categoryId: state.categoryOutId!,
            sum: state.sum,
          );
        }
      case OperationType.TRANSFER:
        {
          return _operationInteractor.insertTransfer(
            date: DateTime.now(),
            accountId: state.accountId!,
            recAccountId: state.recAccountId!,
            sum: state.sum,
            recSum: state.recSum,
          );
        }
    }
  }
}

extension MasterExt on BuildContext {
  MasterBloc _bloc() => read<MasterBloc>();

  void _add(MasterEvent event) => _bloc().add(event);

  void onNextTap() => _add(const MasterEvent.nextTap());

  void onMoreTap() => _add(const MasterEvent.moreTap());

  void onBackKeyTap() => _add(const MasterEvent.backKeyTap());

  void onDigitKeyTap(int digit) => _add(MasterEvent.digitTap(digit));

  void onSumTap() => _add(const MasterEvent.sumTap());

  void onRecSumTap() => _add(const MasterEvent.recSumTap());

  void onCancelOperation() => _add(const MasterEvent.cancelOperation());

  void onChangeOperationType(OperationType type) =>
      _add(MasterEvent.changeOperationType(type));

  void onChangeAccount(int id) => _add(MasterEvent.changeAccount(id));

  void onChangeRecAccount(int id) => _add(MasterEvent.changeRecAccount(id));

  void onAddNewItem() => _add(const MasterEvent.addNewItem());

  void onChangeCategory(int? id, CategoryType type) => switch (type) {
        CategoryType.INPUT => _add(MasterEvent.changeInCategory(id)),
        CategoryType.OUTPUT => _add(MasterEvent.changeOutCategory(id)),
      };

  void onChangeCategoryGroup(int? id, CategoryType type) => switch (type) {
        CategoryType.INPUT => _add(MasterEvent.changeInCategoryGroup(id)),
        CategoryType.OUTPUT => _add(MasterEvent.changeOutCategoryGroup(id)),
      };

  void onChangeHighlightCurrency(Currency currency) =>
      _add(MasterEvent.changeHighlightCurrency(currency));

  bool showRecSum() => select<MasterBloc, bool>(
      (bloc) => bloc.state.operationType == OperationType.TRANSFER);

  Future<void> addNewAccount() async {
    onAddNewItem();

    final account = await _inputBaseAccount();
    if (account != null) {
      onChangeAccount(account.id);
    }
  }

  Future<void> addNewCategoryItem(CategoryType type) async {
    onAddNewItem();
    final category = await openCategoryInputDialog(
      type: type,
      isGroup: false,
    );
    if (category != null) {
      onChangeCategory(category.id, type);
    }
  }

  Future<void> addNewCategoryGroup(CategoryType type) async {
    onAddNewItem();
    final category = await openCategoryInputDialog(
      type: type,
      isGroup: true,
    );
    if (category != null) {
      onChangeCategoryGroup(category.id, type);
    }
  }

  Future<void> addNewRecAccount() async {
    onAddNewItem();
    final account = await _inputBaseAccount();
    if (account != null) {
      onChangeRecAccount(account.id);
    }
  }

  Future<BaseAccount?> _inputBaseAccount() async {
    return await showDialog<BaseAccount>(
        context: this,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select assignment'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                  openAccountInputDialog();
                },
                child: const Text('Account'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                  openDebtInputDialog();
                },
                child: const Text('Debt'),
              ),
            ],
          );
        });
  }

  Sum sum() => select<MasterBloc, Sum>((bloc) => bloc.state.sum);

  Sum recSum() => select<MasterBloc, Sum>((bloc) => bloc.state.recSum);

  Currency currencySent() =>
      select<MasterBloc, Currency>((bloc) => bloc.state.sum.currency);

  Currency currencyReceived() =>
      select<MasterBloc, Currency>((bloc) => bloc.state.recSum.currency);

  bool highlightSum() =>
      select<MasterBloc, bool>((bloc) => bloc.state.highlightSum);

  bool highlightRecSum() =>
      select<MasterBloc, bool>((bloc) => bloc.state.highlightRecSum);

  Currency highlightCurrency() =>
      select<MasterBloc, Currency>((bloc) => bloc.state.highlightSum
          ? bloc.state.sum.currency
          : bloc.state.recSum.currency);

  OperationType operationType() =>
      select<MasterBloc, OperationType>((bloc) => bloc.state.operationType);

  int? accountId() => select<MasterBloc, int?>((bloc) => bloc.state.accountId);

  int? recAccountId() => _bloc().state.recAccountId;

  int? categoryId(CategoryType type) => switch (type) {
        CategoryType.INPUT => _bloc().state.categoryInId,
        CategoryType.OUTPUT => _bloc().state.categoryOutId,
      };

  int? readCategoryGroupId(CategoryType type) => switch (type) {
        CategoryType.INPUT => _bloc().state.categoryInParentId,
        CategoryType.OUTPUT => _bloc().state.categoryOutParentId,
      };

  int? watchCategoryGroupId(CategoryType type) =>
      select<MasterBloc, int?>((bloc) => switch (type) {
            CategoryType.INPUT => bloc.state.categoryInParentId,
            CategoryType.OUTPUT => bloc.state.categoryOutParentId,
          });
}
