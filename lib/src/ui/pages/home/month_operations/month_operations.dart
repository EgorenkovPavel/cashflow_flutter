import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/blocs/category_cashflow_bloc.dart';
import 'package:money_tracker/src/utils/date_util.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../../domain/models/enum/currency.dart';

class MonthOperations extends StatelessWidget {
  final OperationType operationType;

  const MonthOperations({
    super.key,
    required this.operationType,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        '${operationType == OperationType.INPUT ? context.loc.earningIn : context.loc.spendingIn} ',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextSpan(
                    text: DateFormat.MMMM(
                      Localizations.localeOf(context).toString(),
                    ).format(DateTime.now()),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: context
                .select<CategoryCashflowBloc,
                        Map<Currency, ({int cashflow, int budget})>>(
                    (bloc) => bloc.state.progress[operationType] ?? {})
                .entries
                .where((entry) => entry.value.cashflow > 0)
                .map((entry) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _MonthOperationDiagram(
                        currency: entry.key,
                        cashflow: entry.value.cashflow,
                        budget: entry.value.budget,
                      ),
                    ))
                .toList(),
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () => context.openBudgetPage(operationType),
                child: const Text('Details'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MonthOperationDiagram extends StatelessWidget {
  final Currency currency;
  final int cashflow;
  final int budget;

  const _MonthOperationDiagram({
    super.key,
    required this.currency,
    required this.cashflow,
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
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: LinearProgressIndicator(
                  minHeight: 10,
                  color: Theme.of(context).colorScheme.primary,
                  value: context.select<CategoryCashflowBloc, double>(
                    (bloc) => _progress(
                      cashflow,
                      budget,
                    ),
                  ),
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
            Text(context.loc.numberFormat(cashflow, currency)),
            Text(context.loc.numberFormat(budget, currency)),
          ],
        ),
      ],
    );
  }

  double _progress(int cashflow, int budget) {
    var progress = 0.0;
    if (cashflow == 0) {
      progress = 0;
    } else if (cashflow > budget || budget == 0) {
      progress = 1;
    } else {
      progress = cashflow / budget;
    }

    return progress;
  }

  double getAlign() {
    var now = DateTime.now();
    var days = DateUtil.daysInMonth(now.month, now.year);

    return now.day / days * 2 - 1;
  }
}
