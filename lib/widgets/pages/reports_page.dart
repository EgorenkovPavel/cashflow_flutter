import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportsPage extends StatelessWidget {
  static const routeName = '/reports';

  static void open(BuildContext context) {
    Navigator.of(context).pushNamed(ReportsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).titleReports),
      ),
      // body: StreamBuilder<List<CategoryCashflowBudget>>(
      //   stream: Provider.of<Repository>(context)
      //       .watchAllCategoryCashflowBudget(DateTime.now()),
      //   builder: (BuildContext context,
      //       AsyncSnapshot<List<CategoryCashflowBudget>> snapshot) {
      //     if (!snapshot.hasData) {
      //       return SizedBox();
      //     }
      //
      //     var categories = snapshot.data!
      //         .where((element) => element.budget > 0 || element.cashflow > 0)
      //         .toList();
      //     categories.sort((a,b) => b.cashflow.compareTo(a.cashflow));
      //
      //     return SingleChildScrollView(
      //         child: SizedBox(
      //             height: 50.0 * categories.length,
      //             child: MonthCashflowChartByCategories(categories)));
      //   },
      // ),
    );
  }
}

class MonthCashflowChartByCategories extends StatelessWidget {
  final List<CategoryCashflowBudget> categories;

  final bool animate;

  MonthCashflowChartByCategories(this.categories, {this.animate = false});

  @override
  Widget build(BuildContext context) {
    // return charts.BarChart(
    //   _seriesList(context),
    //   animate: animate,
    //   barGroupingType: charts.BarGroupingType.grouped,
    //   vertical: false,
    //   barRendererDecorator: charts.BarLabelDecorator<String>(),
    //   // Hide domain axis.
    //   // domainAxis:
    //   //  new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
    //   behaviors: [
    //     charts.SeriesLegend(
    //       position: charts.BehaviorPosition.bottom,
    //     )
    //   ],
    // );
    return SizedBox();
  }

  // List<charts.Series<Value, String>> _seriesList(BuildContext context) {
  //   final fact = categories.map((e) => Value(e.title, e.cashflow)).toList();
  //
  //   final budget = categories.map((e) => Value(e.title, e.budget)).toList();
  //
  //   return [
  //     charts.Series<Value, String>(
  //         id: AppLocalizations.of(context).titleFact,
  //         domainFn: (Value sales, _) => sales.title,
  //         measureFn: (Value sales, _) => sales.sum,
  //         data: fact,
  //         colorFn: (Value sales, _) =>
  //             charts.MaterialPalette.deepOrange.shadeDefault,
  //         // Set a label accessor to control the text of the bar label.
  //         labelAccessorFn: (Value sales, _) => '${sales.sum.toString()}'),
  //     charts.Series<Value, String>(
  //         id: AppLocalizations.of(context).titleBudget,
  //         domainFn: (Value sales, _) => sales.title,
  //         measureFn: (Value sales, _) => sales.sum,
  //         data: budget,
  //         colorFn: (Value sales, _) => charts.MaterialPalette.gray.shadeDefault,
  //         // Set a label accessor to control the text of the bar label.
  //         labelAccessorFn: (Value sales, _) => '${sales.sum.toString()}')
  //   ];
  // }
}

class Value {
  final String title;
  final int sum;

  Value(this.title, this.sum);
}
