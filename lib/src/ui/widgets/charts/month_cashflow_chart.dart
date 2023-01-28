import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/models/category/category_cashflow.dart';

class MonthCashflowChart extends StatelessWidget {
  final List<CategoryCashflow> categoriesInput;
  final List<CategoryCashflow> categoriesOutput;

  final bool? animate;

  const MonthCashflowChart(
    this.categoriesInput,
    this.categoriesOutput, {
    this.animate,
    Key? key,
  }) : super(key: key);

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
    return const SizedBox();
  }

// int _cashflow(List<CategoryCashflowBudget> categories) {
//   return categories
//       .map((category) => category.cashflow)
//       .fold(0, (a, b) => a + b);
// }
//
// int _budget(List<CategoryCashflowBudget> categories) {
//   return categories
//       .map((category) => category.budget)
//       .fold(0, (a, b) => a + b);
// }

// List<charts.Series<Value, String>> _seriesList(BuildContext context) {
//   final fact = [
//     Value(getOperationTitle(context, OperationType.INPUT),
//         _cashflow(categoriesInput)),
//     Value(getOperationTitle(context, OperationType.OUTPUT),
//         _cashflow(categoriesOutput)),
//   ];
//
//   final budget = [
//     Value(getOperationTitle(context, OperationType.INPUT),
//         _budget(categoriesInput)),
//     Value(getOperationTitle(context, OperationType.OUTPUT),
//         _budget(categoriesOutput)),
//   ];
//
//   return [
//     charts.Series<Value, String>(
//         id: AppLocalizations.of(context).titleFact,
//         domainFn: (Value sales, _) => sales.title,
//         measureFn: (Value sales, _) => sales.sum,
//         data: fact,
//         colorFn: (Value sales, _) =>
//         charts.MaterialPalette.deepOrange.shadeDefault,
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
