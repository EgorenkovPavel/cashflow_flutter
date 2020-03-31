import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/lists/account_list.dart';
import 'package:flutter/material.dart';

class TotalBalanceCard extends StatelessWidget {
  final List<AccountBalance> accounts;

  const TotalBalanceCard({Key key, this.accounts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: body(context),
    );
  }

  Widget body(BuildContext context) {
    if(accounts.isEmpty){
      return emptyBody(context);
    }else{
      return filledBody(context);
    }
  }

  Widget filledBody(BuildContext context) {
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
              accounts
                  .map((account) => account.balance)
                  .fold(0, (a, b) => a + b)
                  .toString(),
              style: Theme.of(context).textTheme.title),
          children: accounts
              .map((account) => Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                        title: Text(account.title),
                        trailing: Text(
                          account.balance.toString(),
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget emptyBody(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CardTitle('No accounts'),
        Align(
          child: FlatButton(child: Text('Add account'),
          onPressed: (){
            AccountList.addItem(context);
          },),
        ),
      ],
    );
  }
}
