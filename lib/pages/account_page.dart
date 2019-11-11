import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database.dart';
import '../model.dart';

class AccountPage extends StatelessWidget{

  static const routeName = '/account';

  @override
  Widget build(BuildContext context) {
    AccountWithBalance account = ModalRoute.of(context).settings.arguments;

    final TextEditingController controller = TextEditingController(text: account == null ? '' : account.account.title);

    return Scaffold(
      appBar: AppBar(
        title: Text((account == null) ? 'New account' : 'Account'),
        actions: <Widget>[
          FlatButton(child: Text('Save'),
            onPressed: (){
              if(account == null){
                Provider.of<Model>(context, listen: false).insertAccount(AccountData(title: controller.text));
              }else{
                Provider.of<Model>(context, listen: false).updateAccount(account.account.copyWith(title: controller.text));
              }

              Navigator.pop(context);
            },)
        ],
      ),
      body: TextField(controller: controller),
    );
  }
}