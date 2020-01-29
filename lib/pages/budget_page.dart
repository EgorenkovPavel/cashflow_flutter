
import 'package:flutter/material.dart';

class BudgetPage extends StatelessWidget {

  static const routeName = '/budget';

  final DateTime date;

  const BudgetPage({this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('$date'),
        ],
      ),
    );
  }
}
