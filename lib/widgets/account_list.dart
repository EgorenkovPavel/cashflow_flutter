import 'package:cashflow/pages/account_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../database.dart';
import '../model.dart';

class AccountList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
    return StreamBuilder<List<AccountData>>(
      stream: model.watchAllAccounts(),
      builder: (context, AsyncSnapshot<List<AccountData>> snapshot) {
        final accounts = snapshot.data ?? List();

        return ListView.builder(
          itemCount: accounts.length,
          itemBuilder: (_, index) {
            final itemAccount = accounts[index];
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(itemAccount.title),
                  onTap: () {
                    Navigator.pushNamed(context, AccountPage.routeName,
                        arguments: itemAccount);
                  },
                ),
                Divider()
              ],
            );
          },
        );
      },
    );
  }
}
