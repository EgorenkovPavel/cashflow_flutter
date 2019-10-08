import 'operation_type.dart';

class Category{

  String _title;
  OperationType _type;

  Category(this._title, this._type);

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}