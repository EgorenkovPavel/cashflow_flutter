import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';

class AccountEditPageState{
  final String accountTitle;

  AccountEditPageState(this.accountTitle);
}

class AccountEditPageBloc extends Cubit<AccountEditPageState>{

  final Repository _repository;
  StreamSubscription? _sub;

  AccountEditPageBloc(this._repository) : super(AccountEditPageState(''));

  Future<void> fetch(int id) async {
    _sub = _repository.watchAccountById(id).listen((event) {
      emit(AccountEditPageState(event.title));
    });
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}