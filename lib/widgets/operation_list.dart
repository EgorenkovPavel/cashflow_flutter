import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/pages/account_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database.dart';
import '../model.dart';

IconData getOperationIcon(OperationType type){
  switch(type){
    case OperationType.INPUT:
      return Icons.add;

    case OperationType.OUTPUT:
      return Icons.remove;

    case OperationType.TRANSFER:
      return Icons.redo;
  }
}

class OperationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
    return StreamBuilder<List<OperationItem>>(
      stream: model.watchAllOperationItems(),
      builder: (context, AsyncSnapshot<List<OperationItem>> snapshot) {
        final operations = snapshot.data ?? List();

        return ListView.builder(
          itemCount: operations.length,
          itemBuilder: (_, index) {
            final itemOperation = operations[index];
            return Column(
              children: <Widget>[
                Dismissible(
                  key: Key(itemOperation.toString()),
                  child: ListTile(
                    title: Text(itemOperation.account.title),
                    subtitle: itemOperation.type == OperationType.TRANSFER
                        ? Text(itemOperation.recAccount.title)
                        : Text(itemOperation.category.title),
                    trailing: Text(itemOperation.sum.toString()),
                    leading: CircleAvatar(child: Icon(getOperationIcon(itemOperation.type)),),
//                  onTap: () {
//                    Navigator.pushNamed(context, AccountPage.routeName,
//                        arguments: itemOperation);
//                  },
                  ),
                  confirmDismiss: (_) async {
                    await Provider.of<Model>(context, listen: false)
                        .deleteOperation(itemOperation.operationData);
                },
//                  onDismissed: (direction){
//
//                  },
                ),
                Divider()
              ],
            );
          },
        );
      },
    );
  }
}
