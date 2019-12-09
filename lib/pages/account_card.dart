import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/pages/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountCard extends StatelessWidget {
  AccountWithBalance account;
  final TextEditingController controller = TextEditingController();

  AccountCard({this.account}) {
    if (account != null) {
      controller.text = account.account.title;
    }
  }

  void saveAccount(BuildContext context){
    if(account == null){
      Provider.of<Model>(context, listen: false).insertAccount(AccountData(title: controller.text));
    }else{
      Provider.of<Model>(context, listen: false).updateAccount(account.account.copyWith(title: controller.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      title: account == null ? 'New account' : 'Account',
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Title',
        ),
      ),
      onSave: (context){saveAccount(context);},
    );
  }
}
