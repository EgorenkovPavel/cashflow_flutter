import 'package:cashflow/cards/account_card.dart';
import 'package:cashflow/pages/account_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/database.dart';
import '../data/model.dart';

class AccountList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
    return Column(
      children: <Widget>[
        Container(
          child: ListTile(
            title: Text('Total sum', style: Theme.of(context).textTheme.title,),
            trailing: StreamBuilder<int>(
              stream: model.getTotalBalance(),
              initialData: 0,
              builder: (_,  AsyncSnapshot<int> snapshot) => Text(snapshot.data.toString(), style: Theme.of(context).textTheme.title,),
            ),
          ),
          height: 44.0,//TODO hardcode
        ),
        Expanded(
          child: StreamBuilder<List<AccountWithBalance>>(
            stream: model.watchAllAccountsWithBalance(),
            builder:
                (context, AsyncSnapshot<List<AccountWithBalance>> snapshot) {
              final accounts = snapshot.data ?? List();

              return ListView.builder(
                itemCount: accounts.length,
                itemBuilder: (_, index) {
                  final itemAccount = accounts[index];
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(itemAccount.account.title),
                        trailing: Text((itemAccount.sum ?? 0).toString()),
                        onTap: () {
//                          Navigator.pushNamed(context, AccountPage.routeName,
//                              arguments: itemAccount);
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return Dialog(
                                    child: AccountCard(
                                      account: itemAccount,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(12))));
                              });
                        },
                      ),
                      Divider()
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
