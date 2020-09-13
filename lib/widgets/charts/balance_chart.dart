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
    DateTime(_now.month == 1 ? _now.year - 1 : _now.year,
        _now.month == 1 ? 12 : _now.month - 1),
    DateTime(_now.year, _now.month),
    DateTime(_now.month == 12 ? _now.year + 1 : _now.year,
        _now.month == 12 ? 1 : _now.month + 1),
  ];

  static List<BalanceOnDate> balance =
      dates.map((d) => BalanceOnDate(d, 0)).toList();
  static List<BalanceOnDate> budget = [balance[1], balance[2]];

  int budgetSum = 0;
  int startBalance = 0;
  List<BalanceOnDate> _balanceByPeriod = [];

  void calcBalance(){
    List<BalanceOnDate> balances = [];
    balances.add(BalanceOnDate(dates[0], startBalance));

    int currentBalance = startBalance;
    _balanceByPeriod.forEach((element) {
      currentBalance += element.sum;
      balances.add(BalanceOnDate(element.date, currentBalance));
    });

    setState(() {
      balance = balances;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Repository _repository = Provider.of<Repository>(context);

    _repository.watchBalanceOnPeriod(dates[0], dates[2]).listen((event) {
      _balanceByPeriod = event;
      calcBalance();
    });

    _repository.watchBalance(dates[0])
      ..listen((d) {
        startBalance = d.sum;
        calcBalance();
      });

    _repository.watchBalance(dates[1])
      ..listen((d) {
        setState(() {
          budget[0] = d;
          budget[1] = BalanceOnDate(dates[2], budget[0].sum + budgetSum);
        });
      });

    _repository.watchBudgetSum(dates[2])
      ..listen((d) {
        budgetSum = d;
        setState(() {
          budget[1] = BalanceOnDate(dates[2], budget[0].sum + budgetSum);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BalanceOnDate, DateTime>> balanceSeries = [
      charts.Series<BalanceOnDate, DateTime>(
        id: 'Balance',
        data: balance,
        domainFn: (BalanceOnDate datum, int index) => datum.date,
        measureFn: (BalanceOnDate datum, int index) => datum.sum,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      )
    ];

    List<charts.Series<BalanceOnDate, DateTime>> budgetSeries = [
      charts.Series<BalanceOnDate, DateTime>(
        id: 'Budget',
        data: budget,
        domainFn: (BalanceOnDate datum, int index) => datum.date,
        measureFn: (BalanceOnDate datum, int index) => datum.sum,
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
