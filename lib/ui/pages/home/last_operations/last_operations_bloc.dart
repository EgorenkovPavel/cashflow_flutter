import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/domain/interfaces/data/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

part 'last_operations_bloc.freezed.dart';

@freezed
class LastOperationsEvent with _$LastOperationsEvent {
  const factory LastOperationsEvent.fetch() = _FetchLastOperationsEvent;

  const factory LastOperationsEvent.changeOperations({
    required List<Operation> operations,
  }) = _ChangeOperationsLastOperationsEvent;
}

@freezed
class LastOperationsState with _$LastOperationsState {
  const factory LastOperationsState({required List<Operation> operations}) =
      _LastOperationsState;
}

class LastOperationsBloc
    extends Bloc<LastOperationsEvent, LastOperationsState> {
  final DataRepository _repository;
  StreamSubscription? _sub;

  static const int _operationCount = 5;

  LastOperationsBloc(this._repository)
      : super(const LastOperationsState(operations: [])) {
    on<LastOperationsEvent>((event, emitter) => event.map(
          fetch: (event) => _fetch(event, emitter),
          changeOperations: (event) => _changeOperations(event, emitter),
        ));
  }

  void _fetch(
    _FetchLastOperationsEvent event,
    Emitter<LastOperationsState> emit,
  ) {
    _sub = _repository.operations.watchLast(_operationCount).listen((items) {
      add(LastOperationsEvent.changeOperations(operations: items));
    });
  }

  void _changeOperations(
    _ChangeOperationsLastOperationsEvent event,
    Emitter<LastOperationsState> emit,
  ) {
    emit(LastOperationsState(operations: event.operations));
  }

  @override
  Future<void> close() {
    _sub?.cancel();

    return super.close();
  }
}
