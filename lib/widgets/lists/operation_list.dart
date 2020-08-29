import 'dart:async';

import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/list_tiles/list_tile_operation.dart';
import 'package:cashflow/widgets/lists/main_list.dart';
import 'package:cashflow/widgets/pages/master_page.dart';
import 'package:cashflow/widgets/pages/operation_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visibility_detector/visibility_detector.dart';

class OperationList extends MainList<Operation> {
  OperationList(Stream<List<Operation>> stream) : super(stream);

  @override
  Widget listBuilder(BuildContext context, List<Operation> operations) {
    var _controller = ScrollController();

    DateTime initDate = operations[0].date;
    var controller = StreamController<DateTime>()..add(initDate);

    return Column(
      children: <Widget>[
        StreamBuilder<DateTime>(
            stream: controller.stream,
            builder: (context, snapshot) {
              return dateTitle(context, snapshot.data);
            }),
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
                return VisibilityDetector(
                  child: dateTitle(
                      context, DateTime(op2.year, op2.month, op2.day)),
                  onVisibilityChanged: (i) {
                    if (i.visibleFraction == 0.0 && initDate.isAfter(DateTime(op2.year, op2.month, op2.day))){
                      initDate = DateTime(op2.year, op2.month, op2.day);
                      controller.add(DateTime(op2.year, op2.month, op2.day));
                    }else if (i.visibleFraction == 1.0 && initDate.isBefore(DateTime(op2.year, op2.month, op2.day))) {
                      initDate = DateTime(op1.year, op1.month, op1.day);
                      controller.add(DateTime(op1.year, op1.month, op1.day));
                    }
                  },
                  key: Key(DateTime(op2.year, op2.month, op2.day).toString()),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget dateTitle(BuildContext context, DateTime date) {
    return Text(
      DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
          .format(date ?? DateTime.now()),
      style: Theme.of(context).textTheme.caption,
      textAlign: TextAlign.center,
    );
  }

  static void addItem(BuildContext context) {
    Navigator.of(context).pushNamed(MasterPage.routeName);
  }

  void onItemTap(BuildContext context, item) {
    OperationPage.open(context, item.id);
  }

  @override
  Widget emptyListHint(BuildContext context) {
    return EmptyListHint(
      title: AppLocalizations.of(context).emptyListOperations,
      hint: AppLocalizations.of(context).hintEmptyList,
    );
  }
}
