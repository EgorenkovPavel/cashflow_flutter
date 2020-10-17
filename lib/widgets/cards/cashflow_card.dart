import 'package:bloc/bloc.dart';
import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/pages/category/category_list_page.dart';
import 'package:cashflow/widgets/pages/reports_page.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CashflowCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CashflowCardBloc>(context)..add(Fetch());
    return BlocBuilder<CashflowCardBloc, CashflowCardState>(
      builder: (BuildContext context, CashflowCardState state) {
        if (state is Empty) {
          return successState(context, [], []);
        } else if (state is Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Success) {
          return successState(
              context, state.categoriesInput, state.categoriesOutput);
         } else {
          return SizedBox();
        }
      },
    );
  }

  Column successState(
      BuildContext context,
      List<CategoryCashflowBudget> categoriesInput,
      List<CategoryCashflowBudget> categoriesOutput) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CardTitle(AppLocalizations.of(context).titleCashflow),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: categoriesInput.isEmpty && categoriesOutput.isEmpty ?
          ListTile(
            title: Text(AppLocalizations.of(context).noCategories,
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(color: Colors.black38)),
          )
           :SizedBox(
            child: HorizontalBarLabelChart(categoriesInput, categoriesOutput),
            height: 200,
          ),
        ),
         ButtonBar(
          children: [
            FlatButton(
              child: Text(
                AppLocalizations.of(context).btnShowReports.toUpperCase(),
                style: DefaultTextStyle.of(context).style.copyWith(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                ReportsPage.open(context);
              },
            ),
            FlatButton(
              child: Text(
                AppLocalizations.of(context).categories.toUpperCase(),
                style: DefaultTextStyle.of(context).style.copyWith(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                CategoryListPage.open(context);
              },
            )
          ],
        )
      ],
    );
  }
}

class HorizontalBarLabelChart extends StatelessWidget {
  final List<CategoryCashflowBudget> categoriesInput;
  final List<CategoryCashflowBudget> categoriesOutput;

  final bool animate;

  HorizontalBarLabelChart(this.categoriesInput, this.categoriesOutput,
      {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      _seriesList(context),
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
      vertical: false,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      // Hide domain axis.
      // domainAxis:
      //  new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
      behaviors: [
        new charts.SeriesLegend(
          position: charts.BehaviorPosition.bottom,
        )
      ],
    );
  }

  int _cashflow(List<CategoryCashflowBudget> categories) {
    return categories
        .map((category) => category.cashflow)
        .fold(0, (a, b) => a + b);
  }

  int _budget(List<CategoryCashflowBudget> categories) {
    return categories
        .map((category) => category.budget)
        .fold(0, (a, b) => a + b);
  }

  List<charts.Series<Value, String>> _seriesList(BuildContext context) {
    final fact = [
      Value(getOperationTitle(context, OperationType.INPUT),
          _cashflow(categoriesInput)),
      Value(getOperationTitle(context, OperationType.OUTPUT),
          _cashflow(categoriesOutput)),
    ];

    final budget = [
      Value(getOperationTitle(context, OperationType.INPUT),
          _budget(categoriesInput)),
      Value(getOperationTitle(context, OperationType.OUTPUT),
          _budget(categoriesOutput)),
    ];

    return [
      new charts.Series<Value, String>(
          id: AppLocalizations.of(context).titleFact,
          domainFn: (Value sales, _) => sales.title,
          measureFn: (Value sales, _) => sales.sum,
          data: fact,
          colorFn: (Value sales, _) =>
              charts.MaterialPalette.deepOrange.shadeDefault,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (Value sales, _) => '${sales.sum.toString()}'),
      new charts.Series<Value, String>(
          id: AppLocalizations.of(context).titleBudget,
          domainFn: (Value sales, _) => sales.title,
          measureFn: (Value sales, _) => sales.sum,
          data: budget,
          colorFn: (Value sales, _) => charts.MaterialPalette.gray.shadeDefault,
          // Set a label accessor to control the text of the bar label.
          labelAccessorFn: (Value sales, _) => '${sales.sum.toString()}')
    ];
  }
}

class Value {
  final String title;
  final int sum;

  Value(this.title, this.sum);
}

abstract class CashflowCardEvent {}

class Fetch extends CashflowCardEvent {}

abstract class CashflowCardState {}

class Empty extends CashflowCardState {}

class Loading extends CashflowCardState {}

class Success extends CashflowCardState {
  final List<CategoryCashflowBudget> categoriesInput;
  final List<CategoryCashflowBudget> categoriesOutput;

  Success(this.categoriesInput, this.categoriesOutput);
}

class CashflowCardBloc extends Bloc<CashflowCardEvent, CashflowCardState> {
  final Repository _repository;

  CashflowCardBloc(this._repository) : super(Loading());

  @override
  Stream<CashflowCardState> mapEventToState(CashflowCardEvent event) async* {
    await for (List<CategoryCashflowBudget> categories
        in _repository.watchAllCategoryCashflowBudget(DateTime.now())) {
      if (categories.isEmpty) {
        yield Empty();
      } else {
        List<CategoryCashflowBudget> categoriesInput = categories
            .where((category) => category.type == OperationType.INPUT)
            .toList();

        List<CategoryCashflowBudget> categoriesOutput = categories
            .where((category) => category.type == OperationType.OUTPUT)
            .toList();

        yield Success(categoriesInput, categoriesOutput);
      }
    }
  }
}
