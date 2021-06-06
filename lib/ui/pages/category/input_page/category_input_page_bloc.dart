import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';

abstract class CategoryInputPageState {}

class InitialState extends CategoryInputPageState {
  final OperationType type;

  InitialState(this.type);
}

class Saved extends CategoryInputPageState {
  final Category category;

  Saved(this.category);
}

class CategoryInputPageBloc extends Cubit<CategoryInputPageState> {
  final Repository _repository;

  late OperationType _type;

  CategoryInputPageBloc(this._repository) : super(InitialState(OperationType.INPUT));

  void initial(OperationType type){
    _type = type;
  }

  Future<void> save(String title) async {
    var category = Category(title: title, type: _type);
    var id = await _repository.insertCategory(category);
    emit(Saved(category.copyWith(id: id)));
  }
}
