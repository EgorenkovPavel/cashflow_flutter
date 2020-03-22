import 'package:cashflow/widgets/card_title.dart';
import 'package:flutter/material.dart';

class LastOperationsCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CardTitle('Last operations'),
          ListTile(
            title: Text('Account'),
            subtitle: Text('Category'),
            trailing: Text('2000'),
          ),
          Align(
            child: FlatButton(child: Text('Show all'), onPressed: () {},),
          )
        ],
      ),
    );
  }

}