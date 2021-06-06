import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';

class CategoryState {
  final Category? category;
  final bool editTitleMode;

  CategoryState(this.editTitleMode, this.category);
}

class CategoryBloc extends Cubit<CategoryState> {
  final Repository _repository;

  late Category _category;
  bool _editTitleMode = false;

  CategoryBloc(this._repository) : super(CategoryState(false, null));

  Future<void> fetch(int id) async {
    _category = await _repository.getCategoryById(id);
    emit(CategoryState(_editTitleMode, _category));
  }

  void editTitle() {
    _editTitleMode = true;
    emit(CategoryState(_editTitleMode, _category));
  }

  Future<void> saveTitle(String title) async {
    _editTitleMode = false;
    _category = _category.copyWith(title: title);
    await _repository.updateCategory(_category);
    emit(CategoryState(_editTitleMode, _category));
  }
}
