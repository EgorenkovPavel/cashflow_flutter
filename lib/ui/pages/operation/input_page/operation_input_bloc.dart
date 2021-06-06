

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/mappers/account_balance_mapper.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models/account_balance.dart';
import 'package:money_tracker/domain/models/category.dart';
import 'package:money_tracker/domain/models/operation.dart';
import 'package:money_tracker/domain/models/operation_type.dart';

abstract class MasterEvent {}

class Start extends MasterEvent {}

class BackPressed extends MasterEvent {}

class TypeChanged extends MasterEvent {
  final OperationType type;

  TypeChanged(this.type);
}

class OnSumTap extends MasterEvent {}

class OnDigitTap extends MasterEvent {
  final int digit;

  OnDigitTap(this.digit);
}

class OnBackKeyTap extends MasterEvent {}

class OnAddNewItem extends MasterEvent {}

class OnMoreTap extends MasterEvent {}

class OnNextTap extends MasterEvent {}

class OnAccountChanged extends MasterEvent {
  final AccountBalance account;

  OnAccountChanged(this.account);
}

class OnCategoryInChanged extends MasterEvent {
  final Category category;

  OnCategoryInChanged(this.category);
}

class OnCategoryOutChanged extends MasterEvent {
  final Category category;

  OnCategoryOutChanged(this.category);
}

class OnRecAccountChanged extends MasterEvent {
  final AccountBalance account;

  OnRecAccountChanged(this.account);
}

class CancelOperation extends MasterEvent {}


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

class MasterBloc extends Bloc<MasterEvent, MasterState> {
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

  @override
  Stream<MasterState> mapEventToState(MasterEvent event) async* {
    if (event is Start) {
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
    } else if (event is BackPressed) {
      if (_data.showKeyboard) {
        _data = _data.copyWith(showKeyboard: false);
        yield HideKeyBoard();
      } else {
        yield ClosePage();
        return;
      }
    } else if (event is OnAddNewItem) {
      if (_data.showKeyboard) {
        _data = _data.copyWith(showKeyboard: false);
        yield HideKeyBoard();
      } else {
        return;
      }
    } else if (event is OnSumTap) {
      if (!_data.showKeyboard) {
        _data = _data.copyWith(showKeyboard: true);
        yield ShowKeyboard();
      }
    } else if (event is TypeChanged) {
      _data = _data.copyWith(type: event.type);
    } else if (event is OnDigitTap) {
      _data = _data.copyWith(sum: _data.sum * 10 + event.digit);
    } else if (event is OnBackKeyTap) {
      _data = _data.copyWith(sum: (_data.sum / 10).floor());
    } else if (event is OnMoreTap) {
      yield ClosePage();
      return;
    } else if (event is OnAccountChanged) {
      _data = _data.copyWith(account: event.account);
      return;
    } else if (event is OnCategoryInChanged) {
      _data = _data.copyWith(categoryIn: event.category);
      return;
    } else if (event is OnCategoryOutChanged) {
      _data = _data.copyWith(categoryOut: event.category);
      return;
    } else if (event is OnRecAccountChanged) {
      _data = _data.copyWith(recAccount: event.account);
      return;
    } else if (event is CancelOperation) {
      await _repository.deleteOperationById(_data.operationId!);
      _data = _data.copyWith(operationId: null);
      yield OperationCanceled();
    } else if (event is OnNextTap) {
      if (_data.account == null) {
        yield EmptyAccountMessage();
        return;
      }

      if (_data.type == OperationType.TRANSFER && _data.recAccount == null) {
        yield EmptyRecAccountMessage();
        return;
      }

      if (_data.type == OperationType.INPUT && _data.categoryIn == null) {
        yield EmptyCategoryMessage();
        return;
      }

      if (_data.type == OperationType.OUTPUT && _data.categoryOut == null) {
        yield EmptyCategoryMessage();
        return;
      }

      if (_data.sum == 0) {
        yield EmptySumMessage();
        return;
      }

      var opId = await _saveOperation();
      print(opId.toString());
      _data = _data.copyWith(operationId: opId);

      yield OperationCreatedMessage();

      _data = _data.copyWith(sum: 0, showKeyboard: false);
      yield HideKeyBoard();
    }
    yield _data;
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
