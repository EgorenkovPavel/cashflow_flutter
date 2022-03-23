
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/domain/interfaces/data_repository.dart';
import 'package:money_tracker/domain/models.dart';

abstract class LastOperationsEvent{}

class Fetch extends LastOperationsEvent{}

class ChangeOperations extends LastOperationsEvent{
  final List<Operation> operations;

  ChangeOperations(this.operations);
}

class LastOperationsState{
  final List<Operation> operations;

  LastOperationsState(this.operations);

  LastOperationsState.initial() : operations = [];
}

class LastOperationsBloc extends Bloc<LastOperationsEvent, LastOperationsState>{
  final DataRepository _repository;
  StreamSubscription? _sub;

  static const int _operationCount = 5;

  LastOperationsBloc(this._repository) : super(LastOperationsState.initial()){
    on<Fetch>(_fetch);
    on<ChangeOperations>(_changeOperations);
  }

  void _fetch(Fetch event, Emitter<LastOperationsState> emit) {
    _sub = _repository.operations.watchLast(_operationCount).listen((items) {
      add(ChangeOperations(items));
    });
  }

  void _changeOperations(ChangeOperations event, Emitter<LastOperationsState> emit) {
    emit(LastOperationsState(event.operations));
  }

  @override
  Future<void> close() {
    _sub?.cancel();

    return super.close();
  }
}