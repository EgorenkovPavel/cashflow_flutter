import 'package:bloc/bloc.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/utils/extensions.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BalanceChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalanceChartBloc, BalanceChartState>(
      bloc: BalanceChartBloc(Provider.of<Repository>(context))..add(Fetch()),
      builder: (context, state) {
        if (state is BalanceChartState) {
          if (state.balance.isEmpty && state.budget.isEmpty) return SizedBox();
          var balanceSeries = <charts.Series<ValueOnDate, DateTime>>[
            charts.Series<ValueOnDate, DateTime>(
              id: 'Balance',
              data: state.balance,
              displayName: AppLocalizations.of(context).titleTotalBalance,
              domainFn: (ValueOnDate datum, int index) => datum.date,
              measureFn: (ValueOnDate datum, int index) => datum.value,
              colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
            )
          ];

          var budgetSeries = <charts.Series<ValueOnDate, DateTime>>[
            charts.Series<ValueOnDate, DateTime>(
              id: 'Budget',
              data: state.budget,
              displayName: AppLocalizations.of(context).titleBudget,
              domainFn: (ValueOnDate datum, int index) => datum.date,
              measureFn: (ValueOnDate datum, int index) => datum.value,
              colorFn: (_, __) =>
                  charts.MaterialPalette.deepOrange.shadeDefault,
              dashPatternFn: (_, __) => [4, 2],
            )
          ];

          return charts.TimeSeriesChart(balanceSeries..addAll(budgetSeries),
              animate: false,
              primaryMeasureAxis: charts.NumericAxisSpec(
                  tickProviderSpec: charts.BasicNumericTickProviderSpec(
                      zeroBound: false)),
              domainAxis: charts.EndPointsTimeAxisSpec(
                  showAxisLine: false,
                  tickProviderSpec: StaticDateTimeTickProviderSpec(state.dates
                      .map((d) => TickSpec<DateTime>(d,
                          label: DateFormat.MMM(
                                  Localizations.localeOf(context).languageCode)
                              .format(d)
                              .capitalize()))
                      .toList())),
              behaviors: [
                charts.RangeAnnotation(state.dates
                    .map((d) => charts.LineAnnotationSegment(
                        d, charts.RangeAnnotationAxisType.domain))
                    .toList()),
                charts.SeriesLegend(
                  position: charts.BehaviorPosition.bottom,
                )
              ]);
        } else {
          return SizedBox();
        }
      },
    );
  }
}

class BalanceChartState {
  final List<DateTime> dates;

  final List<ValueOnDate> balance;
  final List<ValueOnDate> budget;

  BalanceChartState(this.dates, this.balance, this.budget);
}

abstract class BalanceChartEvent {}

class Fetch extends BalanceChartEvent {}

class BalanceChartBloc extends Bloc<BalanceChartEvent, BalanceChartState> {
  final Repository _repository;

  List<DateTime> dates = [];
  List<ValueOnDate> balance = [];
  List<ValueOnDate> budget = [];

  int budgetSum = 0;
  int startBalance = 0;
  List<ValueOnDate> _balanceByPeriod = [];

  void calcBalance() {
    var balances = <ValueOnDate>[];
    balances.add(ValueOnDate(dates[0], startBalance));

    var currentBalance = startBalance;
    _balanceByPeriod.forEach((element) {
      currentBalance += element.value;
      balances.add(ValueOnDate(element.date, currentBalance));
    });

    balance = balances;

    add(Fetch());
  }

  DateTime lastMonth(DateTime date) {
    return DateTime(date.month == 1 ? date.year - 1 : date.year,
        date.month == 1 ? 12 : date.month - 1);
  }

  DateTime nextMonth(DateTime date) {
    return DateTime(date.month == 12 ? date.year + 1 : date.year,
        date.month == 12 ? 1 : date.month + 1);
  }

  BalanceChartBloc(this._repository) : super(BalanceChartState([], [], [])) {
    var _now = DateTime.now();

    dates = [
      lastMonth(_now),
      DateTime(_now.year, _now.month),
      nextMonth(_now),
    ];

    budget.add(ValueOnDate(dates[1], 0));
    budget.add(ValueOnDate(dates[2], 0));

    _repository.watchBalanceOnPeriod(dates[0], dates[2]).listen((event) {
      _balanceByPeriod = event.map((e) => ValueOnDate(e.date, e.sum)).toList();
      calcBalance();
    });

    _repository.watchBalance(dates[0])
      .listen((d) {
          startBalance = d.sum;
        add(Fetch());

        calcBalance();
      });

    _repository.watchBalance(dates[1])
      .listen((d) {
          budget[0] = ValueOnDate(d.date, d.sum);
          budget[1] = ValueOnDate(dates[2], budget[0].value + budgetSum);

        add(Fetch());
      });

    _repository.watchBudgetSum(dates[2])
      .listen((d) {
        budgetSum = d;
          budget[1] = ValueOnDate(dates[2], budget[0].value + budgetSum);

        add(Fetch());
      });
  }

  @override
  Stream<BalanceChartState> mapEventToState(BalanceChartEvent event) async* {
    if (event is Fetch) {
      yield BalanceChartState(dates, balance, budget);
    }
  }
}

class ValueOnDate {
  final int value;
  final DateTime date;

  ValueOnDate(this.date, this.value);
}
