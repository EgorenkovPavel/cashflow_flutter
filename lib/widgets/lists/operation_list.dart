import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/cards/operation_card.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/list_tiles/list_tile_operation.dart';
import 'package:cashflow/widgets/lists/main_list.dart';
import 'package:cashflow/widgets/pages/master_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OperationList extends StatelessWidget implements MainList {
  Widget operationList(BuildContext context, List<Operation> operations) {
    var _controller = ScrollController();
    return Column(
      children: <Widget>[
        dateTitle(context, operations[0].date),
        Expanded(
          child: ListView.separated(
            controller: _controller,
            itemCount: operations.length,
            itemBuilder: (_, index) {
              final itemOperation = operations[index];
              return ListTileOperation(
                itemOperation,
                onTap: () => onItemTap(context, itemOperation),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              if (index == operations.length - 1) {
                return Divider();
              }
              var op1 = operations[index].date;
              var op2 = operations[index + 1].date;
              if (op1.year == op2.year &&
                  op1.month == op2.month &&
                  op1.day == op2.day) {
                return Divider();
              } else {
                return dateTitle(context, DateTime(op2.year, op2.month, op2.day));
              }
            },
          ),
        ),
      ],
    );
  }

  Widget dateTitle(BuildContext context, DateTime date){
    return Text(
      DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
          .format(date),
      style: Theme.of(context).textTheme.caption,
      textAlign: TextAlign.center,
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
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Operation>>(
      stream: Provider.of<Repository>(context).watchAllOperations(),
      builder: (context, AsyncSnapshot<List<Operation>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.data.isEmpty) {
          return EmptyListHint(
            title: 'List of operations is empty', hint: 'Press button to add first one',);
        }

        final operations = snapshot.data ?? List();

        return operationList(context, operations);
      },
    );
  }
}
