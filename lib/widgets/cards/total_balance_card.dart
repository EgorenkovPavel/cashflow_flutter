import 'package:bloc/bloc.dart';
import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/item_cards/account_card.dart';
import 'package:cashflow/widgets/pages/account_page.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cashflow/utils/extensions.dart';
import 'package:provider/provider.dart';

class TotalBalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TotalBalanceBloc>(context).add(Fetch());
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: BlocBuilder<TotalBalanceBloc, TotalBalanceState>(
        builder: (BuildContext context, TotalBalanceState state) {
          if (state is Empty) {
            return emptyBody(context);
          } else if (state is Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is Success) {
            return filledBody(context, state.totalBalance, state.accounts);
          } else {
            throw Exception(state.toString());
          }
        },
      ),
    );
  }

  Widget filledBody(
      BuildContext context, int totalBalance, List<AccountBalance> accounts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CardTitle(AppLocalizations.of(context).titleTotalBalance),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            height: 200.0,
            alignment: Alignment.center,
            //color: Colors.grey,
            child: BalanceChart(), //Text('Here will be a chart'),
          ),
        ),
        ExpansionTile(
          title: Text(NumberFormat().format(totalBalance),
              style: Theme.of(context).textTheme.title),
          children: accounts
              .map<Widget>((account) => Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                        title: Text(account.title),
                        trailing: Text(
                          NumberFormat().format(account.balance),
                          style: Theme.of(context).textTheme.title,
                        ),
                        onTap: () => AccountPage.open(context, account.id),
                      ),
                    ],
                  ))
              .toList()
                ..add(addButton(context)),
        ),
      ],
    );
  }

  Widget addButton(BuildContext context) {
    return Align(
      child: FlatButton(
        child: Text(AppLocalizations.of(context).btnAddAccount),
        onPressed: () {
          AccountCard.open(context);
        },
      ),
    );
  }

  Widget emptyBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CardTitle(AppLocalizations.of(context).accounts),
        Align(
            child: Text(AppLocalizations.of(context).noAccounts,
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(color: Colors.black38))),
        addButton(context),
      ],
    );
  }
}

abstract class TotalBalanceEvent {}

class Fetch extends TotalBalanceEvent {}

abstract class TotalBalanceState {}

class Empty extends TotalBalanceState {}

class Loading extends TotalBalanceState {}

class Success extends TotalBalanceState {
  final int totalBalance;
  final List<AccountBalance> accounts;

  Success({this.totalBalance, this.accounts});
}

class TotalBalanceBloc extends Bloc<TotalBalanceEvent, TotalBalanceState> {
  final Repository _repository;

  TotalBalanceBloc(this._repository) : super(Loading());

  @override
  TotalBalanceState get initialState => Loading();

  @override
  Stream<TotalBalanceState> mapEventToState(TotalBalanceEvent event) async* {
    yield Loading();

    await for (List<AccountBalance> accounts
        in _repository.watchAllAccountsBalance()) {
      if (accounts.isEmpty) {
        yield Empty();
      } else {
        int _totalBalance =
            accounts.map((account) => account.balance).fold(0, (a, b) => a + b);

        yield Success(totalBalance: _totalBalance, accounts: accounts);
      }
    }
    ;
  }
}

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
