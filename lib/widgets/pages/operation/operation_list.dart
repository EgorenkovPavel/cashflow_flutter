import 'dart:async';

import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/objects/operation_list_filter.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/pages/operation/list_divider_operation.dart';
import 'package:cashflow/widgets/pages/operation/list_tile_operation.dart';
import 'package:cashflow/widgets/pages/operation/operation_edit_page.dart';
import 'package:cashflow/widgets/pages/operation/operation_input_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class OperationList extends StatelessWidget {

  final OperationListFilter _filter;

  const OperationList({OperationListFilter filter}) : _filter = filter;

  Widget _listBuilder(BuildContext context, List<Operation> operations) {
    final itemPositionsListener = ItemPositionsListener.create();

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
                onTap: () => _onItemTap(context, itemOperation),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              if (index == operations.length - 1) {
                return Divider();
              }

              return ListDividerOperation(
                  operations[index], operations[index + 1]);
            },
          ),
        ),
      ],
    );
  }

  static Future addItem(BuildContext context) {
    return OperationInputPage.open(context);
  }

  static Future _onItemTap(BuildContext context, item) async {
    await OperationEditPage.open(context, item.id);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Operation>>(
      stream: Provider.of<Repository>(context).watchAllOperationsByFilter(_filter),
      builder: (BuildContext context, AsyncSnapshot<List<Operation>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.data.isEmpty) {
          return _EmptyListHint();
        }

        final items = snapshot.data ?? <Operation>[];

        return _listBuilder(context, items);
      },
    );
  }
}

class _EmptyListHint extends StatelessWidget {
  const _EmptyListHint({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyListHint(
      title: AppLocalizations.of(context).emptyListOperations,
      hint: AppLocalizations.of(context).hintEmptyList,
    );
  }
}
