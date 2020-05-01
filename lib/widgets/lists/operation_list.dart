import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/list_tiles/list_tile_operation.dart';
import 'package:cashflow/widgets/lists/main_list.dart';
import 'package:cashflow/widgets/pages/master_page.dart';
import 'package:cashflow/widgets/pages/operation_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OperationList extends MainList<Operation> {
  OperationList(Stream<List<Operation>> stream) : super(stream);

  @override
  Widget listBuilder(BuildContext context, List<Operation> operations) {
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

  static void addItem(BuildContext context) {
    Navigator.of(context).pushNamed(MasterPage.routeName);
  }

  @override
  void onItemTap(BuildContext context, item) {
    OperationPage.open(context, item.id);
  }

  @override
  Widget emptyListHint(BuildContext context) {
    return EmptyListHint(
      title: AppLocalizations.of(context).emptyListOperations,
      hint: AppLocalizations.of(context).hintEmptyList,);
  }

}
