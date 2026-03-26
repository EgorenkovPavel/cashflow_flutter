import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interactors/account_interactor.dart';
import 'package:money_tracker/src/ui/blocs/currency_rate_bloc.dart';

import '../../domain/models.dart';
import '../../domain/view_models.dart';

part 'account_balance_bloc.freezed.dart';

@freezed
sealed class AccountBalanceEvent with _$AccountBalanceEvent {
  const factory AccountBalanceEvent.changeBalance({
    required List<AccountBalanceView> accounts,
  }) = _ChangeBalanceAccountBalanceEvent;
}

@freezed
abstract class AccountBalanceState with _$AccountBalanceState {
  const AccountBalanceState._();

  const factory AccountBalanceState({
    required List<AccountBalanceView> balances,
  }) = _AccountBalanceState;

  List<AccountView> get allAccounts =>
      balances.map((balance) => balance.account).toList();

  List<AccountBalanceView> get accountBalances =>
      balances.where((e) => !e.isDebt).toList();

  List<AccountBalanceView> get debtBalances =>
      balances.where((e) => e.isDebt).toList();

  Balance get totalBalance =>
      balances.fold(Balance(), (res, item) => res + item.balance);
}

class AccountBalanceBloc
    extends Bloc<AccountBalanceEvent, AccountBalanceState> {
  final AccountInteractor _accountInteractor;
  StreamSubscription? _sub;

  AccountBalanceBloc(this._accountInteractor)
    : super(const AccountBalanceState(balances: [])) {
    on<AccountBalanceEvent>(
      (event, emitter) =>
          event.map(changeBalance: (event) => _changeBalance(event, emitter)),
    );

    _sub = _accountInteractor.watchBalances().listen((items) {
      add(AccountBalanceEvent.changeBalance(accounts: items));
    });
  }

  void _changeBalance(
    _ChangeBalanceAccountBalanceEvent event,
    Emitter<AccountBalanceState> emit,
  ) {
    emit(AccountBalanceState(balances: event.accounts));
  }

  @override
  Future<void> close() {
    _sub?.cancel();

    return super.close();
  }
}

extension AccountBalanceBlocExt on BuildContext {
  AccountBalanceState _read() => read<AccountBalanceBloc>().state;

  AccountBalanceState _watch() => watch<AccountBalanceBloc>().state;

  List<AccountBalanceView> watchAllBalances() => _watch().balances;

  List<AccountBalanceView> watchAccountBalances() => _watch().accountBalances;

  List<AccountBalanceView> watchDebtBalances() => _watch().debtBalances;

  Balance watchTotalBalance() => _watch().totalBalance.sortByCurrency();

  Sum watchTotalSum() => balanceToRub(watchTotalBalance());

  List<AccountView> watchAccounts() => _watch().allAccounts;

  List<AccountView> readAccounts() => _read().allAccounts;
}
