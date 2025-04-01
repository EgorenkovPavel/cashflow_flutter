import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/use_cases/watch_balances_use_case.dart';

import '../../domain/models.dart';
import '../../utils/sum.dart';

part 'account_balance_bloc.freezed.dart';

@freezed
class AccountBalanceEvent with _$AccountBalanceEvent {
  const factory AccountBalanceEvent.changeBalance({
    required List<BaseAccountBalanceListItem> accounts,
  }) = _ChangeBalanceAccountBalanceEvent;
}

@freezed
class AccountBalanceState with _$AccountBalanceState {
  const AccountBalanceState._();

  const factory AccountBalanceState({
    required List<BaseAccountBalanceListItem> balances,
  }) = _AccountBalanceState;

  List<BaseAccountListItem> get allAccounts =>
      balances.map((balance) => balance.account).toList();

  List<AccountBalanceListItem> get accountBalances =>
      balances.whereType<AccountBalanceListItem>().toList();

  List<DebtBalanceListItem> get debtBalances =>
      balances.whereType<DebtBalanceListItem>().toList();

  Balance get totals {
    var res = const Balance();
    for (var item in balances) {
      res = res + item.balance;
    }

    return res;
  }
}

class AccountBalanceBloc
    extends Bloc<AccountBalanceEvent, AccountBalanceState> {
  final WatchBalancesUseCase _watchBalancesUseCase;
  StreamSubscription? _sub;

  AccountBalanceBloc(this._watchBalancesUseCase)
      : super(const AccountBalanceState(balances: [])) {
    on<AccountBalanceEvent>((event, emitter) => event.map(
          changeBalance: (event) => _changeBalance(event, emitter),
        ));

    _sub = _watchBalancesUseCase().listen((items) {
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
  List<BaseAccountBalanceListItem> watchBalances() =>
      watch<AccountBalanceBloc>().state.balances;

  List<AccountBalanceListItem> watchAccountBalances() =>
      watch<AccountBalanceBloc>().state.accountBalances;

  List<DebtBalanceListItem> watchDebtBalances() =>
      watch<AccountBalanceBloc>().state.debtBalances;

  Balance watchTotals() => watch<AccountBalanceBloc>().state.totals;

  List<BaseAccountListItem> watchListItems() =>
      watchBalances().map((a) => a.account).toList();

  List<BaseAccountListItem> readListItems() =>
      read<AccountBalanceBloc>().state.allAccounts;
}
