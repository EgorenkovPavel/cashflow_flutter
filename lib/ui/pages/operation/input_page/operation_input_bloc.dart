import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/mappers/account_balance_mapper.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models/account_balance.dart';
import 'package:money_tracker/domain/models/category.dart';
import 'package:money_tracker/domain/models/operation.dart';
import 'package:money_tracker/domain/models/operation_type.dart';

abstract class MasterState {}

class DataState extends MasterState {
  final OperationType type;
  final AccountBalance? account;
  final Category? categoryIn;
  final Category? categoryOut;
  final AccountBalance? recAccount;
  final int sum;
  final bool showKeyboard;
  final int? operationId;

  DataState(
      { required this.type,
         this.account,
         this.categoryIn,
         this.categoryOut,
         this.recAccount,
         required this.sum,
         required this.showKeyboard,
         this.operationId});

  DataState copyWith(
      {OperationType? type,
        AccountBalance? account,
        Category? categoryIn,
        Category? categoryOut,
        AccountBalance? recAccount,
        int? sum,
        bool? showKeyboard,
        int? operationId}) =>
      DataState(
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

class ClosePage extends MasterState {}

class ShowKeyboard extends MasterState {}

class HideKeyBoard extends MasterState {}

class EmptyAccountMessage extends MasterState {}

class EmptyCategoryMessage extends MasterState {}

class EmptyRecAccountMessage extends MasterState {}

class EmptySumMessage extends MasterState {}

class OperationCreatedMessage extends MasterState {}

class OperationCanceled extends MasterState {}

class MasterBloc extends Cubit<MasterState> {
  final Repository _repository;
  final Stream<List<AccountBalance>> accountStream;
  final Stream<List<Category>> categoryInStream;
  final Stream<List<Category>> categoryOutStream;

  static DataState _data =
  DataState(type: OperationType.INPUT, showKeyboard: false, sum: 0);

  MasterBloc(this._repository)
      : accountStream = _repository.watchAllAccountsBalance(),
        categoryInStream =
        _repository.watchAllCategoriesByType(OperationType.INPUT),
        categoryOutStream =
        _repository.watchAllCategoriesByType(OperationType.OUTPUT),
        super(_data);

  AccountBalance? get account => _data.account;

  Category? get categoryIn => _data.categoryIn;

  Category? get categoryOut => _data.categoryOut;

  AccountBalance? get recAccount => _data.recAccount;

  Future<void> start() async {
    var op = await _repository.getLastOperation();

    if (op == null) {
      return;
    }

    _data = _data.copyWith(
        account: AccountBalance(
            id: op.account.id,
            title: op.account.title,
            balance: 0),
        type: op.type);
    switch (op.type) {
      case OperationType.INPUT:
        _data = _data.copyWith(categoryIn: op.category);
        break;
      case OperationType.OUTPUT:
        _data = _data.copyWith(categoryOut: op.category);
        break;
      case OperationType.TRANSFER:
        _data = _data.copyWith(
            recAccount: AccountBalance(
                id: op.recAccount!.id,
                title: op.recAccount!.title,
                balance: 0));
        break;
    }

    emit(_data);
  }

  void backpressed(){
    if (_data.showKeyboard) {
      _data = _data.copyWith(showKeyboard: false);
      emit(HideKeyBoard());
      emit(_data);
    } else {
      emit(ClosePage());
    }
  }

  void onAddNewItem(){
    if (_data.showKeyboard) {
      _data = _data.copyWith(showKeyboard: false);
      emit(HideKeyBoard());
      emit(_data);
    }
  }

  void onSumTap(){
    if (!_data.showKeyboard) {
      _data = _data.copyWith(showKeyboard: true);
      emit(ShowKeyboard());
      emit(_data);
    }
  }

  void onTypeChanged(OperationType type){
    _data = _data.copyWith(type: type);
    emit(_data);
  }

  void onDigitTap(int digit){
    _data = _data.copyWith(sum: _data.sum * 10 + digit);
    emit(_data);
  }

  void onBackKeyTap(){
    _data = _data.copyWith(sum: (_data.sum / 10).floor());
    emit(_data);
  }

  void onMoreTap(){
    emit(ClosePage());
  }

  void onAccountChanged(AccountBalance account){
    _data = _data.copyWith(account: account);
  }

  void onCategoryInChanged(Category category){
    _data = _data.copyWith(categoryIn: category);
  }

  void onCategoryOutChanged(Category category){
    _data = _data.copyWith(categoryOut: category);
  }

  void onRecAccountChanged(AccountBalance account){
    _data = _data.copyWith(recAccount: account);
  }

  Future<void> cancelOperation() async {
    await _repository.deleteOperationById(_data.operationId!);
    _data = _data.copyWith(operationId: null);
    emit(OperationCanceled());
    emit(_data);
  }

  Future<void> onNextTap() async {
    if (_data.account == null) {
      emit(EmptyAccountMessage());
      return;
    }

    if (_data.type == OperationType.TRANSFER && _data.recAccount == null) {
      emit(EmptyRecAccountMessage());
      return;
    }

    if (_data.type == OperationType.INPUT && _data.categoryIn == null) {
      emit(EmptyCategoryMessage());
      return;
    }

    if (_data.type == OperationType.OUTPUT && _data.categoryOut == null) {
      emit(EmptyCategoryMessage());
      return;
    }

    if (_data.sum == 0) {
      emit(EmptySumMessage());
      return;
    }

    var opId = await _saveOperation();
    print(opId.toString());
    _data = _data.copyWith(operationId: opId);

    emit(OperationCreatedMessage());

    _data = _data.copyWith(sum: 0, showKeyboard: false);
    emit(HideKeyBoard());
    emit(_data);
  }

  Future<int> _saveOperation() {
    switch (_data.type) {
      case OperationType.INPUT:
        {
          var operation = Operation(
              date: DateTime.now(),
              type: _data.type,
              account: const AccountBalanceMapper().mapToAccount(_data.account!),
              category: _data.categoryIn,
              sum: _data.sum);

          return _repository.insertOperation(operation);
        }
      case OperationType.OUTPUT:
        {
          var operation = Operation(
              date: DateTime.now(),
              type: _data.type,
              account: const AccountBalanceMapper().mapToAccount(_data.account!),
              category: _data.categoryOut,
              sum: _data.sum);

          return _repository.insertOperation(operation);
        }
      case OperationType.TRANSFER:
        {
          var operation = Operation(
              date: DateTime.now(),
              type: _data.type,
              account: const AccountBalanceMapper().mapToAccount(_data.account!),
              recAccount:
              const AccountBalanceMapper().mapToAccount(_data.recAccount!),
              sum: _data.sum);

          return _repository.insertOperation(operation);
        }
      default:{
        throw 'Unknown value';
      }
    }
  }
}
