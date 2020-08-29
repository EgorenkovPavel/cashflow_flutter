import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/charts/balance_chart.dart';
import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget{

  static const routeName = '/reports';

  static open(BuildContext context) {
    Navigator.of(context)
        .pushNamed(ReportsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).titleReports),),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              height: 200.0,
              alignment: Alignment.center,
              //color: Colors.grey,
              child: BalanceChart(),
            ),
          ),
        ],
      ),
    );
  }

}

//await for (List<CategoryCashflowBudget> categories
//in _repository.watchAllCategoryCashflowBudget(DateTime.now())) {
//
//if(categories.isEmpty){
//yield Empty();
//}else {
//List<CategoryCashflowBudget> categoriesInput = categories
//    .where((category) => category.type == OperationType.INPUT)
//    .toList();
//
//List<CategoryCashflowBudget> categoriesOutput = categories
//    .where((category) => category.type == OperationType.OUTPUT)
//    .toList();
//
//yield Success(categoriesInput, categoriesOutput);
//}
//}

//SizedBox(
//child: CashflowCategoryChart(categories: categories),
//height: 400.0,
//)