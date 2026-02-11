import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/src/domain/interactors/operation_interactor.dart';
import 'package:money_tracker/src/domain/models.dart';

import '../../../../domain/view_models.dart';

part 'operation_list_bloc.freezed.dart';

@freezed
sealed class OperationListEvent with _$OperationListEvent {
  const factory OperationListEvent.fetch({
    required OperationListFilter filter,
  }) = _FetchOperationListEvent;

  const factory OperationListEvent.changeOperations({
    required List<OperationView> operations,
  }) = _ChangeOperationsOperationListEvent;
}

class OperationListState {
  final List<OperationView> operations;
  final OperationListFilter filter;

  OperationListState({required this.operations, required this.filter});

  OperationListState.initial()
    : operations = [],
      filter = const OperationListFilter();
}

class OperationListBloc extends Bloc<OperationListEvent, OperationListState> {
  final OperationInteractor _operationInteractor;
  StreamSubscription? _sub;

  OperationListBloc(this._operationInteractor)
    : super(OperationListState.initial()) {
    on<OperationListEvent>(
      (event, emitter) => event.map(
        fetch: (event) => _fetch(event, emitter),
        changeOperations: (event) => _changeOperations(event, emitter),
      ),
    );
  }

  void _fetch(_FetchOperationListEvent event, Emitter<OperationListState> emit) {
    emit(
      OperationListState(operations: state.operations, filter: event.filter),
    );
    _sub?.cancel();
    _sub = _operationInteractor.watchByFilter(event.filter).listen((items) {
      add(OperationListEvent.changeOperations(operations: items));
    });
  }

  void _changeOperations(
      _ChangeOperationsOperationListEvent event,
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
