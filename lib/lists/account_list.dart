import 'package:cashflow/cards/account_card.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/database.dart';
import '../data/model.dart';

class AccountList extends StatelessWidget {

  void onTap(BuildContext context, AccountWithBalance itemAccount) {
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
        return Dismissible(
          key: Key(itemAccount.account.id.toString()),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(itemAccount.account.title),
                trailing: Text(
                  (itemAccount.sum ?? 0).toString(),
                  style: Theme.of(context).textTheme.title,
                ),
                onTap: () => onTap(context, itemAccount),
              ),
              Divider()
            ],
          ),
          secondaryBackground:
          dismissBackground(context, Alignment.centerRight),
          background: dismissBackground(context, Alignment.centerLeft),
          onDismissed: (_) async {
            await Provider.of<Model>(context, listen: false)
                .updateAccount(itemAccount.account.copyWith(archive: true));

            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(AppLocalizations.of(context).mesAccountArchived)));
          },
        );
      },
    );
  }

  Container dismissBackground(BuildContext context, Alignment alignment) {
    return Container(
      color: Colors.grey,
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Icon(Icons.archive, color: Colors.white,),
            Text(
              AppLocalizations.of(context).archive.toUpperCase(),
              style:
              Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
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
          AppLocalizations.of(context).titleTotalSum,
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

      builder: (BuildContext context,
          AsyncSnapshot<List<AccountWithBalance>> snapshot) {

        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator());
        }else if(snapshot.data.isEmpty){
          return EmptyListHint(AppLocalizations.of(context).hintEmptyListAccounts);
        }

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
