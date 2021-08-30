import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';

abstract class AccountInputPageState {}

class AccountState extends AccountInputPageState {
  final String title;

  AccountState(this.title);
}

class CloseState extends AccountInputPageState {
  final Account account;

  CloseState(this.account);
}

class AccountInputPageBloc extends Cubit<AccountInputPageState> {
  final Repository _repository;

  int? _id;

  AccountInputPageBloc(this._repository) : super(AccountState(''));

  Future<void> fetch(int id) async {
    _id = id;
    Account account = await _repository.getAccountById(id);
    emit(AccountState(account.title));
  }

  Future<void> save(String title) async {
    if (_id == null) {
      var account = Account(title: title);
      _id = await _repository.insertAccount(account);
      emit(CloseState(account.copyWith(id: _id)));
    }else{
      var account = Account(id: _id!, title: title);
      await _repository.updateAccount(account);
      emit(CloseState(account));
    }

  }
}
