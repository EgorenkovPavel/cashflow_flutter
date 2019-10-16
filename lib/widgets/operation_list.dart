import 'package:cashflow/pages/account_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database.dart';
import '../model.dart';

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
                ListTile(
                  title: Column(
                    children: <Widget>[
                      Text(itemOperation.date.toString()),
                      Text(itemOperation.type.toString()),
                      Text(itemOperation.account.toString()),
                      Text(itemOperation.category.toString()),
                      Text(itemOperation.recAccount.toString()),
                      Text(itemOperation.sum.toString()),
                    ],
                  ),
//                  onTap: () {
//                    Navigator.pushNamed(context, AccountPage.routeName,
//                        arguments: itemOperation);
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
