import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListTileBudget extends StatelessWidget {
  final BudgetData _budget;

  const ListTileBudget(this._budget, {Key key}) : super(key: key);

  RelativeRect buttonMenuPosition(BuildContext c) {
    final RenderBox bar = c.findRenderObject();
    final RenderBox overlay = Overlay.of(c).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        bar.localToGlobal(bar.size.center(Offset.zero), ancestor: overlay),
        bar.localToGlobal(bar.size.center(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    return position;
  }

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey();
    return ListTile(
      key: key,
      title: Text(DateFormat.yMMMM(Localizations.localeOf(context).languageCode)
          .format(_budget.date)),
      trailing: Text(_budget.sum.toString()),
      onLongPress: () async {
        final position = buttonMenuPosition(key.currentContext);
        int res = await showMenu(
          context: context,
          position: position,
          items: <PopupMenuEntry<int>>[
            PopupMenuItem<int>(
              child: Text('Delete'),
              value: 1,
            )
          ],
        );
        if (res == 1) {
          Provider.of<Repository>(context, listen: false).deleteBudget(_budget);
        }
      },
    );
  }
}
