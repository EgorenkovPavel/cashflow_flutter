
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';

abstract class AccountInputPageState{}

class EmptyState extends AccountInputPageState{}

class CloseState extends AccountInputPageState{
  final Account account;

  CloseState(this.account);
}

class AccountInputPageBloc extends Cubit<AccountInputPageState>{

  final Repository _repository;

  AccountInputPageBloc(this._repository) : super(EmptyState());

  Future<void> save(String title) async {
    var account = Account(title: title);
    var id = await _repository.insertAccount(account);
    emit(CloseState(account.copyWith(id: id)));
  }
}
