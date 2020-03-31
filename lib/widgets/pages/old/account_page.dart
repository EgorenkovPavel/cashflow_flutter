import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  static const routeName = '/account';

  @override
  Widget build(BuildContext context) {
    AccountBalance account = ModalRoute.of(context).settings.arguments;

    final TextEditingController controller = TextEditingController(
        text: account == null ? '' : account.title);

    return Scaffold(
      appBar: AppBar(
        title: Text((account == null) ? 'New account' : 'Account'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              if (account == null) {
                Provider.of<Repository>(context, listen: false)
                    .insertAccount(Account(title: controller.text));
              } else {
                Provider.of<Repository>(context, listen: false).updateAccount(
                    account.getAccount().copyWith(title: controller.text));
              }

              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Title',
          ),
        ),
      ),
    );
  }
}
