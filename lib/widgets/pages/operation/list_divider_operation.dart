import 'package:cashflow/data/objects/operation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListDividerOperation extends StatelessWidget {
  final Operation operation1;
  final Operation operation2;

  const ListDividerOperation({Key key, this.operation1, this.operation2})
      : super(key: key);

  static Widget createByDate(BuildContext context, DateTime date){
    return _operationTitle(context, date);
  }

  static Widget _operationTitle(BuildContext context, DateTime date){
    return Text(
      DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
          .format(date ?? DateTime.now()),
      style: Theme.of(context).textTheme.caption,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    var op1 = operation1.date;
    var op2 = operation2.date;
    if (op1.year == op2.year &&
        op1.month == op2.month &&
        op1.day == op2.day) {
      return Divider();
    } else {
      return _operationTitle(context,
        DateTime(op2.year, op2.month, op2.day),
      );
    }
  }
}
