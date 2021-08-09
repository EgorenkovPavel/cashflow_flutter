import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/themes.dart';
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
                      text: 'Operations in ',
                      style: Theme.of(context).textTheme.headline6),
                  TextSpan(
                      text: DateFormat.MMMM().format(DateTime.now()),
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Theme.of(context).primaryColor)),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: Dimensions.padding,),
              _MonthOperation(operationType: OperationType.INPUT),
              SizedBox(width: Dimensions.padding,),
              _MonthOperation(operationType: OperationType.OUTPUT),
              SizedBox(width: Dimensions.padding,),
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

        return Expanded(
          child: InkWell(
            onTap: () => PageNavigator.openBudgetPage(context, operationType),
            child: Container(
              padding: EdgeInsets.all(Dimensions.padding),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Text(
                      operationType == OperationType.INPUT
                          ? 'Earning'
                          : 'Spending',
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(
                    height: 8.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: NumberFormat().format(_cashflow),
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontSize: 15,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.8),
                                  ),
                        ),
                        TextSpan(
                          text: ' of ${NumberFormat().format(_budget)}',
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
