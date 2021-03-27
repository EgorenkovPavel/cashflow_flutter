import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListTileAccount extends StatelessWidget {
  final AccountBalance _account;
  final GestureTapCallback onTap;

  const ListTileAccount(this._account, {Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_account.title),
      trailing: Text(
        (_account.balance ?? 0).toString(),
        style: Theme.of(context).textTheme.headline6,
      ),
      onTap: onTap,
    );
  }
}
