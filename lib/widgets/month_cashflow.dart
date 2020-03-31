import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthCashflow extends StatelessWidget {
  final DateTime date;
  final int cashflow;
  final int budget;

  const MonthCashflow({Key key, this.date, this.cashflow, this.budget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    int lastDay = DateTime(date.year, date.month + 1, 0).day;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Cashflow ${NumberFormat().format(cashflow)}',
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              '${AppLocalizations.of(context).titleBudget} ${NumberFormat().format(budget)}',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                LinearProgressIndicator(
                  value: budget == 0 ? 1 : cashflow / budget,
                ),
                Flex(
                  children: List<Widget>.generate(
                      lastDay,
                          (index) => Flexible(
                        child: Container(
                          height: 5.0,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: index == date.day -1
                                      ? Colors.black
                                      : Colors.black26)),
                        ),
                      )),
                  direction: Axis.horizontal,
                ),
              ],
            ),
            Align(
              alignment: Alignment((2 * date.day - lastDay - 1) / (lastDay - 1) ,0),
              child: Text('${date.day}'),
            ),
          ],
        ),      ],
    );
  }
}
