import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/src/domain/models.dart';

part 'top_header_bloc.freezed.dart';

@freezed
class TopHeaderEvent with _$TopHeaderEvent {
  const factory TopHeaderEvent.fetch() = _FetchTopHeaderEvent;

  const factory TopHeaderEvent.changeBalance({
    required List<AccountBalance> accounts,
  }) = _ChangeBalanceTopHeaderEvent;
}

@freezed
class TopHeaderState with _$TopHeaderState {
  const factory TopHeaderState({
    required int totalBalance,
    required List<AccountBalance> accounts,
  }) = _TopHeaderState;
}

class TopHeaderBloc extends Bloc<TopHeaderEvent, TopHeaderState> {
  final DataRepository _repository;
  StreamSubscription? _sub;

  TopHeaderBloc(this._repository)
      : super(const TopHeaderState(
          accounts: [],
          totalBalance: 0,
        )) {
    on<TopHeaderEvent>((event, emitter) => event.map(
          fetch: (event) => _fetch(event, emitter),
          changeBalance: (event) => _changeBalance(event, emitter),
        ));
  }

  void _fetch(_FetchTopHeaderEvent event, Emitter<TopHeaderState> emit) {
    _sub = _repository.accounts.watchAllBalance().listen((items) {
      add(TopHeaderEvent.changeBalance(accounts: items));
    });
  }

  void _changeBalance(
    _ChangeBalanceTopHeaderEvent event,
    Emitter<TopHeaderState> emit,
  ) {
    final balance = event.accounts.fold<int>(
      0,
      (previousValue, element) => previousValue + element.balance,
    );
    emit(TopHeaderState(totalBalance: balance, accounts: event.accounts));
  }

  @override
  Future<void> close() {
    _sub?.cancel();

    return super.close();
  }
}
