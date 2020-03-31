import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/widgets/lists/category_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CashflowPage extends StatelessWidget{

  static const String routeName = '/cashflow';

  final OperationType type;

  const CashflowPage({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cashflow'),
      ),
      
      body: CategoryList(Provider.of<Repository>(context, listen: false).watchAllCategoriesByType(type)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => CategoryList.addItem(context),
      ),
    );
  }

}