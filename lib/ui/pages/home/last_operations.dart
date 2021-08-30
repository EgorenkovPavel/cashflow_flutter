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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamBuilder<List<Operation>>(
            stream: context.read<Repository>().watchLastOperations(5),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }

              if (snapshot.data == null) {
                return SizedBox();
              }

              var items = snapshot.data!;

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
                    .toList(),
              );
            }),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () => PageNavigator.openOperationListPage(context),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_downward,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(AppLocalizations.of(context).btnShowAll.toUpperCase(),
                    style: TextStyle()
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
