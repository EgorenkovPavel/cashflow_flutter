import 'package:flutter/material.dart';

class CashflowPage extends StatelessWidget{

  static String routeName = '/cashflow';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Cashflow'),
      ),
      body: Center(
        child: Text('Here will be a charts'),
      ),
    );
  }

}