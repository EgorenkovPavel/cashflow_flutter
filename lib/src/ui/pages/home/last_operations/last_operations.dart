import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/pages/home/last_operations/last_operations_bloc.dart';
import 'package:money_tracker/src/ui/pages/operation/list_divider_operation.dart';
import 'package:money_tracker/src/ui/pages/operation/list_tile_operation.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class LastOperations extends StatelessWidget {
  const LastOperations({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<LastOperationsBloc>()..add(const LastOperationsEvent.fetch()),
      child: Builder(builder: (context) {
        return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.loc.titleLastOperations,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              BlocBuilder<LastOperationsBloc, LastOperationsState>(
                builder: (context, state) {
                  if (state.operations.isEmpty) {
                    return const _NoOperationsTitle();
                  } else {
                    return _OperationsList(items: state.operations);
                  }
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _OperationsList extends StatelessWidget {
  const _OperationsList({
    super.key,
    required this.items,
  });

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
                  onTap: () => context.openOperationEditPage(e.id),
                ),
              ])
          .toList()
        ..add(const _ShowAllOperationsButton()),
    );
  }
}

class _NoOperationsTitle extends StatelessWidget {
  const _NoOperationsTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(context.loc.noOperations),
    );
  }
}

class _ShowAllOperationsButton extends StatelessWidget {
  const _ShowAllOperationsButton({
    super.key,
  });

  void _onPressed(BuildContext context) => context.openOperationListPage();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton.icon(
        onPressed: () => _onPressed(context),
        icon: Icon(
          Icons.arrow_downward,
          color: Theme.of(context).colorScheme.primary,
        ),
        label: Text(
          context.loc.btnShowAll.toUpperCase(),
          style: const TextStyle()
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
