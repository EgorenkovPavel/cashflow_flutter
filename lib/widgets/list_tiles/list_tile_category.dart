import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListTileCategory extends StatelessWidget{

  final CategoryCashflowBudget category;
  final GestureTapCallback onTap;

  const ListTileCategory({Key key, this.category, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.title),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(NumberFormat().format(category.cashflow), style: Theme.of(context).textTheme.headline5,),
          Text(NumberFormat().format(category.budget), style: Theme.of(context).textTheme.subtitle1,),
        ],
      ),
      onTap: onTap,
    );
  }

}