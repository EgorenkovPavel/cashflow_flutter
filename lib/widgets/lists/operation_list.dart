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
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class OperationList extends MainList<Operation> {
  OperationList(Stream<List<Operation>> stream) : super(stream);

  @override
  Widget listBuilder(BuildContext context, List<Operation> operations) {
    final ItemPositionsListener itemPositionsListener =
        ItemPositionsListener.create();

    Widget positionsView() {
      return ValueListenableBuilder<Iterable<ItemPosition>>(
        valueListenable: itemPositionsListener.itemPositions,
        builder: (context, positions, child) {
          int min;
          if (positions.isNotEmpty) {
            min = positions
                .where((ItemPosition position) => position.itemTrailingEdge > 0)
                .reduce((ItemPosition min, ItemPosition position) =>
                    position.itemTrailingEdge < min.itemTrailingEdge
                        ? position
                        : min)
                .index;
          }

          if (min == null) {
            return SizedBox();
          } else {
            return OperationTitle(date: operations[min].date);
          }
        },
      );
    }

    return Column(
      children: <Widget>[
        positionsView(),
        Expanded(
          child: ScrollablePositionedList.separated(
            itemPositionsListener: itemPositionsListener,
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
                return OperationTitle(
                  date: DateTime(op2.year, op2.month, op2.day),
                );
              }
            },
          ),
        ),
      ],
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

class OperationTitle extends StatelessWidget {
  final DateTime date;

  const OperationTitle({Key key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
          .format(date ?? DateTime.now()),
      style: Theme.of(context).textTheme.caption,
      textAlign: TextAlign.center,
    );
  }
}
