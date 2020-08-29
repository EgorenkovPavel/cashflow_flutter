import 'package:bloc/bloc.dart';
import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/lists/category_list.dart';
import 'package:cashflow/widgets/pages/cashflow_page.dart';
import 'package:cashflow/widgets/pages/reports_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CardRow(type: OperationType.INPUT, categories: categoriesInput),
            CardRow(type: OperationType.OUTPUT, categories: categoriesOutput),
          ],
        ),
        ButtonBar(
          children: [
            FlatButton(
              child: Text(
                AppLocalizations.of(context).btnShowReports.toUpperCase(),
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                ReportsPage.open(context);
              },
            ),
            FlatButton(
              child: Text(
                AppLocalizations.of(context).categories.toUpperCase(),
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                CategoryList.open(context);
              },
            )
          ],
        )
      ],
    );
  }
}

class CardRow extends StatelessWidget {
  final OperationType type;
  final List<CategoryCashflowBudget> categories;
  int _cashflow;
  int _budget;

  CardRow({this.type, this.categories}) {
    _cashflow = categories
        .map((category) => category.cashflow)
        .fold(0, (a, b) => a + b);
    _budget =
        categories.map((category) => category.budget).fold(0, (a, b) => a + b);
  }

  void onTap(BuildContext context) {
    Navigator.of(context).pushNamed(CashflowPage.routeName, arguments: type);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 2.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                title(context),
                categoryCount(context),
                balance(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget balance(BuildContext context) {

    return categories.isEmpty ? SizedBox() : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(AppLocalizations.of(context).titleFact),
            Text('${NumberFormat().format(_cashflow)}'),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(AppLocalizations.of(context).titleBudget),
            Text('${NumberFormat().format(_budget)}')
          ],
        ),
      ],
    );

//    return RichText(
//      text: TextSpan(
//          text: '${NumberFormat().format(_cashflow)}',
//          style: DefaultTextStyle.of(context)
//              .style
//              .copyWith(fontWeight: FontWeight.bold),
//          children: [
//            TextSpan(
//                text: '/${NumberFormat().format(_budget)}',
//                style:
//                    DefaultTextStyle.of(context).style.copyWith(fontSize: 12)),
//          ]),
//    );
  }

  Text categoryCount(BuildContext context) {
    String text = categories.isEmpty
        ? AppLocalizations.of(context).noCategories
        : categories.length.toString() +
            ' ' +
            AppLocalizations.of(context).categories;

    return Text(text,
        style:
            DefaultTextStyle.of(context).style.copyWith(color: Colors.black38));
  }

  Text title(BuildContext context) => Text(getOperationTitle(context, type));
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
  CashflowCardState get initialState => Loading();

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
