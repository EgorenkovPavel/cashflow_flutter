import 'package:flutter/material.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/operation/list_divider_operation.dart';
import 'package:money_tracker/ui/pages/operation/list_tile_operation.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:provider/provider.dart';

class LastOperations extends StatelessWidget {
  const LastOperations({Key? key}) : super(key: key);

  static const int _operationCount = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppLocalizations.of(context).titleLastOperations,
          style: Theme.of(context).textTheme.headline6,
        ),
        StreamBuilder<List<Operation>>(
            stream:
                context.read<Repository>().watchLastOperations(_operationCount),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }

              if (snapshot.data == null) {
                return _NoOperationsTitle();
              }

              var items = snapshot.data!;

              if (items.isEmpty) {
                return _NoOperationsTitle();
              }

              return Column(
                children: items
                    .expand((e) => [
                          if (items.indexOf(e) == 0)
                            ListDividerOperation.day(null, e)
                          else
                            ListDividerOperation.day(
                                items[items.indexOf(e) - 1], e),
                          ListTileOperation(
                            e,
                            onTap: () => PageNavigator.openOperationEditPage(
                                context, e.id),
                          ),
                        ])
                    .toList()
                      ..add(_ShowAllButton()),
              );
            }),
        //_ShowAllButton(),
      ],
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
      child: Text(AppLocalizations.of(context).noOperations),
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
        onPressed: () => PageNavigator.openOperationListPage(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_downward,
                color: Theme.of(context).primaryColor,
              ),
              Text(
                AppLocalizations.of(context).btnShowAll.toUpperCase(),
                style:
                    TextStyle().copyWith(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
