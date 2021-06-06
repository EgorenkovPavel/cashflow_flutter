
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models/budget.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:provider/provider.dart';

class ListTileBudget extends StatelessWidget {
  final Budget _budget;

  const ListTileBudget(this._budget, {Key? key}) : super(key: key);

  void onLongPress(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Wrap(
        children: <Widget>[
           ListTile(
            leading: Icon(Icons.delete),
            title: Text(AppLocalizations.of(context).delete),
            onTap: () {
              Provider.of<Repository>(context, listen: false)
                  .deleteBudget(_budget);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey();
    return ListTile(
      key: key,
      title: Text(DateFormat.yMMMM(Localizations.localeOf(context).languageCode)
          .format(DateTime(_budget.year, _budget.month))),
      trailing: Text(_budget.sum.toString()),
      onTap: () => PageNavigator.openBudget(context, _budget),
      onLongPress: () => onLongPress(context),
    );
  }
}
