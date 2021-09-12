import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';

class AccountInputPageState {
  final BlocAction action;
  final String title;
  final bool isDebt;
  final Account? account;

  AccountInputPageState(
      {required this.action,
      required this.title,
      required this.isDebt,
      this.account});

  AccountInputPageState copyWith(
      {BlocAction? action, String? title, bool? isDebt, Account? account}) {
    return AccountInputPageState(
      action: action ?? this.action,
      title: title ?? this.title,
      isDebt: isDebt ?? this.isDebt,
      account: account ?? this.account,
    );
  }
}

enum BlocAction { DATA, CLOSE }

class AccountInputPageBloc extends Cubit<AccountInputPageState> {
  final Repository _repository;

  int? _id;

  AccountInputPageBloc(this._repository)
      : super(AccountInputPageState(
            action: BlocAction.DATA, title: '', isDebt: false));

  Future<void> fetch(int id) async {
    _id = id;
    var account = await _repository.getAccountById(id);
    emit(AccountInputPageState(
        action: BlocAction.DATA, title: account.title, isDebt: account.isDebt));
  }

  void changeIsDebt(bool val) {
    emit(state.copyWith(isDebt: val));
  }

  Future<void> save(String title) async {
    if (_id == null) {
      var account = Account(title: title, isDebt: state.isDebt);
      var _id = await _repository.insertAccount(account);
      emit(state.copyWith(action: BlocAction.CLOSE, account: account.copyWith(id: _id)));
    } else {
      var account = Account(id: _id!, title: title, isDebt: state.isDebt);
      await _repository.updateAccount(account);
      emit(state.copyWith(action: BlocAction.CLOSE, account: account));
    }
  }
}
