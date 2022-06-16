import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

abstract class AccountDetailEvent {}

class Fetch extends AccountDetailEvent {
  final int accountId;

  Fetch(this.accountId);
}

class TitleChanged extends AccountDetailEvent {
  final String title;

  TitleChanged(this.title);
}

class OperationsChanged extends AccountDetailEvent {
  final List<Operation> operations;

  OperationsChanged(this.operations);
}

class AccountDetailState {
  final String title;
  final List<Operation> operations;

  AccountDetailState({
    required this.title,
    required this.operations,
  });

  AccountDetailState.initial()
      : title = '',
        operations = [];
}

class AccountDetailBloc extends Bloc<AccountDetailEvent, AccountDetailState> {
  final DataRepository _repository;
  StreamSubscription? _subTitle;
  StreamSubscription? _subOperations;

  AccountDetailBloc(this._repository) : super(AccountDetailState.initial()) {
    on<Fetch>(_fetch);
    on<TitleChanged>(_titleChanged);
    on<OperationsChanged>(_operationsChanged);
  }

  Future<void> _fetch(Fetch event, Emitter<AccountDetailState> emit) async {
    _subTitle = _repository.accounts.watchById(event.accountId).listen((event) {
      add(TitleChanged(event.title));
    });

    _subOperations = _repository.operations
        .watchAllByFilter(OperationListFilter(
      accounts: {Account(id: event.accountId, title: '', isDebt: false)},
      categories: const {},
    ))
        .listen((event) {
      add(OperationsChanged(event));
    });
  }

  void _titleChanged(TitleChanged event, Emitter<AccountDetailState> emit) {
    emit(AccountDetailState(title: event.title, operations: state.operations));
  }

  void _operationsChanged(
    OperationsChanged event,
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
