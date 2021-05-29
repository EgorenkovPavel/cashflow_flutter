import 'package:cashflow/data/objects/operation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListDividerOperation extends StatelessWidget {
  final Operation? operation1;
  final Operation operation2;

  const ListDividerOperation(this.operation1, this.operation2, {Key? key})
      : super(key: key);

  Widget _operationTitle(BuildContext context, DateTime date) {
    return Text(
      DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
          .format(date),
      style: Theme.of(context).textTheme.caption,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    var op1 = operation1?.date;
    var op2 = operation2.date;
    if (op1 != null &&
        op1.year == op2.year &&
        op1.month == op2.month &&
        op1.day == op2.day) {
      return Divider();
    } else {
      return Stack(alignment: AlignmentDirectional.center, children: [
        Divider(),
        Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: _operationTitle(
            context,
            DateTime(op2.year, op2.month, op2.day),
          ),
        ),
      ]);
    }
  }
}
