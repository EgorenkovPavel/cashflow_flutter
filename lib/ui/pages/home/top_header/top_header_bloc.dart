import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/interfaces/data_source.dart';
import 'package:money_tracker/domain/models.dart';

abstract class TopHeaderEvent{}

class Fetch extends TopHeaderEvent{}

class ChangeBalance extends TopHeaderEvent{
  final List<AccountBalance> accounts;

  ChangeBalance({required this.accounts});
}


class TopHeaderState {
  final int totalBalance;
  final List<AccountBalance> accounts;

  TopHeaderState({
    required this.totalBalance,
    required this.accounts,
  });

  TopHeaderState.initial() : totalBalance = 0, accounts = [];
}

class TopHeaderBloc extends Bloc<TopHeaderEvent, TopHeaderState>{
  final DataSource _repository;
  StreamSubscription? _sub;

  TopHeaderBloc(this._repository) : super(TopHeaderState.initial()){
    on<Fetch>(_fetch);
    on<ChangeBalance>(_changeBalance);
  }

  void _fetch(Fetch event, Emitter<TopHeaderState>  emit){
    _sub = _repository.accounts.watchAllBalance().listen((items) {
      add(ChangeBalance(accounts: items));
    });
  }

  void _changeBalance(ChangeBalance event, Emitter<TopHeaderState> emit){
    final _balance = event.accounts.fold<int>(
        0, (previousValue, element) => previousValue + element.balance);
    emit(TopHeaderState(totalBalance: _balance, accounts: event.accounts));
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}