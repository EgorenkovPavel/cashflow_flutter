import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget{

  static const routeName = '/reports';

  static open(BuildContext context) {
    Navigator.of(context)
        .pushNamed(ReportsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      //TODO
    );
  }

}