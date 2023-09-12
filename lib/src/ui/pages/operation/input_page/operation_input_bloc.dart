// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/src/domain/models.dart';

part 'operation_input_bloc.freezed.dart';

@freezed
class MasterEvent with _$MasterEvent {
  const factory MasterEvent.changeAccounts({
    required List<AccountBalance> accounts,
  }) = _ChangeAccountsMasterEvent;

  const factory MasterEvent.changeInCategories({
    required List<Category> categories,
  }) = _ChangeInCategoriesMasterEvent;

  const factory MasterEvent.changeOutCategories({
    required List<Category> categories,
  }) = _ChangeOutCategoriesMasterEvent;

  const factory MasterEvent.backPressed() = _BackPressedMasterEvent;

  const factory MasterEvent.start() = _StartMasterEvent;

  const factory MasterEvent.addNewItem() = _AddNewItemMassterEvent;

  const factory MasterEvent.sumTap() = _SumTapMasterEvent;

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
    required bool showKeyboard,
    AccountBalance? account,
    Category? categoryIn,
    Category? categoryOut,
    AccountBalance? recAccount,
    Operation? operation,
    required List<AccountBalance> accounts,
    required List<Category> inCategories,
    required List<Category> outCategories,
  }) = _MasterState;
}

class MasterBloc extends Bloc<MasterEvent, MasterState> {
  final DataRepository _repository;
  StreamSubscription? accountsSub;
  StreamSubscription? categoriesInSub;
  StreamSubscription? categoriesOutSub;

  MasterBloc(this._repository)
      : super(const MasterState(
          accounts: [],
          inCategories: [],
          outCategories: [],
          action: MasterStateAction.DATA,
          operationType: OperationType.INPUT,
          sum: 0,
          showKeyboard: false,
        )) {
    on<MasterEvent>(
      (event, emitter) => event.map(
        changeAccounts: (event) => _changeAccounts(event, emitter),
        changeInCategories: (event) => _changeInCategories(event, emitter),
        changeOutCategories: (event) => _changeOutCategories(event, emitter),
        backPressed: (event) => _backPressed(event, emitter),
        start: (event) => _start(event, emitter),
        addNewItem: (event) => _addNewItem(event, emitter),
        sumTap: (event) => _sumTap(event, emitter),
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

    accountsSub = _repository.accounts.watchAllBalance().listen(
          (accounts) => add(MasterEvent.changeAccounts(accounts: accounts)),
        );

    categoriesInSub =
        _repository.categories.watchAllByType(OperationType.INPUT).listen(
              (categories) =>
                  add(MasterEvent.changeInCategories(categories: categories)),
            );

    categoriesOutSub =
        _repository.categories.watchAllByType(OperationType.OUTPUT).listen(
              (categories) =>
                  add(MasterEvent.changeOutCategories(categories: categories)),
            );

    add(const MasterEvent.start());
  }

  _changeAccounts(
    _ChangeAccountsMasterEvent event,
    Emitter<MasterState> emit,
  ) =>
      emit(state.copyWith(
        accounts: event.accounts,
        action: MasterStateAction.DATA,
      ));

  _changeInCategories(
    _ChangeInCategoriesMasterEvent event,
    Emitter<MasterState> emit,
  ) =>
      emit(state.copyWith(
        inCategories: event.categories,
        action: MasterStateAction.DATA,
      ));

  _changeOutCategories(
    _ChangeOutCategoriesMasterEvent event,
    Emitter<MasterState> emit,
  ) =>
      emit(state.copyWith(
        outCategories: event.categories,
        action: MasterStateAction.DATA,
      ));

  @override
  Future<void> close() {
    accountsSub?.cancel();
    categoriesInSub?.cancel();
    categoriesOutSub?.cancel();

    return super.close();
  }

  FutureOr<void> _start(
    _StartMasterEvent event,
    Emitter<MasterState> emit,
  ) async {
    var op = await _repository.operations.getLast();

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
      ));
    }
  }

  FutureOr<void> _sumTap(_SumTapMasterEvent event, Emitter<MasterState> emit) {
    if (!state.showKeyboard) {
      emit(state.copyWith(
        action: MasterStateAction.SHOW_KEYBOARD,
        showKeyboard: true,
      ));
    }
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
    emit(state.copyWith(
      sum: state.sum * 10 + event.digit,
      action: MasterStateAction.DATA,
    ));
  }

  FutureOr _backKeyTap(
    _BackKeyTapMasterEvent event,
    Emitter<MasterState> emit,
  ) {
    emit(state.copyWith(
      sum: (state.sum / 10).floor(),
      action: MasterStateAction.DATA,
    ));
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
    await _repository.operations.delete(state.operation!);
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
      showKeyboard: false,
    ));
  }

  Future<Operation> _saveOperation() {
    switch (state.operationType) {
      case OperationType.INPUT:
        {
          var operation = Operation.input(
            date: DateTime.now(),
            account: toAccount(state.account!),
            category: state.categoryIn!,
            sum: state.sum,
          );

          return _repository.operations.insert(operation);
        }
      case OperationType.OUTPUT:
        {
          var operation = Operation.output(
            date: DateTime.now(),
            account: toAccount(state.account!),
            category: state.categoryOut!,
            sum: state.sum,
          );

          return _repository.operations.insert(operation);
        }
      case OperationType.TRANSFER:
        {
          var operation = Operation.transfer(
            date: DateTime.now(),
            account: toAccount(state.account!),
            recAccount: toAccount(state.recAccount!),
            sum: state.sum,
          );

          return _repository.operations.insert(operation);
        }
      default:
        {
          throw 'Unknown value';
        }
    }
  }

  Account toAccount(AccountBalance accountBalance) => Account(
    id: accountBalance.id,
    cloudId: accountBalance.cloudId,
    title: accountBalance.title,
    isDebt: accountBalance.isDebt,
    currency: accountBalance.currency,
  );
}
