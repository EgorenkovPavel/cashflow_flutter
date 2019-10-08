import 'package:flutter/material.dart';

import 'data/account.dart';
import 'data/category.dart';
import 'data/operation_type.dart';

class Model extends ChangeNotifier{
  List<Account> _accounts = [Account('1'), Account('2'), Account('3')];
  List<Category> _categories = [
    Category('cat1', OperationType.input),
    Category('cat2', OperationType.output)
  ];

  List<Account> get accounts => _accounts;

  List<Category> get categories => _categories;

  void addAccount(Account account){
    _accounts.add(account);
    notifyListeners();
  }
}