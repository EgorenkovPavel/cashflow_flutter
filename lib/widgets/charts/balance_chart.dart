
import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/repository.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cashflow/utils/extensions.dart';

class BalanceChart extends StatefulWidget {
  @override
  _BalanceChartState createState() => _BalanceChartState();
}

class _BalanceChartState extends State<BalanceChart> {

  static DateTime _now = DateTime.now();


  static List<DateTime> dates = [
    DateTime(_now.month == 1 ? _now.year-1 : _now.year, _now.month == 1 ? 12 : _now.month-1),
    DateTime(_now.year, _now.month),
    DateTime(_now.month == 12 ? _now.year+1 : _now.year, _now.month == 12 ? 1 : _now.month+1),
  ];

  static List<MonthBalance> balance = dates.map((d) => MonthBalance(d, 0)).toList();
  static List<MonthBalance> budget = [balance[1], balance[2]];

  int budgetSum = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Repository _repository = Provider.of<Repository>(context);

    _repository.watchBalance(dates[0])
      ..listen((d) {
        setState(() {
          balance[0] = d;
        });
      });

    _repository.watchBalance(dates[1])
      ..listen((d) {
        setState(() {
          balance[1] = d;
          calcBudget();
        });
      });

    _repository.watchBalance(dates[2])
      ..listen((d) {
        setState(() {
          balance[2] = MonthBalance(_now, d.sum);
        });
      });

    _repository.watchBudgetSum(dates[2])..listen((d) {
      budgetSum = d;
      calcBudget();
    });
  }

  void calcBudget(){
    setState(() {
      budget[0] = balance[1];
      budget[1] = MonthBalance(dates[2], balance[1].sum + budgetSum);
    });
  }

  @override
  Widget build(BuildContext context) {

    List<charts.Series<MonthBalance, DateTime>> balanceSeries = [
      charts.Series<MonthBalance, DateTime>(
        id: 'Balance',
        data: balance,
        domainFn: (MonthBalance datum, int index) => datum.date,
        measureFn: (MonthBalance datum, int index) => datum.sum,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      )
    ];

    List<charts.Series<MonthBalance, DateTime>> budgetSeries = [
      charts.Series<MonthBalance, DateTime>(
        id: 'Budget',
        data: budget,
        domainFn: (MonthBalance datum, int index) => datum.date,
        measureFn: (MonthBalance datum, int index) => datum.sum,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        dashPatternFn: (_, __) => [4, 2],
      )
    ];

    return charts.TimeSeriesChart(balanceSeries..addAll(budgetSeries),
        animate: false,
        primaryMeasureAxis: new charts.NumericAxisSpec(
            tickProviderSpec:
            new charts.BasicNumericTickProviderSpec(zeroBound: false)),

        domainAxis: new charts.EndPointsTimeAxisSpec(
            showAxisLine: false,
            tickProviderSpec: StaticDateTimeTickProviderSpec(dates
                .map((d) => TickSpec<DateTime>(d,
                label: DateFormat.MMM(
                    Localizations.localeOf(context).languageCode)
                    .format(d)
                    .capitalize()))
                .toList())),
        behaviors: [
          new charts.RangeAnnotation(dates
              .map((d) => charts.LineAnnotationSegment(
              d, charts.RangeAnnotationAxisType.domain))
              .toList()),
        ]);
  }
}