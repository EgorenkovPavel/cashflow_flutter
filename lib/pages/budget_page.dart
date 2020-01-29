
import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BudgetPage extends StatelessWidget {

  static const routeName = '/budget';

  final DateTime date;

  const BudgetPage({this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Text('$date'),
          StreamBuilder<List<BudgetData>>(
              stream: Provider.of<Model>(context).watchBudget(date),
              builder: (context, snapshot) {

                if(!snapshot.hasData || snapshot.data.isEmpty){
                  return SizedBox();
                }

                List<BudgetData> list = snapshot.data;

                return Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int pos){
                        BudgetData budget = list[pos];
                        return ListTile(
                          title: Text(budget.category.toString()),
                          trailing: Text(budget.sum.toString()),
                        );
                      }
                  ),
                );
            }
          )
        ],
      ),
    );
  }
}
