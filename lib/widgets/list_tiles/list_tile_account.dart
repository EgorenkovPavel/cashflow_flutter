import 'package:cashflow/data/database.dart';
import 'package:flutter/material.dart';

class ListTileAccount extends StatelessWidget {

  final AccountWithBalance _account;
  final GestureTapCallback onTap;

  const ListTileAccount(this._account, {Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_account.account.title),
      trailing: Text(
        (_account.sum ?? 0).toString(),
        style: Theme.of(context).textTheme.title,
      ),
      onTap: onTap,
    );
  }
}
