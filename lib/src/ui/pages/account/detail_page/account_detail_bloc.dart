import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/domain/use_cases/watch_account_title_use_case.dart';
import 'package:money_tracker/src/domain/use_cases/watch_operations_by_account_use_case.dart';

part 'account_detail_bloc.freezed.dart';

@freezed
class AccountDetailEvent with _$AccountDetailEvent {
  const factory AccountDetailEvent.fetch({required int accountId}) =
      _FetchAccountDetailEvent;

  const factory AccountDetailEvent.titleChanged({required String title}) =
      _TitleChangedAccountDetailEvent;

  const factory AccountDetailEvent.operationsChanged({
    required List<OperationListItem> operations,
  }) = _OperationsChangedAccountDetailEvent;
}

@freezed
class AccountDetailState with _$AccountDetailState {
  const factory AccountDetailState({
    required String title,
    required List<OperationListItem> operations,
  }) = _AccountDetailState;
}

class AccountDetailBloc extends Bloc<AccountDetailEvent, AccountDetailState> {
  final WatchAccountTitleUseCase _watchAccountTitleUseCase;
  final WatchOperationsByAccountUseCase _watchOperationsByAccountUseCase;

  StreamSubscription? _subTitle;
  StreamSubscription? _subOperations;

  AccountDetailBloc(
    this._watchAccountTitleUseCase,
    this._watchOperationsByAccountUseCase,
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
    _subTitle =
        _watchAccountTitleUseCase(accountId: event.accountId).listen((title) {
      add(AccountDetailEvent.titleChanged(title: title));
    });

    _subOperations =
        _watchOperationsByAccountUseCase(accountId: event.accountId)
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
