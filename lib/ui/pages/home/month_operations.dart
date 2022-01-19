import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/local/local_source.dart';
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _MonthOperation(operationType: OperationType.INPUT),
                SizedBox(
                  width: Dimensions.padding,
                ),
                _MonthOperation(operationType: OperationType.OUTPUT),
              ],
            ),
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
          .read<LocalSource>()
          .categories
          .watchCashflowByType(DateTime.now(), operationType),
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

        return InkWell(
          onTap: () => PageNavigator.openBudgetPage(context, operationType),
          // child: Card(
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Column(
          //       children: [
          //         Text(
          //             operationType == OperationType.INPUT
          //                 ? AppLocalizations.of(context).earning
          //                 : AppLocalizations.of(context).spending,
          //             style: Theme.of(context).textTheme.headline6),
          //         SizedBox(
          //           height: 16,
          //         ),
          //         Stack(
          //           children: [
          //             AspectRatio(
          //               aspectRatio: 1,
          //               child: CircularProgressIndicator(
          //                 value: _progress,
          //                 strokeWidth: 10.0,
          //               ),
          //             ),
          //             AspectRatio(
          //               aspectRatio: 1,
          //               child: Center(
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Text(
          //                       AppLocalizations.of(context)
          //                           .numberFormat(_cashflow),
          //                       style: Theme.of(context)
          //                           .textTheme
          //                           .headline6!
          //                           .copyWith(
          //                             fontSize: 20,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                     ),
          //                     Text(
          //                       AppLocalizations.of(context)
          //                           .numberFormat(_budget),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          child: Container(
            padding: EdgeInsets.all(Dimensions.padding),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Text(
                    operationType == OperationType.INPUT
                        ? AppLocalizations.of(context).earning
                        : AppLocalizations.of(context).spending,
                    style: Theme.of(context).textTheme.headline6),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        child: LinearProgressIndicator(
                          minHeight: 10,
                          color: Theme.of(context).colorScheme.primary,
                          value: _progress,
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
                    )
                  ],
                ),
                Text(AppLocalizations.of(context).numberFormat(_cashflow)),
              ],
            ),
          ),
        );
      },
    );
  }

  double getAlign(){
    var now = DateTime.now();
    var days = daysInMonth(now.month, now.year);
    return now.day / days * 2 - 1;
  }

  int daysInMonth(final int monthNum, final int year) {
    List<int> monthLength = List.filled(12, 0);

    monthLength[0] = 31;
    monthLength[2] = 31;
    monthLength[4] = 31;
    monthLength[6] = 31;
    monthLength[7] = 31;
    monthLength[9] = 31;
    monthLength[11] = 31;
    monthLength[3] = 30;
    monthLength[8] = 30;
    monthLength[5] = 30;
    monthLength[10] = 30;

    if (leapYear(year) == true)
      monthLength[1] = 29;
    else
      monthLength[1] = 28;

    return monthLength[monthNum - 1];
  }

  bool leapYear(int year) {
    bool leapYear = false;

    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true)
      leapYear = false;
    else if (year % 4 == 0) leapYear = true;

    return leapYear;
  }
}
