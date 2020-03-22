import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/month_cashflow.dart';
import 'package:flutter/material.dart';

class CashflowCard extends StatelessWidget{

  final List<CategoryCashflowBudget> categoriesInput;
  final List<CategoryCashflowBudget> categoriesOutput;

  const CashflowCard({Key key, this.categoriesInput, this.categoriesOutput}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CardTitle('Cashflow'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MonthCashflow(date: DateTime.now(), cashflow: 15000, budget: 20000,),
          ),
          CardRow(
            type: OperationType.INPUT,
            cashflow: categoriesInput
                .map((category) => category.cashflow)
                .fold(0, (a, b) => a + b),
            budget: categoriesInput
                .map((category) => category.budget)
                .fold(0, (a, b) => a + b),
          ),
          CardRow(
            type: OperationType.OUTPUT,
            cashflow: categoriesOutput
                .map((category) => category.cashflow)
                .fold(0, (a, b) => a + b),
            budget: categoriesOutput
                .map((category) => category.budget)
                .fold(0, (a, b) => a + b),
          ),
        ],
      ),
    );
  }

}

class CardRow extends StatelessWidget {
  final OperationType type;
  final int cashflow;
  final int budget;

  const CardRow({this.type, this.cashflow, this.budget});

  @override
  Widget build(BuildContext context) {
    return CardButton(
      leading: Text(getOperationTitle(context, type)),
      trailing: RichText(
        text: TextSpan(
            text: '$cashflow',
            style: DefaultTextStyle.of(context)
                .style
                .copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: '/$budget',
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(fontSize: 12)),
            ]),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final Widget leading;
  final Widget trailing;

  const CardButton({this.leading, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}