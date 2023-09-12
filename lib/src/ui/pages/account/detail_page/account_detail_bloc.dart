import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/domain/models/enum/currency.dart';

part 'account_detail_bloc.freezed.dart';

@freezed
class AccountDetailEvent with _$AccountDetailEvent {
  const factory AccountDetailEvent.fetch({required int accountId}) =
      _FetchAccountDetailEvent;

  const factory AccountDetailEvent.titleChanged({required String title}) =
      _TitleChangedAccountDetailEvent;

  const factory AccountDetailEvent.operationsChanged({
    required List<Operation> operations,
  }) = _OperationsChangedAccountDetailEvent;
}

@freezed
class AccountDetailState with _$AccountDetailState {
  const factory AccountDetailState({
    required String title,
    required List<Operation> operations,
  }) = _AccountDetailState;
}

class AccountDetailBloc extends Bloc<AccountDetailEvent, AccountDetailState> {
  final DataRepository _repository;
  StreamSubscription? _subTitle;
  StreamSubscription? _subOperations;

  AccountDetailBloc(this._repository)
      : super(const AccountDetailState(title: '', operations: [])) {
    on<AccountDetailEvent>((event, emitter) => event.map(
          fetch: (event) => _fetch(event, emitter),
          titleChanged: (event) => _titleChanged(event, emitter),
          operationsChanged: (event) => _operationsChanged(event, emitter),
        ));
  }

  Future<void> _fetch(
    _FetchAccountDetailEvent event,
    Emitter<AccountDetailState> emit,
  ) async {
    _subTitle = _repository.accounts.watchById(event.accountId).listen((event) {
      add(AccountDetailEvent.titleChanged(title: event.title));
    });

    _subOperations = _repository.operations
        .watchAllByFilter(OperationListFilter(
      accounts: {
        Account(
          id: event.accountId,
          title: '',
          isDebt: false,
          currency: Currency.RUB,
        ),
      },
      categories: const {},
    ))
        .listen((event) {
      add(AccountDetailEvent.operationsChanged(operations: event));
    });
  }

  void _titleChanged(
    _TitleChangedAccountDetailEvent event,
    Emitter<AccountDetailState> emit,
  ) {
    emit(AccountDetailState(title: event.title, operations: state.operations));
  }

  void _operationsChanged(
    _OperationsChangedAccountDetailEvent event,
    Emitter<AccountDetailState> emit,
  ) {
    emit(AccountDetailState(title: state.title, operations: event.operations));
  }

  @override
  Future<void> close() {
    _subTitle?.cancel();
    _subOperations?.cancel();

    return super.close();
  }
}
