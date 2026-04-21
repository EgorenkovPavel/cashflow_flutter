// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/blocs/category_cashflow_bloc.dart';
import 'package:money_tracker/src/ui/blocs/currency_rate_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../utils/date_util.dart';

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
    final list = context.watchCashFlow(widget.type);

    list.sort(
      (a, b) =>
          context.balanceToRub(b.cashflowByType(_budgetType)).sum -
          context.balanceToRub(a.cashflowByType(_budgetType)).sum,
    );

    final budget = Money(
      list.map((e) => e.budgetByType(_budgetType)).fold(0, (a, b) => a + b),
      .RUB,
    );

    final cashflow = context.balanceToRub(
      list
          .map((e) => e.cashflowByType(_budgetType))
          .fold(Balance(), (a, b) => a + b),
    );

    return Scaffold(
      appBar: AppBar(
        title: switch (widget.type) {
          CategoryType.INPUT => Text(context.loc.earning),
          CategoryType.OUTPUT => Text(context.loc.spending),
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
                      label: Text(context.loc.budgetTypeMonth),
                    ),
                    ButtonSegment<BudgetType>(
                      value: BudgetType.YEAR,
                      label: Text(context.loc.budgetTypeYear),
                    ),
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
                      context.loc.titleBudget,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      context.loc.titleCashflow,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.loc.sumFormat(budget)),
                    Text(context.loc.sumFormat(cashflow)),
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
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CashflowColumn(
                    categoryCashFlow: e,
                    budgetType: _budgetType,
                  ),
                ),
              )
              .toList(),
        ),
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
    final budget = categoryCashFlow.budgetByType(budgetType);

    final cashflow = context
        .balanceToRub(categoryCashFlow.cashflowByType(budgetType))
        .sum;

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
              ),
            ],
          ),
          Align(
            alignment: Alignment(alignment * 2 - 1, 0.0),
            child: Container(color: Colors.grey, width: 1.0, height: _heigth),
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

  final yearDaysAmount = DateTime(
    now.year + 1,
    1,
    1,
  ).difference(firstDayOfYear).inDays;

  return dayOfYear / yearDaysAmount;
}
