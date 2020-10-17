
import 'dart:async';

import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TotalBalanceEvent {}

class _Fetch extends TotalBalanceEvent {
}

class _AccountsChange extends TotalBalanceEvent {
  final List<AccountBalance> accounts;

  _AccountsChange(this.accounts);
}

class ChangeAccountsVisibility extends TotalBalanceEvent {}

class AddAccount extends TotalBalanceEvent{

}

abstract class TotalBalanceState {}

class Loading extends TotalBalanceState {}

class Success extends TotalBalanceState {
  final int totalBalance;
  final List<AccountBalance> accounts;

  Success({this.totalBalance, this.accounts});
}

class ExpandAccounts extends TotalBalanceState {
}

class CollapseAccounts extends TotalBalanceState {
}

class TotalBalanceBloc extends Bloc<TotalBalanceEvent, TotalBalanceState> {
  final Repository _repository;

  bool _showAccounts = false;
  int _totalBalance = 0;
  List<AccountBalance> _accounts = [];
  StreamSubscription<List<AccountBalance>> _subscription;

  TotalBalanceBloc(this._repository) : super(Loading()) {
    _subscription = _repository.watchAllAccountsBalance().listen((accounts) {
      add(_AccountsChange(accounts));
    });
  }

  bool isShowAccounts() => _showAccounts;

  void fetch(){
    add(_Fetch());
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  @override
  Stream<TotalBalanceState> mapEventToState(TotalBalanceEvent event) async* {
    if (event is _Fetch) {
      yield Success(totalBalance: _totalBalance, accounts: _accounts);
      if (_showAccounts) {
        yield ExpandAccounts();
      } else {
        yield CollapseAccounts();
      }
    } else if (event is _AccountsChange) {
       _accounts = event.accounts;
      _totalBalance =
          _accounts.map((account) => account.balance).fold(0, (a, b) => a + b);

      yield Success(totalBalance: _totalBalance, accounts: _accounts);
    } else if (event is ChangeAccountsVisibility) {
      _showAccounts = !_showAccounts;
      if (_showAccounts) {
        yield ExpandAccounts();
      } else {
        yield CollapseAccounts();
      }
    } else if(event is AddAccount){
      _showAccounts = true;
      yield ExpandAccounts();
    }
  }
}
