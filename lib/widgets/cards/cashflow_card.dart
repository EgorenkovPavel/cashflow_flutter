import 'package:bloc/bloc.dart';
import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/month_cashflow.dart';
import 'package:cashflow/widgets/pages/cashflow_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CashflowCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CashflowCardBloc>(context)..add(Fetch());
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child:
          BlocBuilder<CashflowCardBloc, CashflowCardState>(
            builder: (BuildContext context, CashflowCardState state) {
              if(state is Empty){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CardTitle(AppLocalizations.of(context).categories),
                    CardRow(type: OperationType.INPUT, categories: []),
                    Divider(
                      height: 1.0,
                    ),
                    CardRow(
                        type: OperationType.OUTPUT, categories: []),
                  ],
                );
              }else if(state is Loading){
                return Center(child: CircularProgressIndicator(),);
              }else if(state is Success){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CardTitle(AppLocalizations.of(context).titleCashflow),
                    state.categoriesOutput.isEmpty
                        ? SizedBox()
                        : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: MonthCashflow(
                        date: DateTime.now(),
                        cashflow: state.categoriesOutput
                            .map((category) => category.cashflow)
                            .fold(0, (a, b) => a + b),
                        budget: state.categoriesOutput
                            .map((category) => category.budget)
                            .fold(0, (a, b) => a + b),
                      ),
                    ),
                    Divider(
                      height: 1.0,
                    ),
                    CardRow(type: OperationType.INPUT, categories: state.categoriesInput),
                    Divider(
                      height: 1.0,
                    ),
                    CardRow(
                        type: OperationType.OUTPUT, categories: state.categoriesOutput),
                  ],
                );
              }else{
                return SizedBox();
              }
            },

          ),
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

  @override
  Widget build(BuildContext context) {
    return categories.isEmpty
        ? CardButton(
            leading: Text(getOperationTitle(context, type)),
            trailing: Text(AppLocalizations.of(context).noCategories,
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(color: Colors.black38)),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(CashflowPage.routeName, arguments: type);
            },
          )
        : CardButton(
            leading: Text(getOperationTitle(context, type)),
            trailing: RichText(
              text: TextSpan(
                  text: '${NumberFormat().format(_cashflow)}',
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: '/${NumberFormat().format(_budget)}',
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(fontSize: 12)),
                  ]),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(CashflowPage.routeName, arguments: type);
            },
          );
  }
}

class CardButton extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final GestureTapCallback onTap;

  const CardButton({this.leading, this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            leading ?? SizedBox(),
            Row(
              children: <Widget>[
                trailing ?? SizedBox(),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ],
        ),
      ),
      onPressed: onTap,
    );
  }
}


abstract class CashflowCardEvent {}

class Fetch extends CashflowCardEvent{}

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

  CashflowCardBloc(this._repository);

  @override
  CashflowCardState get initialState => Loading();

  @override
  Stream<CashflowCardState> mapEventToState(CashflowCardEvent event) async* {
    await for (List<CategoryCashflowBudget> categories
        in _repository.watchAllCategoryCashflowBudget(DateTime.now())) {

      if(categories.isEmpty){
        yield Empty();
      }else {
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
