import 'package:bloc/bloc.dart';
import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/repository.dart';

abstract class LastOperationsEvent {}

class Fetch extends LastOperationsEvent {}

abstract class LastOperationsState {}

class Loading extends LastOperationsState {}

class Success extends LastOperationsState {
  final List<Operation> operations;

  Success(this.operations);
}

class Empty extends LastOperationsState {}

class LastOperationsBloc
    extends Bloc<LastOperationsEvent, LastOperationsState> {
  final Repository _repository;

  LastOperationsBloc(this._repository) : super(Loading());

  @override
  Stream<LastOperationsState> mapEventToState(
      LastOperationsEvent event) async* {
    await for (List<Operation> operations
    in _repository.watchLastOperations(5)) {
      if (operations.isEmpty) {
        yield Empty();
      } else {
        yield Success(operations);
      }
    }
  }
}
