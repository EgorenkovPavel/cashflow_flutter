import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/home/subtitle.dart';
import 'package:provider/provider.dart';

class BudgetSubtitle extends StatelessWidget {
  final OperationType type;

  const BudgetSubtitle({
    Key? key,
    required this.type,
  }) : super(key: key);

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
          .watchCashflowByType(DateTime.now(), type),
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
        return Subtitle(
          leading: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: type == OperationType.INPUT
                        ? 'Earning in '
                        : 'Spending in ',
                    style: Theme.of(context).textTheme.headline6),
                TextSpan(
                    text: DateFormat.MMMM().format(DateTime.now()),
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Theme.of(context).colorScheme.primary)),
              ],
            ),
          ),
          onPress: () => PageNavigator.openBudgetPage(context, type),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                NumberFormat().format(_cashflow),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 15,
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                    ),
              ),
              Text(
                'of ${NumberFormat().format(_budget)}',
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        );
      },
    );
  }
}
