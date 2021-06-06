import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';

class AccountEditPageState{
  final bool editTitleMode;
  final String accountTitle;

  AccountEditPageState(this.editTitleMode, this.accountTitle);
}

class AccountEditPageBloc extends Cubit<AccountEditPageState>{

  final Repository _repository;

  bool _editTitleMode = false;
  late Account _account;

  AccountEditPageBloc(this._repository) : super(AccountEditPageState(false, ''));

  Future<void> fetch(int id) async {
    _account = await _repository.getAccountById(id);
    emit(AccountEditPageState(_editTitleMode, _account.title));
  }

  void editTitle(){
    _editTitleMode = true;
    emit(AccountEditPageState(_editTitleMode, _account.title));
  }

  Future<void> saveTitle(String title) async {
    _editTitleMode = false;
    _account = _account.copyWith(title: title);

    await _repository.updateAccount(_account);
    emit(AccountEditPageState(_editTitleMode, _account.title));
  }

}