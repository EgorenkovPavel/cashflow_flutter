import 'package:cashflow/pages/account_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model.dart';

class AccountList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(builder: (context, model, child){
      return ListView.builder(
        itemBuilder: (BuildContext context, int pos) {
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(model.accounts[pos].title),
                onTap: (){
                  Navigator.pushNamed(context, AccountPage.routeName, arguments: model.accounts[pos]);
                },
              ),
              Divider()
            ],
          );
        },
        itemCount: model.accounts.length,
      );
    },);
  }
}
