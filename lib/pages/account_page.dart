import 'package:cashflow/data/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model.dart';

class AccountPage extends StatelessWidget{

  static const routeName = '/account';

  @override
  Widget build(BuildContext context) {
    final Account args = ModalRoute.of(context).settings.arguments;

    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text((args == null) ? 'Account' : args.title),
        actions: <Widget>[
          FlatButton(child: Text('Save'),
            onPressed: (){
              Provider.of<Model>(context, listen: false).addAccount(Account(controller.text));
              Navigator.pop(context);
            },)
        ],
      ),
      body: TextField(controller: controller),
    );
  }
}