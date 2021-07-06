import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/repository.dart';
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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CategoryCashflow>>(
      stream: context.read<Repository>().watchCategoryCashflowByType(DateTime.now(), type),
      builder: (context, snapshot) {
        var _cashflow = 0;
        var _budget = 0;
        if (snapshot.hasError){
          print(snapshot.error);
        }
        if(snapshot.hasData){
          _cashflow = snapshot.data!.fold(0, (previousValue, element) => previousValue + element.cashflow);
          _budget = snapshot.data!.fold(0, (previousValue, element) => previousValue + element.category.budget);
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
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Theme.of(context).primaryColor)),
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
      }
    );
  }
}
