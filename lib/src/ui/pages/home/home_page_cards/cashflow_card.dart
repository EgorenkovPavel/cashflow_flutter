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
            TopCategories(type: type, budgetType: BudgetType.MONTH),
            TopCategories(type: type, budgetType: BudgetType.YEAR),
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

class TopCategories extends StatelessWidget {
  final CategoryType type;
  final BudgetType budgetType;

  const TopCategories({
    super.key,
    required this.type,
    required this.budgetType,
  });

  @override
  Widget build(BuildContext context) {
    final items = context.watchTop(type, budgetType, 3);

    if (items.isEmpty) {
      return SizedBox();
    }

    return Column(
      crossAxisAlignment: .start,
      children: [
        Divider(),
        Text(switch (budgetType) {
          BudgetType.MONTH => 'Top of month', // TODO loc
          BudgetType.YEAR => 'Top of year',
        }, style: Theme.of(context).textTheme.titleMedium),
        ...items.map(
          (e) => Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(e.categoryTitle),
              Text(context.loc.sumFormat(context.balanceToRub(e.yearCashFlow))),
            ],
          ),
        ),
      ],
    );
  }
}
