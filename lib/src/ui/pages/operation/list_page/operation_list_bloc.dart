import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/domain/interactors/operation_interactor.dart';
import 'package:money_tracker/src/domain/models.dart';

import '../../../../domain/view_models.dart';

abstract class OperationListEvent {}

class Fetch extends OperationListEvent {
  final OperationListFilter filter;

  Fetch(this.filter);
}

class ChangeOperations extends OperationListEvent {
  final List<OperationView> operations;

  ChangeOperations(this.operations);
}

class OperationListState {
  final List<OperationView> operations;
  final OperationListFilter filter;

  OperationListState({
    required this.operations,
    required this.filter,
  });

  OperationListState.initial()
      : operations = [],
        filter = const OperationListFilter();
}

class OperationListBloc extends Bloc<OperationListEvent, OperationListState> {
  final OperationInteractor _operationInteractor;
  StreamSubscription? _sub;

  OperationListBloc(this._operationInteractor)
      : super(OperationListState.initial()) {
    on<Fetch>(_fetch);
    on<ChangeOperations>(_changeOperations);
  }

  void _fetch(Fetch event, Emitter<OperationListState> emit) {
    emit(
      OperationListState(operations: state.operations, filter: event.filter),
    );
    _sub?.cancel();
    _sub = _operationInteractor.watchByFilter(event.filter).listen((items) {
      add(ChangeOperations(items));
    });
  }

  void _changeOperations(
    ChangeOperations event,
    Emitter<OperationListState> emit,
  ) {
    emit(
      OperationListState(operations: event.operations, filter: state.filter),
    );
  }

  @override
  Future<void> close() {
    _sub?.cancel();

    return super.close();
  }
}
