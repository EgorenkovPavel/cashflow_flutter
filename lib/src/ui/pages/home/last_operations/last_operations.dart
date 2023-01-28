import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/page_navigator.dart';
import 'package:money_tracker/src/ui/pages/home/last_operations/last_operations_bloc.dart';
import 'package:money_tracker/src/ui/pages/operation/list_divider_operation.dart';
import 'package:money_tracker/src/ui/pages/operation/list_tile_operation.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class LastOperations extends StatelessWidget {
  const LastOperations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<LastOperationsBloc>()..add(const LastOperationsEvent.fetch()),
      child: Builder(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.loc.titleLastOperations,
              style: Theme.of(context).textTheme.headline6,
            ),
            BlocBuilder<LastOperationsBloc, LastOperationsState>(
              builder: (context, state) {
                if (state.operations.isEmpty) {
                  return const _NoOperationsTitle();
                }

                return _OperationsList(items: state.operations);
              },
            ),
            //_ShowAllButton(),
          ],
        );
      }),
    );
  }
}

class _OperationsList extends StatelessWidget {
  const _OperationsList({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Operation> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .expand((e) => [
                if (items.indexOf(e) == 0)
                  ListDividerOperation.day(null, e)
                else
                  ListDividerOperation.day(items[items.indexOf(e) - 1], e),
                ListTileOperation(
                  e,
                  onTap: () =>
                      sl<PageNavigator>().openOperationEditPage(context, e.id),
                ),
              ])
          .toList()
        ..add(const _ShowAllButton()),
    );
  }
}

class _NoOperationsTitle extends StatelessWidget {
  const _NoOperationsTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(context.loc.noOperations),
    );
  }
}

class _ShowAllButton extends StatelessWidget {
  const _ShowAllButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () => sl<PageNavigator>().openOperationListPage(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_downward,
                color: Theme.of(context).colorScheme.primary,
              ),
              Text(
                context.loc.btnShowAll.toUpperCase(),
                style: const TextStyle()
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
