import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/material.dart';

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
                                  color: index == date.day
                                      ? Colors.black
                                      : Colors.black26)),
                        ),
                      )),
              direction: Axis.horizontal,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Cashflow $cashflow',
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              '${AppLocalizations.of(context).titleBudget} $budget',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }
}
