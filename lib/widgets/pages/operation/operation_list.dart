import 'dart:async';

import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/pages/operation/list_divider_operation.dart';
import 'package:cashflow/widgets/pages/operation/list_tile_operation.dart';
import 'package:cashflow/widgets/pages/operation/operation_edit_page.dart';
import 'package:cashflow/widgets/pages/operation/operation_input_page.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class OperationList extends StatelessWidget {

  final Stream<List<Operation>> stream;

  OperationList(this.stream);

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
            return ListDividerOperation(null, operations[min]);
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

              return ListDividerOperation(
                operations[index],
                operations[index + 1]);
            },
          ),
        ),
      ],
    );
  }

  static void addItem(BuildContext context) {
    Navigator.of(context).pushNamed(OperationInputPage.routeName);
  }

  void onItemTap(BuildContext context, item) {
    OperationEditPage.open(context, item.id);
  }

  @override
  Widget emptyListHint(BuildContext context) {
    return EmptyListHint(
      title: AppLocalizations
          .of(context)
          .emptyListOperations,
      hint: AppLocalizations
          .of(context)
          .hintEmptyList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Operation>>(
      stream: stream,
      builder:
          (BuildContext context, AsyncSnapshot<List<Operation>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.data.isEmpty) {
          return emptyListHint(context);
        }

        final List<Operation> items = snapshot.data ?? List<Operation>();

        return listBuilder(context, items);
      },
    );
  }

}

