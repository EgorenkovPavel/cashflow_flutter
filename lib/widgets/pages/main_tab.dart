import 'dart:async';

import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/widgets/pages/cashflow_card.dart';
import 'package:cashflow/widgets/pages/last_operations_card.dart';
import 'package:cashflow/widgets/pages/total_balance_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainTab extends StatefulWidget {

  const MainTab({
    Key key,
  }) : super(key: key);

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  List<AccountBalance> accounts = [];
  List<CategoryCashflowBudget> categoriesInput = [];
  List<CategoryCashflowBudget> categoriesOutput = [];

  StreamSubscription<List<AccountBalance>> subAccount;
  StreamSubscription<List<CategoryCashflowBudget>> subCategory;

  @override
  void initState() {
    super.initState();
    subAccount = Provider.of<Repository>(context, listen: false)
        .watchAllAccountsBalance()
        .listen((list) {
      setState(() {
        accounts = list;
      });
    });
    subCategory = Provider.of<Repository>(context, listen: false)
        .watchAllCategoryCashflowBudget(DateTime.now())
        .listen((list) {
      setState(() {
        categoriesInput = list
            .where((category) => category.type == OperationType.INPUT)
            .toList();

        categoriesOutput = list
            .where((category) => category.type == OperationType.OUTPUT)
            .toList();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    subAccount.cancel();
    subCategory.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Theme.of(context).primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TotalBalanceCard(accounts: accounts,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CashflowCard(categoriesInput: categoriesInput, categoriesOutput: categoriesOutput,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LastOperationsCard(),
              ),
              SizedBox(height: 60.0,),
            ],
          ),
        )
      ],
    );
  }
}


