import 'package:cashflow/cards/operation_card.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/pages/main_list.dart';
import 'package:cashflow/pages/master_page_new.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/list_tiles/list_tile_operation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/database.dart';
import '../data/model.dart';

class OperationList extends StatelessWidget implements MainList{

  Widget operationList(BuildContext context, List<OperationItem> operations){
    return ListView.builder(
      itemCount: operations.length,
      itemBuilder: (_, index) {
        final itemOperation = operations[index];
        return Column(
          children: <Widget>[
            Dismissible(
              key: Key(itemOperation.operationData.id.toString()),
              child: ListTileOperation(itemOperation, onTap: () => onItemTap(context, itemOperation),),
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

  @override
  void addItem(BuildContext context) {
    Navigator.of(context).pushNamed(MasterPageNew.routeName);
  }

  @override
  void filterList() {
    // TODO: implement filterList
  }

  @override
  void onItemTap(BuildContext context, item) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              child: OperationCard(
                operation: item,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))));
        });
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

}
