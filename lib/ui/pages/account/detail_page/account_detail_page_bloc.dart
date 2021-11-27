import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/local/local_source.dart';

class AccountEditPageState{
  final String accountTitle;

  AccountEditPageState(this.accountTitle);
}

class AccountDetailPageBloc extends Cubit<AccountEditPageState>{

  final LocalSource _repository;
  StreamSubscription? _sub;

  AccountDetailPageBloc(this._repository) : super(AccountEditPageState(''));

  Future<void> fetch(int id) async {
    _sub = _repository.accounts.watchById(id).listen((event) {
      emit(AccountEditPageState(event.title));
    });
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}