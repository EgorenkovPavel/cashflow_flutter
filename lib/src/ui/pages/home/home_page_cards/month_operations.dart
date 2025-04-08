import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/view_models.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/blocs/category_cashflow_bloc.dart';
import 'package:money_tracker/src/utils/date_util.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class MonthOperations extends StatelessWidget {
  final CategoryType type;

  const MonthOperations({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              type == CategoryType.INPUT
                  ? context.loc.earningIn(DateTime.now())
                  : context.loc.spendingIn(DateTime.now()),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            // title: RichText(
            //   text: TextSpan(
            //     children: [
            //       TextSpan(
            //         text:
            //             '${operationType == OperationType.INPUT ? context.loc.earningIn : context.loc.spendingIn} ',
            //         style: Theme.of(context).textTheme.titleLarge,
            //       ),
            //       TextSpan(
            //         text: DateFormat.MMMM(
            //           Localizations.localeOf(context).toString(),
            //         ).format(DateTime.now()),
            //         style: Theme.of(context).textTheme.titleLarge!.copyWith(
            //               color: Theme.of(context).colorScheme.primary,
            //             ),
            //       ),
            //     ],
            //   ),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _MonthOperationDiagram(
              cashFlow: context.cashFlow(type),
              budget: context.budget(type),
            ),
          ),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => context.openCategoryListPage(type),
                child: Text(context.loc.categories),
              ),
              TextButton(
                onPressed: () => context.openBudgetPage(type),
                child: Text(context.loc.details),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MonthOperationDiagram extends StatelessWidget {
  final int cashFlow;
  final int budget;

  const _MonthOperationDiagram({
    required this.cashFlow,
    required this.budget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: LinearProgressIndicator(
                  minHeight: 10,
                  color: Theme.of(context).colorScheme.primary,
                  value: _progress(cashFlow, budget),
                ),
              ),
            ),
            Align(
              alignment: Alignment(getAlign(), 0.0),
              child: Container(
                color: Colors.black,
                width: 2.0,
                height: 32.0,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(context.loc.numberFormat(cashFlow, Currency.RUB)),
            Text(context.loc.numberFormat(budget, Currency.RUB)),
          ],
        ),
      ],
    );
  }

  double _progress(int cashFlow, int budget) {
    var progress = 0.0;
    if (cashFlow == 0) {
      progress = 0;
    } else if (cashFlow > budget || budget == 0) {
      progress = 1;
    } else {
      progress = cashFlow / budget;
    }

    return progress;
  }

  double getAlign() {
    var now = DateTime.now();
    var days = DateUtil.daysInMonth(now.month, now.year);

    return now.day / days * 2 - 1;
  }
}
