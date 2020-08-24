import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/lists/operation_list.dart';
import 'package:cashflow/widgets/pages/operation_filter_page.dart';
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
        title: Text(AppLocalizations.of(context).operations),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.filter_list),
          onPressed: (){
            OperationFilterPage.open(context);
          },),
        ],
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
