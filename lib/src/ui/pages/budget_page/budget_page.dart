// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/blocs/category_cashflow_bloc.dart';
import 'package:money_tracker/src/ui/blocs/currency_rate_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../utils/balance.dart';
import '../../../utils/date_util.dart';
import '../../../utils/sum.dart';

class BudgetPage extends StatefulWidget {
  final CategoryType type;

  const BudgetPage({super.key, required this.type});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  BudgetType _budgetType = BudgetType.MONTH;

  @override
  Widget build(BuildContext context) {
    final list = switch (widget.type) {
      CategoryType.INPUT => context.watchInputCashFlow(),
      CategoryType.OUTPUT => context.watchOutputCashFlow(),
    };

    switch (_budgetType) {
      case BudgetType.MONTH:
        list.sort(
          (a, b) =>
              context.balanceToRub(b.monthCashFlow) -
              context.balanceToRub(a.monthCashFlow),
        );
      case BudgetType.YEAR:
        list.sort(
          (a, b) =>
              context.balanceToRub(b.yearCashFlow) -
              context.balanceToRub(a.yearCashFlow),
        );
    }

    final budget = switch (_budgetType) {
      BudgetType.MONTH =>
        list.fold(0, (prev, cashflow) => prev + cashflow.monthBudget),
      BudgetType.YEAR =>
        list.fold(0, (prev, cashflow) => prev + cashflow.yearBudget),
    };

    final cashflow = context.balanceToRub(switch (_budgetType) {
      BudgetType.MONTH =>
        list.fold(Balance(), (prev, cashflow) => prev + cashflow.monthCashFlow),
      BudgetType.YEAR =>
        list.fold(Balance(), (prev, cashflow) => prev + cashflow.yearCashFlow),
    });

    return Scaffold(
      appBar: AppBar(
        title: switch (widget.type) {
          CategoryType.INPUT => Text('Earning'), // TODO
          CategoryType.OUTPUT => Text('Spending'),
        },
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SegmentedButton<BudgetType>(
                  segments: [
                    ButtonSegment<BudgetType>(
                      value: BudgetType.MONTH,
                      label: Text('Month'), // TODO
                    ),
                    ButtonSegment<BudgetType>(
                      value: BudgetType.YEAR,
                      label: Text('Year'),
                    )
                  ],
                  selected: {_budgetType},
                  multiSelectionEnabled: false,
                  onSelectionChanged: (value) {
                    setState(() {
                      _budgetType = value.first;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Budget',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Cashflow',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.loc.sumFormat(Sum(budget, Currency.RUB))),
                    Text(context.loc.sumFormat(Sum(cashflow, Currency.RUB))),
                  ],
                ),
                switch (_budgetType) {
                  BudgetType.MONTH => Align(
                      alignment: Alignment(getMonthAlign() * 2 - 1, 0),
                      child: Text(DateFormat.d().format(DateTime.now())),
                    ),
                  BudgetType.YEAR => Align(
                      alignment: Alignment(getYearAlign() * 2 - 1, 0),
                      child: Text(DateFormat.MMM().format(DateTime.now())),
                    ),
                },
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
            children: list
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CashflowColumn(
                        categoryCashFlow: e,
                        budgetType: _budgetType,
                      ),
                    ))
                .toList()),
      ),
    );
  }
}

class CashflowColumn extends StatelessWidget {
  final CategoryCashFlow categoryCashFlow;
  final BudgetType budgetType;

  const CashflowColumn({
    super.key,
    required this.categoryCashFlow,
    required this.budgetType,
  });

  final double _heigth = 60;

  @override
  Widget build(BuildContext context) {
    final budget = switch (budgetType) {
      BudgetType.MONTH => categoryCashFlow.monthBudget,
      BudgetType.YEAR => categoryCashFlow.yearBudget,
    };

    final cashflow = context.balanceToRub(switch (budgetType) {
      BudgetType.MONTH => categoryCashFlow.monthCashFlow,
      BudgetType.YEAR => categoryCashFlow.yearCashFlow,
    });

    final alignment = switch (budgetType) {
      BudgetType.MONTH => getMonthAlign(),
      BudgetType.YEAR => getYearAlign(),
    };

    return SizedBox(
      height: _heigth,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryCashFlow.categoryTitle,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Stack(
                children: [
                  LinearProgressIndicator(
                    minHeight: 10,
                    color: Colors.amber,
                    backgroundColor: Colors.transparent,
                    value: _progress(cashflow, budget),
                  ),
                  LinearProgressIndicator(
                    minHeight: 10,
                    color: Theme.of(context).colorScheme.primary,
                    backgroundColor: Colors.transparent,
                    value: alignment < _progress(cashflow, budget)
                        ? alignment
                        : _progress(cashflow, budget),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.loc.numberFormat(budget, Currency.RUB)),
                  Text(context.loc.numberFormat(cashflow, Currency.RUB)),
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment(alignment * 2 - 1, 0.0),
            child: Container(
              color: Colors.grey,
              width: 1.0,
              height: _heigth,
            ),
          ),
        ],
      ),
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
}

double getMonthAlign() {
  var now = DateTime.now();
  var days = DateUtil.daysInMonth(now.month, now.year);

  return now.day / days;
}

double getYearAlign() {
  var now = DateTime.now();

  final firstDayOfYear = DateTime(now.year, 1, 1);

  final dayOfYear = now.difference(firstDayOfYear).inDays + 1;

  final yearDaysAmount =
      DateTime(now.year + 1, 1, 1).difference(firstDayOfYear).inDays;

  return dayOfYear / yearDaysAmount;
}
