import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interactors/account_interactor.dart';
import 'package:money_tracker/src/ui/blocs/currency_rate_bloc.dart';

import '../../domain/view_models.dart';
import '../../utils/balance.dart';
import '../../utils/sum.dart';

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
  List<AccountBalanceView> watchAllBalances() =>
      watch<AccountBalanceBloc>().state.balances;

  List<AccountBalanceView> watchAccountBalances() =>
      watch<AccountBalanceBloc>().state.accountBalances;

  List<AccountBalanceView> watchDebtBalances() =>
      watch<AccountBalanceBloc>().state.debtBalances;

  Balance watchTotalBalance() {
    var sums = List.of(watch<AccountBalanceBloc>().state.totalBalance.sums);
    sums.sort((a, b) => a.currency.index - b.currency.index);
    return Balance(sums);
  }

  String getTitleById(int accountId) =>
      read<AccountBalanceBloc>().state.allAccounts
          .where((e) => e.id == accountId)
          .map((e) => e.title)
          .firstOrNull ??
      '';

  Sum watchTotalSum() => watchTotalBalance().totalInRub(usd(), eur());

  List<AccountView> watchAccounts() =>
      watch<AccountBalanceBloc>().state.allAccounts;

  List<AccountView> readAccounts() =>
      read<AccountBalanceBloc>().state.allAccounts;
}
