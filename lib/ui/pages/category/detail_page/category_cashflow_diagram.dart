// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:provider/provider.dart';

class CategoryCashflowDiagram extends StatelessWidget {
  final int id;
  final int budget;
  final BudgetType budgetType;

  const CategoryCashflowDiagram(
      {Key? key,
      required this.id,
      required this.budget,
      required this.budgetType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SumOnDate>>(
      stream: budgetType == BudgetType.MONTH
          ? context
              .read<LocalSource>()
              .categories
              .watchCashflowByCategoryByMonth(id)
          : context
              .read<LocalSource>()
              .categories
              .watchCashflowByCategoryByYear(id),
      builder: (context, snapshot) {
        var data = <SumOnDate>[];
        if (snapshot.hasData) {
          data = snapshot.data!;
        } else {
          return SizedBox(
            height: 60.0,
            child: CircularProgressIndicator(),
          );
        }

        if (data.isEmpty) {
          return SizedBox(
            height: 60.0,
            child: Text('No data'),
          );
        }

        data.sort((s1, s2) =>
            s1.date.microsecondsSinceEpoch - s2.date.microsecondsSinceEpoch);

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          // child: SizedBox(
          //   width: data.length * 100,
          //   child: charts.BarChart(
          //     [
          //       charts.Series<SumOnDate, String>(
          //           id: 'Cashflow',
          //           colorFn: (_, __) =>
          //               charts.MaterialPalette.blue.shadeDefault,
          //           domainFn: (SumOnDate sales, _) => DateFormat.yMMM(
          //                   Localizations.localeOf(context).toString())
          //               .format(sales.date),
          //           measureFn: (SumOnDate sales, _) => sales.sum,
          //           data: data,
          //           labelAccessorFn: (SumOnDate sales, _) =>
          //               '${AppLocalizations.of(context).numberFormat(sales.sum)}')
          //     ],
          //     animate: false,
          //     primaryMeasureAxis:
          //         charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
          //     behaviors: [
          //       charts.RangeAnnotation(
          //         [
          //           charts.LineAnnotationSegment(
          //               budget, charts.RangeAnnotationAxisType.measure,
          //               //startLabel: 'budget',
          //               //endLabel: 'Measure 2 End',
          //               color: charts.MaterialPalette.gray.shade400),
          //         ],
          //       ),
          //     ],
          //     barRendererDecorator: charts.BarLabelDecorator<String>(),
          //     domainAxis: charts.OrdinalAxisSpec(),
          //   ),
          // ),
        );
      },
    );
  }
}
