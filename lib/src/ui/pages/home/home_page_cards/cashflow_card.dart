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
        padding: const .only(top: 16.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(switch (type) {
              .INPUT => context.loc.earningIn(DateTime.now()),
              .OUTPUT => context.loc.spendingIn(DateTime.now()),
            }, style: Theme.of(context).textTheme.titleLarge),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text('Budget'), //TODO loc
                Text(context.loc.numberFormat(context.budget(type), .RUB)),
              ],
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text('Cashflow'), //TODO loc
                Text(context.loc.numberFormat(context.cashFlow(type), .RUB)),
              ],
            ),
            Divider(),
            Text(
              'Top of month',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ...context
                .watchTop(type, BudgetType.MONTH, 3)
                .map(
                  (e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(e.categoryTitle),
                      Text(
                        context.loc.numberFormat(
                          context.balanceToRub(e.monthCashFlow),
                          .RUB,
                        ),
                      ),
                    ],
                  ),
                ),
            Divider(),
            Text('Top of year', style: Theme.of(context).textTheme.titleMedium),
            ...context
                .watchTop(type, BudgetType.YEAR, 3)
                .map(
                  (e) => Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(e.categoryTitle),
                      Text(
                        context.loc.numberFormat(
                          context.balanceToRub(e.yearCashFlow),
                          .RUB,
                        ),
                      ),
                    ],
                  ),
                ),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => context.openCategoryGroupsListPage(type),
                  child: Text(context.loc.categories),
                ),
                TextButton(
                  onPressed: () => context.openBudgetPage(type),
                  child: Text('Details'), //TODO
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
