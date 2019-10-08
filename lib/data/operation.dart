import 'package:cashflow/data/account.dart';
import 'package:cashflow/data/category.dart';
import 'package:cashflow/data/operation_type.dart';

class Operation{

  DateTime _date;
  OperationType _type;
  Account _account;
  Category _category;
  Account _recAccount;
  int _sum;

}