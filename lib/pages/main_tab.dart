import 'dart:async';
import 'dart:math';

import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/pages/category_page.dart';
import 'package:cashflow/utils/app_localization.dart';
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
  List<bool> isExpanded = List.generate(3, (_) => false);

  List<AccountWithBalance> accounts = [];
  List<CategoryCashflowBudget> categoriesInput = [];
  List<CategoryCashflowBudget> categoriesOutput = [];

  StreamSubscription<List<AccountWithBalance>> subAccount;
  StreamSubscription<List<CategoryCashflowBudget>> subCategory;

  @override
  void initState() {
    super.initState();
    subAccount = Provider.of<Model>(context, listen: false)
        .watchAllAccountsWithBalance()
        .listen((list) {
      setState(() {
        accounts = list;
      });
    });
    subCategory = Provider.of<Model>(context, listen: false)
        .watchAllCategoryCashflowBudget(DateTime.now())
        .listen((list) {
      setState(() {
        categoriesInput = list
            .where((category) =>
        category.category.operationType == OperationType.INPUT)
            .toList();

        categoriesOutput = list
            .where((category) =>
        category.category.operationType == OperationType.OUTPUT)
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
    return SingleChildScrollView(
      child: Container(
        child: ExpansionPanelList(
          expansionCallback: (pos, isExp) {
            setState(() {
              isExpanded[pos] = !isExp;
            });
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    AppLocalizations
                        .of(context)
                        .titleTotalSum,
                    style: Theme
                        .of(context)
                        .textTheme
                        .title,
                  ),
                  trailing: Text(
                    accounts
                        .map((account) => account.sum)
                        .fold(0, (a, b) => a + b)
                        .toString(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline,
                  ),
                );
              },
              body: Column(
                children: accounts
                    .map((account) =>
                    ListTile(
                      title: Text(account.account.title),
                      trailing: Text(account.sum.toString()),
                    ))
                    .toList(),
              ),
              isExpanded: isExpanded[0],
              canTapOnHeader: true,
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                int totalBudget = categoriesInput
                    .map((category) => category.budget)
                    .fold(0, (a, b) => a + b);

                int totalCashflow = categoriesInput
                    .map((category) => category.cashflow)
                    .fold(0, (a, b) => a + b);

                if (isExpanded) {
                  return Container(
                      width: 140.0,
                      height: 140.0,
                      child: DonutAutoLabelChart(categoriesInput));
                } else {
                  return ListTile(
                    title: Text(AppLocalizations
                        .of(context)
                        .typeInput),
                    subtitle: Text(
                      '${AppLocalizations
                          .of(context)
                          .titleBudget} $totalBudget',
                      style: Theme
                          .of(context)
                          .textTheme
                          .caption,
                    ),
                    trailing: Text(
                      '$totalCashflow',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline,
                    ),
                  );
                }
              },
              body: Column(
                children: categoriesInput
                    .map((category) =>
                    Column(
                      children: <Widget>[
                        CategoryListItem(category),
                        Divider(),
                      ],
                    ))
                    .toList(),
              ),
              isExpanded: isExpanded[1],
              canTapOnHeader: true,
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                int totalBudget = categoriesOutput
                    .map((category) => category.budget)
                    .fold(0, (a, b) => a + b);

                int totalCashflow = categoriesOutput
                    .map((category) => category.cashflow)
                    .fold(0, (a, b) => a + b);

                if(isExpanded){
                  return Container(
                      width: 140.0,
                      height: 140.0,
                      child: DonutAutoLabelChart(categoriesOutput));
                }else {
                  return ListTile(
                    title: Text(AppLocalizations
                        .of(context)
                        .typeOutput),
                    subtitle: Text(
                      '${AppLocalizations
                          .of(context)
                          .titleBudget} $totalBudget',
                      style: Theme
                          .of(context)
                          .textTheme
                          .caption,
                    ),
                    trailing: Text(
                      '$totalCashflow',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline,
                    ),
                  );
                }
              },
              body: Column(
                children: categoriesOutput
                    .map((category) => CategoryListItem(category))
                    .toList(),
              ),
              isExpanded: isExpanded[2],
              canTapOnHeader: true,
            ),
          ],
        ),
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
      _progress = min(category.cashflow / category.budget, 1);
    }

    return ListTile(
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          CircularProgressIndicator(
            value: _progress,
            backgroundColor: Colors.black12,
          ),
          Text(
            '${_progress * 100}%',
            style: Theme
                .of(context)
                .textTheme
                .caption,
          ),
        ],
      ),
      title: Text(category.category.title),
      subtitle: Text(
        '${AppLocalizations
            .of(context)
            .titleBudget} ${category.budget}',
        style: Theme
            .of(context)
            .textTheme
            .caption,
      ),
      trailing: Text(category.cashflow.toString()),
      onTap: () {
        Navigator.of(context)
            .pushNamed(CategoryPage.routeName, arguments: category.category.id);
      },
    );
  }
}

class DonutAutoLabelChart extends StatelessWidget {

  final List<CategoryCashflowBudget> categories;
  final bool animate;

  DonutAutoLabelChart(this.categories, {this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
        [charts.Series<CategoryCashflowBudget, int>(
          id: 'Sales',
          data: categories.where((c) => c.cashflow > 0).toList(),
          measureFn: (CategoryCashflowBudget datum, int index)  => datum.cashflow,
          domainFn: (CategoryCashflowBudget datum, int index) => index,
          labelAccessorFn: (CategoryCashflowBudget row, _) => '${row.category.title} ${row.cashflow}',
        )],
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