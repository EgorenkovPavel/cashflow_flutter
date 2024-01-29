import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/use_cases/watch_balances_use_case.dart';

import '../../domain/models.dart';
import '../../domain/models/enum/currency.dart';

part 'account_balance_bloc.freezed.dart';

@freezed
class AccountBalanceEvent with _$AccountBalanceEvent {
  const factory AccountBalanceEvent.changeBalance({
    required List<AccountBalance> accounts,
  }) = _ChangeBalanceAccountBalanceEvent;
}

@freezed
class AccountBalanceState with _$AccountBalanceState {
  const AccountBalanceState._();

  const factory AccountBalanceState({
    required List<AccountBalance> balances,
    required Map<Currency, int> totals,
  }) = _AccountBalanceState;

  List<Account> get accounts => balances.map((balance) => balance.account).toList();
}

class AccountBalanceBloc
    extends Bloc<AccountBalanceEvent, AccountBalanceState> {
  final WatchBalancesUseCase _watchBalancesUseCase;
  StreamSubscription? _sub;

  AccountBalanceBloc(this._watchBalancesUseCase)
      : super(const AccountBalanceState(
          balances: [],
          totals: {},
        )) {
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
    emit(AccountBalanceState(
      balances: event.accounts,
      totals: _calcTotals(event.accounts),
    ));
  }

  Map<Currency, int> _calcTotals(List<AccountBalance> list) {
    final res = <Currency, int>{};
    for (var item in list) {
      res[item.currency] = (res[item.currency] ?? 0) + item.balance;
    }

    return res;
  }

  @override
  Future<void> close() {
    _sub?.cancel();

    return super.close();
  }
}
