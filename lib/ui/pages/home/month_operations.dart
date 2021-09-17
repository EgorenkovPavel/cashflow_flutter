import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/themes.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:provider/provider.dart';

class MonthOperations extends StatelessWidget {
  const MonthOperations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: '${AppLocalizations.of(context).operationsIn} ',
                      style: Theme.of(context).textTheme.headline6),
                  TextSpan(
                      text: DateFormat.MMMM(
                              Localizations.localeOf(context).toString())
                          .format(DateTime.now()),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Theme.of(context).colorScheme.primary)),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: Dimensions.padding,
              ),
              _MonthOperation(operationType: OperationType.INPUT),
              SizedBox(
                width: Dimensions.padding,
              ),
              _MonthOperation(operationType: OperationType.OUTPUT),
              SizedBox(
                width: Dimensions.padding,
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

  const _MonthOperation({Key? key, required this.operationType})
      : super(key: key);

  int _calcCashflow(List<CategoryCashflow> list) {
    return list.fold(
        0, (previousValue, element) => previousValue + element.monthCashflow);
  }

  int _calcBudget(List<CategoryCashflow> list) {
    return list
            .where((element) => element.category.budgetType == BudgetType.MONTH)
            .fold<int>(
                0,
                (previousValue, element) =>
                    previousValue + element.category.budget) +
        list
            .where((element) => element.category.budgetType == BudgetType.YEAR)
            .fold<int>(
                0,
                (previousValue, element) =>
                    previousValue + (element.category.budget / 12).floor());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CategoryCashflow>>(
      stream: context
          .read<Repository>()
          .watchCategoryCashflowByType(DateTime.now(), operationType),
      builder: (context, snapshot) {
        var _cashflow = 0;
        var _budget = 0;
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.hasData) {
          _cashflow = _calcCashflow(snapshot.data!);
          _budget = _calcBudget(snapshot.data!);
        }

        var _progress = 0.0;
        if (_cashflow == 0) {
          _progress = 0;
        } else if (_cashflow > _budget || _budget == 0) {
          _progress = 1;
        } else {
          _progress = _cashflow / _budget;
        }

        return Expanded(
          child: InkWell(
            onTap: () => PageNavigator.openBudgetPage(context, operationType),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                        operationType == OperationType.INPUT
                            ? AppLocalizations.of(context).earning
                            : AppLocalizations.of(context).spending,
                        style: Theme.of(context).textTheme.headline6),
                    SizedBox(
                      height: 16,
                    ),
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: CircularProgressIndicator(
                            value: _progress,
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 1,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)
                                      .numberFormat(_cashflow),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  AppLocalizations.of(context)
                                      .numberFormat(_budget),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // child: Container(
            //   padding: EdgeInsets.all(Dimensions.padding),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Theme.of(context).colorScheme.primary),
            //     borderRadius: BorderRadius.circular(8.0),
            //   ),
            //   child: Column(
            //     children: [
            //       Text(
            //           operationType == OperationType.INPUT
            //               ? AppLocalizations.of(context).earning
            //               : AppLocalizations.of(context).spending,
            //           style: Theme.of(context).textTheme.headline6),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 8.0),
            //         child: LinearProgressIndicator(
            //           minHeight: 10,
            //           color: Theme.of(context).colorScheme.secondary,
            //           value: _progress,
            //         ),
            //       ),
            //       Text(AppLocalizations.of(context).numberFormat(_cashflow)),
            //     ],
            //   ),
            // ),
          ),
        );
      },
    );
  }
}
