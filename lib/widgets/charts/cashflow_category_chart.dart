import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class CashflowCategoryChart extends StatelessWidget {
  final List<CategoryCashflowBudget> categories;

  const CashflowCategoryChart({Key key, this.categories}) : super(key: key);

  List<charts.Series<CategoryCashflowBudget, int>> getSeries(List<CategoryCashflowBudget> _categories) {
    return [
      charts.Series<CategoryCashflowBudget, int>(
        id: 'Categories',
        measureFn: (CategoryCashflowBudget datum, int index) => datum.cashflow,
        domainFn: (CategoryCashflowBudget datum, int index) => datum.id,
        data: _categories,
        labelAccessorFn: (CategoryCashflowBudget datum, int index) =>
            '${datum.title} ${datum.cashflow}',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryCashflowBudget> cat = categories.where((c) => c.cashflow > 0).toList();
    if(cat.isEmpty){
      return Center(
        child: Text('No data'),
      );
    }else {
      return charts.PieChart(getSeries(cat),
          defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
            new charts.ArcLabelDecorator(
                labelPosition: charts.ArcLabelPosition.auto)
          ]),
      );
    }
  }
}
