import 'dart:async';
import 'dart:math';

import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/month_cashflow.dart';
import 'package:cashflow/widgets/pages/category_page.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TestWidget();
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({
    Key key,
  }) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  List<AccountBalance> accounts = [];
  List<CategoryCashflowBudget> categoriesInput = [];
  List<CategoryCashflowBudget> categoriesOutput = [];

  StreamSubscription<List<AccountBalance>> subAccount;
  StreamSubscription<List<CategoryCashflowBudget>> subCategory;

  @override
  void initState() {
    super.initState();
    subAccount = Provider.of<Repository>(context, listen: false)
        .watchAllAccountsBalance()
        .listen((list) {
      setState(() {
        accounts = list;
      });
    });
    subCategory = Provider.of<Repository>(context, listen: false)
        .watchAllCategoryCashflowBudget(DateTime.now())
        .listen((list) {
      setState(() {
        categoriesInput = list
            .where((category) => category.type == OperationType.INPUT)
            .toList();

        categoriesOutput = list
            .where((category) => category.type == OperationType.OUTPUT)
            .toList();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    subAccount.cancel();
    subCategory.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              cardTitle('Total balance'),
              Container(
                height: 200.0,
                alignment: Alignment.center,
                color: Colors.grey,
                child: Text('Here will be a chart'),
              ),
              ExpansionTile(
                title: Text(accounts
                    .map((account) => account.balance)
                    .fold(0, (a, b) => a + b)
                    .toString()),
                children: accounts
                    .map((account) => Column(
                          children: <Widget>[
                            Divider(),
                            ListTile(
                              title: Text(account.title),
                              trailing: Text(account.balance.toString()),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              cardTitle('Cashflow'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MonthCashflow(date: DateTime.now(), cashflow: 15000, budget: 20000,),
              ),
              CardRow(
                  type: OperationType.INPUT,
                  cashflow: categoriesInput
                      .map((category) => category.cashflow)
                      .fold(0, (a, b) => a + b),
                  budget: categoriesInput
                      .map((category) => category.budget)
                      .fold(0, (a, b) => a + b),
              ),
              CardRow(
                  type: OperationType.OUTPUT,
                cashflow: categoriesOutput
                    .map((category) => category.cashflow)
                    .fold(0, (a, b) => a + b),
                budget: categoriesOutput
                    .map((category) => category.budget)
                    .fold(0, (a, b) => a + b),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              cardTitle('Last operations'),
              ListTile(
                title: Text('Account'),
                subtitle: Text('Category'),
                trailing: Text('2000'),
              ),
              CardButton(
                leading: Text('Show all'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget cardTitle(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline,
      ),
    );
  }

}

class CardRow extends StatelessWidget {
  final OperationType type;
  final int cashflow;
  final int budget;

  const CardRow({this.type, this.cashflow, this.budget});

  @override
  Widget build(BuildContext context) {
    return CardButton(
      leading: Text(getOperationTitle(context, type)),
      trailing: RichText(
        text: TextSpan(
            text: '$cashflow',
            style: DefaultTextStyle.of(context)
                .style
                .copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: '/$budget',
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(fontSize: 12)),
            ]),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final Widget leading;
  final Widget trailing;

  const CardButton({this.leading, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          leading ?? SizedBox(),
          Row(
            children: <Widget>[
              trailing ?? SizedBox(),
              Icon(Icons.keyboard_arrow_right),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  final CategoryCashflowBudget category;

  const CategoryListItem(this.category, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _progress = 0.0;
    if (category.budget == 0) {
      _progress = 0.0;
    } else {
      _progress = category.cashflow / category.budget;
    }

    return ListTile(
      leading: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          CircularProgressIndicator(
            value: min(_progress, 1),
            valueColor: AlwaysStoppedAnimation(_progress < 1
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor),
            backgroundColor: Colors.black12,
          ),
          Text(
            '${(_progress * 100).round()}%',
            style: _progress < 1
                ? Theme.of(context).textTheme.caption
                : Theme.of(context).textTheme.subtitle,
          ),
        ],
      ),
      title: Text(category.title),
      subtitle: Text(
        '${AppLocalizations.of(context).titleBudget} ${category.budget}',
        style: Theme.of(context).textTheme.caption,
      ),
      trailing: Text(category.cashflow.toString()),
      onTap: () {
        CategoryPage.open(context, category.id);
      },
    );
  }
}

class DonutAutoLabelChart extends StatelessWidget {
  final List<CategoryCashflowBudgetEntity> categories;
  final bool animate;

  DonutAutoLabelChart(this.categories, {this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
      [
        charts.Series<CategoryCashflowBudgetEntity, int>(
          id: 'Sales',
          data: categories.where((c) => c.cashflow > 0).toList(),
          measureFn: (CategoryCashflowBudgetEntity datum, int index) =>
              datum.cashflow,
          domainFn: (CategoryCashflowBudgetEntity datum, int index) => index,
          labelAccessorFn: (CategoryCashflowBudgetEntity row, _) =>
              '${row.category.title} ${row.cashflow}',
        )
      ],
      animate: animate,
      defaultRenderer: new charts.ArcRendererConfig(
          arcWidth: 60,
          arcRendererDecorators: [new charts.ArcLabelDecorator()]),
      behaviors: [
        new charts.DatumLegend(
          // Positions for "start" and "end" will be left and right respectively
          // for widgets with a build context that has directionality ltr.
          // For rtl, "start" and "end" will be right and left respectively.
          // Since this example has directionality of ltr, the legend is
          // positioned on the right side of the chart.
          position: charts.BehaviorPosition.end,
          // By default, if the position of the chart is on the left or right of
          // the chart, [horizontalFirst] is set to false. This means that the
          // legend entries will grow as new rows first instead of a new column.
          horizontalFirst: false,
          // This defines the padding around each legend entry.
          cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
          // Set [showMeasures] to true to display measures in series legend.
          showMeasures: true,
          // Configure the measure value to be shown by default in the legend.
          legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
          // Optionally provide a measure formatter to format the measure value.
          // If none is specified the value is formatted as a decimal.
          measureFormatter: (num value) {
            return value == null ? '-' : '${value}k';
          },
        ),
      ],
    );
  }
}
