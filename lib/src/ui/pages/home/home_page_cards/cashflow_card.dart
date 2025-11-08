import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/blocs/category_cashflow_bloc.dart';
import 'package:money_tracker/src/ui/blocs/currency_rate_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class CashflowCard extends StatelessWidget {
  final CategoryType type;

  const CashflowCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              switch (type) {
                CategoryType.INPUT => context.loc.earningIn(DateTime.now()),
                CategoryType.OUTPUT => context.loc.spendingIn(DateTime.now()),
              },
              // style: TextStyle(fontWeight: FontWeight.bold),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Budget'), //TODO
                Text(context.loc
                    .numberFormat(context.budget(type), Currency.RUB)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cashflow'), //TODO
                Text(context.loc
                    .numberFormat(context.cashFlow(type), Currency.RUB)),
              ],
            ),
            Divider(),
            Text('Top of month', style: TextStyle(fontWeight: FontWeight.bold)),
            ...context.watchTop(type, BudgetType.MONTH, 3).map((e) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.categoryTitle),
                    Text(context.loc.numberFormat(
                        context.balanceToRub(e.monthCashFlow), Currency.RUB)),
                  ],
                )),
            Divider(),
            Text('Top of year', style: TextStyle(fontWeight: FontWeight.bold)),
            ...context.watchTop(type, BudgetType.YEAR, 3).map((e) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e.categoryTitle),
                    Text(context.loc.numberFormat(
                        context.balanceToRub(e.yearCashFlow), Currency.RUB)),
                  ],
                )),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => context.openCategoryListPage(type),
                  child: Text(context.loc.categories),
                ),
                TextButton(
                    onPressed: () => context.openBudgetPage(type),
                    child: Text('Details') //TODO
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
