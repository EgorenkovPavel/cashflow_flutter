import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database.dart';
import '../model.dart';

class AccountPage extends StatelessWidget{

  static const routeName = '/account';

  @override
  Widget build(BuildContext context) {
    AccountData account = ModalRoute.of(context).settings.arguments;

    final TextEditingController controller = TextEditingController(text: account == null ? '' : account.title);

    return Scaffold(
      appBar: AppBar(
        title: Text((account == null) ? 'New account' : 'Account'),
        actions: <Widget>[
          FlatButton(child: Text('Save'),
            onPressed: (){
              if(account == null){
                account = AccountData(title: controller.text);
                Provider.of<Model>(context, listen: false).insertAccount(account);
              }else{
                account = account.copyWith(title: controller.text);
                Provider.of<Model>(context, listen: false).updateAccount(account);
              }

              Navigator.pop(context);
            },)
        ],
      ),
      body: TextField(controller: controller),
    );
  }
}