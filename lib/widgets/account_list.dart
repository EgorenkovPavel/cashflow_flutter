import 'package:cashflow/cards/account_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/database.dart';
import '../data/model.dart';

class AccountList extends StatelessWidget {

  void accountOnTap(BuildContext context, AccountWithBalance itemAccount) {
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
  }

  Widget accountList(BuildContext context, List<AccountWithBalance> accounts) {
    return ListView.builder(
      itemCount: accounts.length,
      itemBuilder: (_, index) {
        final itemAccount = accounts[index];
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(itemAccount.account.title),
              trailing: Text(
                (itemAccount.sum ?? 0).toString(),
                style: Theme.of(context).textTheme.title,
              ),
              onTap: () => accountOnTap(context, itemAccount),
            ),
            Divider()
          ],
        );
      },
    );
  }

  Widget totalSum(BuildContext context, List<AccountWithBalance> accounts) {
    if (accounts.length <= 1) {
      return SizedBox();
    }

    int sum = 0;
    accounts.forEach((f) => sum += f.sum);

    return Container(
      child: ListTile(
        title: Text(
          'Total sum',
          style: Theme.of(context).textTheme.title,
        ),
        trailing: Text(
          sum.toString(),
          style: Theme.of(context).textTheme.headline,
        ),
      ),
      height: 44.0, //TODO hardcode
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);

    return StreamBuilder<List<AccountWithBalance>>(
      stream: model.watchAllAccountsWithBalance(),
      initialData: [],
      builder: (BuildContext context,
          AsyncSnapshot<List<AccountWithBalance>> snapshot) {
        final accounts = snapshot.data ?? List();

        return Column(
          children: <Widget>[
            totalSum(context, accounts),
            Expanded(child: accountList(context, accounts)),
          ],
        );
      },
    );

  }
}
