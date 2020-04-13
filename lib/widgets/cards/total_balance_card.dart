import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/item_cards/account_card.dart';
import 'package:cashflow/widgets/lists/account_list.dart';
import 'package:cashflow/widgets/pages/account_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TotalBalanceCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: body(context),
    );
  }

  Widget body(BuildContext context) {
    return StreamBuilder<List<AccountBalance>>(
      stream: Provider.of<Repository>(context, listen: false).watchAllAccountsBalance(),
      builder: (BuildContext context, AsyncSnapshot<List<AccountBalance>> snapshot) {
        if(!snapshot.hasData || snapshot.data.isEmpty){
          return emptyBody(context);
        } else {
          return filledBody(context, snapshot.data);
        }
      },
    );
  }

  Widget filledBody(BuildContext context, List<AccountBalance> accounts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CardTitle('Total balance'),
        Container(
          height: 200.0,
          alignment: Alignment.center,
          color: Colors.grey,
          child: Text('Here will be a chart'),
        ),
        ExpansionTile(
          title: Text(
              NumberFormat().format(accounts
                  .map((account) => account.balance)
                  .fold(0, (a, b) => a + b)),
              style: Theme.of(context).textTheme.title),
          children: accounts
              .map<Widget>((account) => Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                        title: Text(account.title),
                        trailing: Text(
                          NumberFormat().format(account.balance),
                          style: Theme.of(context).textTheme.title,
                        ),
                        onTap: () => AccountPage.open(context, account.id),
                      ),
                    ],
                  ))
              .toList()
                ..add(addButton(context)),
        ),
      ],
    );
  }

  Widget addButton(BuildContext context) {
    return Align(
      child: FlatButton(
        child: Text('Add account'),
        onPressed: () {
          AccountCard.open(context);
        },
      ),
    );
  }

  Widget emptyBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CardTitle('Total balance'),
        Align(
            child: Text('No accounts',
                style: DefaultTextStyle.of(context)
                    .style
                    .copyWith(color: Colors.black38))),
        addButton(context),
      ],
    );
  }
}
