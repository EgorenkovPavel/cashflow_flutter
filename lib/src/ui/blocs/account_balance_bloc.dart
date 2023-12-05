import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/interfaces/data/data_repository.dart';
import '../../domain/models.dart';

part 'account_balance_bloc.freezed.dart';

@freezed
class AccountBalanceEvent with _$AccountBalanceEvent {
  const factory AccountBalanceEvent.changeBalance({
    required List<AccountBalance> accounts,
  }) = _ChangeBalanceAccountBalanceEvent;
}

@freezed
class AccountBalanceState with _$AccountBalanceState {
  const factory AccountBalanceState({
    required List<AccountBalance> accounts,
  }) = _AccountBalanceState;
}

class AccountBalanceBloc
    extends Bloc<AccountBalanceEvent, AccountBalanceState> {
  final DataRepository _repository;
  StreamSubscription? _sub;

  AccountBalanceBloc(DataRepository repository)
      : _repository = repository,
        super(const AccountBalanceState(
          accounts: [],
        )) {
    on<AccountBalanceEvent>((event, emitter) => event.map(
          changeBalance: (event) => _changeBalance(event, emitter),
        ));

    _sub = _repository.accounts.watchAllBalance().listen((items) {
      add(AccountBalanceEvent.changeBalance(accounts: items));
    });
  }

  void _changeBalance(
    _ChangeBalanceAccountBalanceEvent event,
    Emitter<AccountBalanceState> emit,
  ) {
    emit(AccountBalanceState(
      accounts: event.accounts,
    ));
  }

  @override
  Future<void> close() {
    _sub?.cancel();

    return super.close();
  }
}
