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
                        '${operationType == OperationType.INPUT ? context.loc.earning : context.loc.spending} in ',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _MonthOperation(operationType: operationType),
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

class _MonthOperation extends StatelessWidget {
  final OperationType operationType;

  const _MonthOperation({super.key, required this.operationType});

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
                      bloc.state.categories
                          .where((category) =>
                              category.category.operationType == operationType)
                          .map((category) => category.monthCashflow)
                          .fold(
                            0,
                            (previousValue, element) => previousValue + element,
                          ),
                      bloc.state.categories
                          .where((category) =>
                              category.category.operationType == operationType)
                          .map((category) => category.category.budget)
                          .fold(
                            0,
                            (previousValue, element) => previousValue + element,
                          ),
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
            Text(context.loc.numberFormat(
              // context.select<CategoryCashflowBloc, int>(
              //   (bloc) => bloc.state.categories
              //       .where((category) =>
              //           category.category.operationType == operationType)
              //       .map((category) => category.monthCashflow)
              //       .fold(
              //         0,
              //         (previousValue, element) => previousValue + element,
              //       ),
              // ),
              0,
              Currency.RUB,
            )),
            Text(context.loc.numberFormat(
              // _calcBudget(
              //   context.select<CategoryCashflowBloc, List<CategoryCashflow>>(
              //       (bloc) => bloc.state.categories
              //           .where((category) =>
              //               category.category.operationType == operationType)
              //           .toList()),
              // ),
              0,
              Currency.RUB,
            )),
          ],
        ),
      ],
    );
  }

  int _calcBudget(List<CategoryCashflow> list) {
    return list
            .where((element) => element.category.budgetType == BudgetType.MONTH)
            .fold<int>(
              0,
              (previousValue, element) =>
                  previousValue + element.category.budget,
            ) +
        list
            .where((element) => element.category.budgetType == BudgetType.YEAR)
            .fold<int>(
              0,
              (previousValue, element) =>
                  previousValue + (element.category.budget / 12).floor(),
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
