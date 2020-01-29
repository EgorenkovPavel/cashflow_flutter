import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/pages/budget_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MainTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        StreamBuilder<List<MonthBudget>>(
            stream: Provider.of<Model>(context).watchMonthBudget(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data.isEmpty) {
                return SizedBox();
              }

              List<MonthBudget> budgets = snapshot.data;

              return SizedBox(
                height: 100.0,
                child: PageView(
                  children: budgets.map((t) {
                    DateTime date = t.date;

                    return GestureDetector(
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(DateFormat.yMMMM(Localizations.localeOf(context).languageCode).format(date),),
                            Text('${t.sum}'),
                          ],
                        ),
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed(BudgetPage.routeName,
                            arguments: {'date': t.date});
                      },
                    );
                  }).toList(),
                  scrollDirection: Axis.horizontal,
                ),
              );
            }),
        RaisedButton(
          child: Text('Add budget'),
          onPressed: () {
            Provider.of<Model>(context, listen: false).insertBudget(
                BudgetData(date: DateTime(2020, 2), category: 1, sum: 100));
          },
        )
      ],
    );
  }
}
