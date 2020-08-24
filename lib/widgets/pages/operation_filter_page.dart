
import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/material.dart';

class OperationFilterPage extends StatefulWidget{

  static const routeName = '/operationFilter';

  static void open(BuildContext context){
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  _OperationFilterPageState createState() => _OperationFilterPageState();
}

class _OperationFilterPageState extends State<OperationFilterPage> {

  OperationFilter _filter = OperationFilter();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).titleFilters),
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            children: <Widget>[
              InputChip(
                label: Text('Aaron Burr'),
                deleteIcon: Icon(Icons.cancel),
                onDeleted: (){},
              )
            ],
          )
        ],
      ),
    );
  }
}

class OperationFilter{

  DateTime startDate;
  DateTime endDate;
  Set<Account> accounts;
  Set<Category> categories;

}