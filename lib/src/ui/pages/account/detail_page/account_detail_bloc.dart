import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interactors/account_interactor.dart';
import 'package:money_tracker/src/domain/interactors/operation_interactor.dart';

import '../../../../domain/view_models.dart';

part 'account_detail_bloc.freezed.dart';

@freezed
class AccountDetailEvent with _$AccountDetailEvent {
  const factory AccountDetailEvent.fetch({required int accountId}) =
      _FetchAccountDetailEvent;

  const factory AccountDetailEvent.titleChanged(String title) =
      _TitleChangedAccountDetailEvent;

  const factory AccountDetailEvent.operationsChanged(
          List<OperationView> operations) =
      _OperationsChangedAccountDetailEvent;
}

@freezed
class AccountDetailState with _$AccountDetailState {
  const factory AccountDetailState({
    required String title,
    required List<OperationView> operations,
  }) = _AccountDetailState;
}

class AccountDetailBloc extends Bloc<AccountDetailEvent, AccountDetailState> {
  final AccountInteractor _accountInteractor;
  final OperationInteractor _operationInteractor;

  StreamSubscription? _subTitle;
  StreamSubscription? _subOperations;

  AccountDetailBloc(
    this._accountInteractor,
    this._operationInteractor,
  ) : super(const AccountDetailState(title: '', operations: [])) {
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
    _subTitle = _accountInteractor.watchById(event.accountId).listen((account) {
      add(AccountDetailEvent.titleChanged(account.title));
    });

    _subOperations =
        _operationInteractor.watchByAccountId(event.accountId).listen((list) {
      add(AccountDetailEvent.operationsChanged(list));
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
