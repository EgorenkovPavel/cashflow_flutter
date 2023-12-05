import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/models/operation/operation.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/pages/operation/list_divider_operation.dart';
import 'package:money_tracker/src/ui/pages/operation/list_tile_operation.dart';
import 'package:money_tracker/src/ui/widgets/empty_list_hint.dart';
import 'package:money_tracker/src/utils/extensions.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class OperationList extends StatelessWidget {
  final List<Operation> _operations;

  const OperationList(this._operations, {super.key});

  Widget _listBuilder(BuildContext context, List<Operation> operations) {
    final itemPositionsListener = ItemPositionsListener.create();

    Widget positionsView() {
      return ValueListenableBuilder<Iterable<ItemPosition>>(
        valueListenable: itemPositionsListener.itemPositions,
        builder: (context, positions, child) {
          int? min;
          if (positions.isNotEmpty) {
            min = positions
                .where((ItemPosition position) => position.itemTrailingEdge > 0)
                .reduce((ItemPosition min, ItemPosition position) =>
                    position.itemTrailingEdge < min.itemTrailingEdge
                        ? position
                        : min)
                .index;
          }

          return min == null
              ? const SizedBox()
              : ListDividerOperation.day(null, operations[min]);
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
                return const Divider();
              }

              return ListDividerOperation.day(
                operations[index],
                operations[index + 1],
              );
            },
          ),
        ),
      ],
    );
  }

  static void _onItemTap(BuildContext context, item) {
    context.openOperationEditPage(item.id);
  }

  @override
  Widget build(BuildContext context) {
    if (_operations.isEmpty) {
      return EmptyListHint(
        title: context.loc.emptyListOperations,
        hint: context.loc.hintEmptyList,
      );
    }

    return _listBuilder(context, _operations);
  }
}
