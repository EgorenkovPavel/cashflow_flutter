import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/data_source.dart';
import 'package:money_tracker/domain/models.dart';

abstract class OperationListEvent {}

class Fetch extends OperationListEvent {
  final OperationListFilter filter;

  Fetch(this.filter);
}

class ChangeOperations extends OperationListEvent {
  final List<Operation> operations;

  ChangeOperations(this.operations);
}

class OperationListState {
  final List<Operation> operations;
  final OperationListFilter filter;

  OperationListState({
    required this.operations,
    required this.filter,
  });

  OperationListState.initial()
      : operations = [],
        filter = OperationListFilter.empty();
}

class OperationListBloc extends Bloc<OperationListEvent, OperationListState> {
  final DataSource _repository;
  StreamSubscription? _sub;

  OperationListBloc(this._repository) : super(OperationListState.initial()) {
    on<Fetch>(_fetch);
    on<ChangeOperations>(_changeOperations);
  }

  void _fetch(Fetch event, Emitter<OperationListState> emit) {
    emit(OperationListState(operations: state.operations, filter: event.filter));
    _sub?.cancel();
    _sub =
        _repository.operations.watchAllByFilter(event.filter).listen((items) {
      add(ChangeOperations(items));
    });
  }

  void _changeOperations(
      ChangeOperations event, Emitter<OperationListState> emit) {
    emit(OperationListState(operations: event.operations, filter: state.filter));
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
