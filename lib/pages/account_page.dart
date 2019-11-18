import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/database.dart';
import '../data/model.dart';

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
          IconButton(icon: Icon(Icons.save),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Title',
          ),
        ),
      ),
    );
  }
}