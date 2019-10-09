import 'package:flutter/material.dart';

import 'database.dart';

class Model extends ChangeNotifier{

  final db;

//  List<Account> _accounts = [Account('1'), Account('2'), Account('3')];
//  List<Category> _categories = [
//    Category('cat1', OperationType.input),
//    Category('cat2', OperationType.output)
//  ];


  Model() : db = Database();

  Stream<List<AccountData>> watchAllAccounts() => db.accountDao.watchAllAccounts();

  Future insertAccount(AccountData entity) => db.accountDao.insertAccount(entity);
  Future updateAccount(AccountData entity) => db.accountDao.updateAccount(entity);
//  List<Account> get accounts => _accounts;
//
//  List<Category> get categories => _categories;
//
//  void addAccount(Account account){
//    _accounts.add(account);
//    notifyListeners();
//  }
}