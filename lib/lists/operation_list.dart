import 'package:cashflow/cards/operation_card.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/database.dart';
import '../data/model.dart';

class OperationList extends StatelessWidget {

  void onTap(BuildContext context, OperationItem itemOperation){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              child: OperationCard(
                operation: itemOperation,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))));
        });
  }

  Widget operationList(BuildContext context, List<OperationItem> operations){
    return ListView.builder(
      itemCount: operations.length,
      itemBuilder: (_, index) {
        final itemOperation = operations[index];
        return Column(
          children: <Widget>[
            Dismissible(
              key: Key(itemOperation.operationData.id.toString()),
              child: ListTile(
                  title: Text(itemOperation.account.title),
                  subtitle: itemOperation.type == OperationType.TRANSFER
                      ? Text(itemOperation.recAccount.title)
                      : Text(itemOperation.category.title),
                  trailing: Column(
                    children: <Widget>[
                      Text(itemOperation.sum.toString(), style: Theme.of(context).textTheme.headline,),
                      Text(DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(itemOperation.date), style: Theme.of(context).textTheme.caption,)
                    ],
                  ),
                  leading: CircleAvatar(
                    backgroundColor: getOperationColor(itemOperation.type),
                    child: Icon(getOperationIcon(itemOperation.type)),
                  ),
                  onTap: () => onTap(context, itemOperation)
              ),
              secondaryBackground:
              dismissBackground(context, Alignment.centerRight),
              background: dismissBackground(context, Alignment.centerLeft),
              onDismissed: (_) async {
                await Provider.of<Model>(context, listen: false)
                    .deleteOperation(itemOperation.operationData);

                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text(AppLocalizations.of(context).mesOperationDeleted)));
              },
            ),
            Divider()
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final model = Provider.of<Model>(context);
    return StreamBuilder<List<OperationItem>>(
      stream: model.watchAllOperationItems(),
      builder: (context, AsyncSnapshot<List<OperationItem>> snapshot) {

        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }else if(snapshot.data.isEmpty){
          return EmptyListHint(AppLocalizations.of(context).hintEmptyListOperations);
        }

        final operations = snapshot.data ?? List();

        return operationList(context, operations);
      },
    );
  }

  Container dismissBackground(BuildContext context, Alignment alignment) {
    return Container(
      color: Colors.red,
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          AppLocalizations.of(context).delete.toUpperCase(),
          style:
              Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
