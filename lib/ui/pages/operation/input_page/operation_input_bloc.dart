// ignore_for_file: constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

enum MasterStateAction {
  DATA,
  CLOSE,
  SHOW_KEYBOARD,
  HIDE_KEYBOARD,
  SHOW_EMPTY_ACCOUNT_MESSAGE,
  SHOW_EMPTY_CATEGORY_MESSAGE,
  SHOW_EMPTY_REC_ACCOUNT_MESSAGE,
  SHOW_EMPTY_SUM_MESSAGE,
  SHOW_OPERATION_CREATED_MESSAGE,
  SHOW_OPERATION_CANCELED_MESSAGE,
}

class MasterState {
  final MasterStateAction action;
  final OperationType type;
  final int sum;
  final bool showKeyboard;

  MasterState({
    this.action = MasterStateAction.DATA,
    required this.type,
    required this.sum,
    required this.showKeyboard,
  });

  MasterState copyWith({
    MasterStateAction action = MasterStateAction.DATA,
    OperationType? type,
    int? sum,
    bool? showKeyboard,
  }) =>
      MasterState(
        action: action,
        type: type ?? this.type,
        sum: sum ?? this.sum,
        showKeyboard: showKeyboard ?? this.showKeyboard,
      );
}

class MasterBloc extends Cubit<MasterState> {
  final DataRepository _repository;
  final Stream<List<AccountBalance>> accountStream;
  final Stream<List<Category>> categoryInStream;
  final Stream<List<Category>> categoryOutStream;

  AccountBalance? _account;
  Category? _categoryIn;
  Category? _categoryOut;
  AccountBalance? _recAccount;
  Operation? _operation;

  MasterBloc(this._repository)
      : accountStream = _repository.accounts.watchAllBalance(),
        categoryInStream =
            _repository.categories.watchAllByType(OperationType.INPUT),
        categoryOutStream =
            _repository.categories.watchAllByType(OperationType.OUTPUT),
        super(MasterState(
          action: MasterStateAction.DATA,
          type: OperationType.INPUT,
          sum: 0,
          showKeyboard: false,
        ));

  AccountBalance? get account => _account;

  Category? get categoryIn => _categoryIn;

  Category? get categoryOut => _categoryOut;

  AccountBalance? get recAccount => _recAccount;

  Future<void> start() async {
    var op = await _repository.operations.getLast();

    if (op == null) {
      return;
    }

    _account = AccountBalance(
      id: op.account.id,
      cloudId: op.cloudId,
      title: op.account.title,
      balance: 0,
    );

    emit(state.copyWith(type: op.type));
    switch (op.type) {
      case OperationType.INPUT:
        _categoryIn = op.category;
        break;
      case OperationType.OUTPUT:
        _categoryOut = op.category;
        break;
      case OperationType.TRANSFER:
        _recAccount = AccountBalance(
          id: op.recAccount!.id,
          cloudId: op.recAccount!.cloudId,
          title: op.recAccount!.title,
          balance: 0,
        );
        break;
    }
  }

  void backpressed() {
    if (state.showKeyboard) {
      emit(state.copyWith(
        action: MasterStateAction.HIDE_KEYBOARD,
        showKeyboard: false,
      ));
    } else {
      emit(state.copyWith(action: MasterStateAction.CLOSE));
    }
  }

  void onAddNewItem() {
    if (state.showKeyboard) {
      emit(state.copyWith(
        action: MasterStateAction.HIDE_KEYBOARD,
        showKeyboard: false,
      ));
    }
  }

  void onSumTap() {
    if (!state.showKeyboard) {
      emit(state.copyWith(
        action: MasterStateAction.SHOW_KEYBOARD,
        showKeyboard: true,
      ));
    }
  }

  void onTypeChanged(OperationType type) {
    emit(state.copyWith(type: type));
  }

  void onDigitTap(int digit) {
    emit(state.copyWith(sum: state.sum * 10 + digit));
  }

  void onBackKeyTap() {
    emit(state.copyWith(sum: (state.sum / 10).floor()));
  }

  void onMoreTap() {
    emit(state.copyWith(action: MasterStateAction.CLOSE));
  }

  void onAccountChanged(AccountBalance account) {
    _account = account;
  }

  void onCategoryInChanged(Category category) {
    _categoryIn = category;
  }

  void onCategoryOutChanged(Category category) {
    _categoryOut = category;
  }

  void onRecAccountChanged(AccountBalance account) {
    _recAccount = account;
  }

  Future<void> cancelOperation() async {
    await _repository.operations.delete(_operation!);
    _operation = null;
    emit(state.copyWith(
      action: MasterStateAction.SHOW_OPERATION_CANCELED_MESSAGE,
    ));
  }

  Future<void> onNextTap() async {
    if (_account == null) {
      emit(
        state.copyWith(action: MasterStateAction.SHOW_EMPTY_ACCOUNT_MESSAGE),
      );

      return;
    }

    if (state.type == OperationType.TRANSFER && _recAccount == null) {
      emit(state.copyWith(
        action: MasterStateAction.SHOW_EMPTY_REC_ACCOUNT_MESSAGE,
      ));

      return;
    }

    if (state.type == OperationType.INPUT && _categoryIn == null) {
      emit(state.copyWith(
        action: MasterStateAction.SHOW_EMPTY_CATEGORY_MESSAGE,
      ));

      return;
    }

    if (state.type == OperationType.OUTPUT && _categoryOut == null) {
      emit(state.copyWith(
        action: MasterStateAction.SHOW_EMPTY_CATEGORY_MESSAGE,
      ));

      return;
    }

    if (state.sum == 0) {
      emit(state.copyWith(action: MasterStateAction.SHOW_EMPTY_SUM_MESSAGE));

      return;
    }

    _operation = await _saveOperation();
    emit(state.copyWith(
      action: MasterStateAction.SHOW_OPERATION_CREATED_MESSAGE,
    ));

    emit(state.copyWith(
      action: MasterStateAction.HIDE_KEYBOARD,
      sum: 0,
      showKeyboard: false,
    ));
  }

  Future<Operation> _saveOperation() {
    switch (state.type) {
      case OperationType.INPUT:
        {
          var operation = Operation(
            date: DateTime.now(),
            type: state.type,
            account: _account!.toAccount(),
            category: _categoryIn,
            sum: state.sum,
          );

          return _repository.operations.insert(operation);
        }
      case OperationType.OUTPUT:
        {
          var operation = Operation(
            date: DateTime.now(),
            type: state.type,
            account: _account!.toAccount(),
            category: _categoryOut,
            sum: state.sum,
          );

          return _repository.operations.insert(operation);
        }
      case OperationType.TRANSFER:
        {
          var operation = Operation(
            date: DateTime.now(),
            type: state.type,
            account: _account!.toAccount(),
            recAccount: _recAccount!.toAccount(),
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
}
