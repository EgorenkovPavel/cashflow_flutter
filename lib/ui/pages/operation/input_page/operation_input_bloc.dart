import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/mappers/account_balance_mapper.dart';
import 'package:money_tracker/data/repository.dart';
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
  SHOW_OPEARTION_CANCELED_MESSAGE
}

class MasterState {
  final MasterStateAction action;
  final OperationType type;
  final AccountBalance? account;
  final Category? categoryIn;
  final Category? categoryOut;
  final AccountBalance? recAccount;
  final int sum;
  final bool showKeyboard;
  final int? operationId;

  MasterState(
      {this.action = MasterStateAction.DATA,
        required this.type,
      this.account,
      this.categoryIn,
      this.categoryOut,
      this.recAccount,
      required this.sum,
      required this.showKeyboard,
      this.operationId});

  MasterState copyWith(
          {MasterStateAction action = MasterStateAction.DATA,
            OperationType? type,
          AccountBalance? account,
          Category? categoryIn,
          Category? categoryOut,
          AccountBalance? recAccount,
          int? sum,
          bool? showKeyboard,
          int? operationId}) =>
      MasterState(
        action: action,
        type: type ?? this.type,
        account: account ?? this.account,
        categoryIn: categoryIn ?? this.categoryIn,
        categoryOut: categoryOut ?? this.categoryOut,
        recAccount: recAccount ?? this.recAccount,
        sum: sum ?? this.sum,
        showKeyboard: showKeyboard ?? this.showKeyboard,
        operationId: operationId ?? this.operationId,
      );
}

class MasterBloc extends Cubit<MasterState> {
  final Repository _repository;
  final Stream<List<AccountBalance>> accountStream;
  final Stream<List<Category>> categoryInStream;
  final Stream<List<Category>> categoryOutStream;

  MasterBloc(this._repository)
      : accountStream = _repository.watchAllAccountsBalance(),
        categoryInStream =
            _repository.watchAllCategoriesByType(OperationType.INPUT),
        categoryOutStream =
            _repository.watchAllCategoriesByType(OperationType.OUTPUT),
        super(MasterState(action: MasterStateAction.DATA, type: OperationType.INPUT, sum: 0, showKeyboard: false));

  AccountBalance? get account => state.account;

  Category? get categoryIn => state.categoryIn;

  Category? get categoryOut => state.categoryOut;

  AccountBalance? get recAccount => state.recAccount;

  Future<void> start() async {
    var op = await _repository.getLastOperation();

    if (op == null) {
      return;
    }

    emit(state.copyWith(
      action: MasterStateAction.DATA,
        account: AccountBalance(
            id: op.account.id, title: op.account.title, balance: 0),
        type: op.type));
    switch (op.type) {
      case OperationType.INPUT:
        emit(state.copyWith(
            action: MasterStateAction.DATA,
            categoryIn: op.category));
        break;
      case OperationType.OUTPUT:
        emit(state.copyWith(
            action: MasterStateAction.DATA,
            categoryOut: op.category));
        break;
      case OperationType.TRANSFER:
        emit(state.copyWith(
            action: MasterStateAction.DATA,
            recAccount: AccountBalance(
                id: op.recAccount!.id,
                title: op.recAccount!.title,
                balance: 0)));
        break;
    }
  }

  void backpressed() {
    if (state.showKeyboard) {
      emit(state.copyWith(action: MasterStateAction.HIDE_KEYBOARD, showKeyboard: false));
    } else {
      emit(state.copyWith(action: MasterStateAction.CLOSE));
    }
  }

  void onAddNewItem() {
    if (state.showKeyboard) {
      emit(state.copyWith(action: MasterStateAction.HIDE_KEYBOARD, showKeyboard: false));
    }
  }

  void onSumTap() {
    if (!state.showKeyboard) {
      emit(state.copyWith(action: MasterStateAction.SHOW_KEYBOARD, showKeyboard: true));
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
    emit(state.copyWith(account: account));
  }

  void onCategoryInChanged(Category category) {
    emit(state.copyWith(categoryIn: category));
  }

  void onCategoryOutChanged(Category category) {
    emit(state.copyWith(categoryOut: category));
  }

  void onRecAccountChanged(AccountBalance account) {
    emit(state.copyWith(recAccount: account));
  }

  Future<void> cancelOperation() async {
    await _repository.deleteOperationById(state.operationId!);
    emit(state.copyWith(action: MasterStateAction.SHOW_OPEARTION_CANCELED_MESSAGE, operationId: null));
  }

  Future<void> onNextTap() async {
    if (state.account == null) {
      emit(state.copyWith(action: MasterStateAction.SHOW_EMPTY_ACCOUNT_MESSAGE));
      return;
    }

    if (state.type == OperationType.TRANSFER && state.recAccount == null) {
      emit(state.copyWith(action: MasterStateAction.SHOW_EMPTY_REC_ACCOUNT_MESSAGE));
      return;
    }

    if (state.type == OperationType.INPUT && state.categoryIn == null) {
      emit(state.copyWith(action: MasterStateAction.SHOW_EMPTY_CATEGORY_MESSAGE));
      return;
    }

    if (state.type == OperationType.OUTPUT && state.categoryOut == null) {
      emit(state.copyWith(action: MasterStateAction.SHOW_EMPTY_CATEGORY_MESSAGE));
      return;
    }

    if (state.sum == 0) {
      emit(state.copyWith(action: MasterStateAction.SHOW_EMPTY_SUM_MESSAGE));
      return;
    }

    var opId = await _saveOperation();
    emit(state.copyWith(action: MasterStateAction.SHOW_OPERATION_CREATED_MESSAGE, operationId: opId));

    emit(state.copyWith(action: MasterStateAction.HIDE_KEYBOARD, sum: 0, showKeyboard: false));

  }

  Future<int> _saveOperation() {
    switch (state.type) {
      case OperationType.INPUT:
        {
          var operation = Operation(
              date: DateTime.now(),
              type: state.type,
              account:
                  const AccountBalanceMapper().mapToAccount(state.account!),
              category: state.categoryIn,
              sum: state.sum);

          return _repository.insertOperation(operation);
        }
      case OperationType.OUTPUT:
        {
          var operation = Operation(
              date: DateTime.now(),
              type: state.type,
              account:
                  const AccountBalanceMapper().mapToAccount(state.account!),
              category: state.categoryOut,
              sum: state.sum);

          return _repository.insertOperation(operation);
        }
      case OperationType.TRANSFER:
        {
          var operation = Operation(
              date: DateTime.now(),
              type: state.type,
              account:
                  const AccountBalanceMapper().mapToAccount(state.account!),
              recAccount:
                  const AccountBalanceMapper().mapToAccount(state.recAccount!),
              sum: state.sum);

          return _repository.insertOperation(operation);
        }
      default:
        {
          throw 'Unknown value';
        }
    }
  }
}
