import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListTileBudget extends StatelessWidget {
  final BudgetData _budget;

  const ListTileBudget(this._budget, {Key key}) : super(key: key);

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
          .format(_budget.date)),
      trailing: Text(_budget.sum.toString()),
      onLongPress: () => onLongPress(context),
    );
  }
}
