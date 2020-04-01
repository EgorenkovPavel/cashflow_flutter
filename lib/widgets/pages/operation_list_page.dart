import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/widgets/lists/operation_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OperationListPage extends StatelessWidget {
  static const routeName = '/operationList';

  final Operation operation;

  const OperationListPage({Key key, this.operation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Operations'),
      ),
      body: OperationList(
        Provider.of<Repository>(context).watchAllOperations(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => OperationList.addItem(context),
      ),
    );
  }
}
