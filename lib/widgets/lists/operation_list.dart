import 'package:cashflow/widgets/cards/operation_card.dart';
import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/widgets/lists/main_list.dart';
import 'package:cashflow/widgets/pages/master_page.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/list_tiles/list_tile_operation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OperationList extends StatelessWidget implements MainList{

  Widget operationList(BuildContext context, List<Operation> operations){
    return ListView.builder(
      itemCount: operations.length,
      itemBuilder: (_, index) {
        final itemOperation = operations[index];
        return Column(
          children: <Widget>[
            ListTileOperation(itemOperation, onTap: () => onItemTap(context, itemOperation),),
            Divider()
          ],
        );
      },
    );
  }

  @override
  void addItem(BuildContext context) {
    Navigator.of(context).pushNamed(MasterPage.routeName);
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

    final model = Provider.of<Repository>(context);
    return StreamBuilder<List<Operation>>(
      stream: model.watchAllOperations(),
      builder: (context, AsyncSnapshot<List<Operation>> snapshot) {

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
