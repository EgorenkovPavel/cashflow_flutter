import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/month_cashflow.dart';
import 'package:cashflow/widgets/pages/cashflow_page.dart';
import 'package:flutter/material.dart';

class CashflowCard extends StatelessWidget {
  final List<CategoryCashflowBudget> categoriesInput;
  final List<CategoryCashflowBudget> categoriesOutput;

  const CashflowCard({Key key, this.categoriesInput, this.categoriesOutput})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CardTitle('Cashflow'),
          categoriesOutput.isEmpty ? SizedBox() : Padding(
            padding: const EdgeInsets.all(8.0),
            child: MonthCashflow(
              date: DateTime.now(),
              cashflow: categoriesOutput
                  .map((category) => category.cashflow)
                  .fold(0, (a, b) => a + b),
              budget: categoriesOutput
                  .map((category) => category.budget)
                  .fold(0, (a, b) => a + b),
            ),
          ),
          CardRow(type: OperationType.INPUT, categories: categoriesInput),
          CardRow(type: OperationType.OUTPUT, categories: categoriesOutput),
        ],
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
            trailing: Text('No categories', style: DefaultTextStyle.of(context).style.copyWith(color: Colors.black38)),
          )
        : CardButton(
            leading: Text(getOperationTitle(context, type)),
            trailing: RichText(
              text: TextSpan(
                  text: '$_cashflow',
                  style: DefaultTextStyle.of(context)
                      .style
                      .copyWith(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: '/$_budget',
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
    return GestureDetector(
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
      onTap: () {
        Navigator.of(context).pushNamed(CashflowPage.routeName);
      },
    );
  }
}
