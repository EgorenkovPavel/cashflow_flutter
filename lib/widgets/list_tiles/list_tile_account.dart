import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.delete),
                title: Text(_account.account.archive ? 'UNARCHIVE' : 'ARCHIVE'),
                onTap: () {
                  Provider.of<Model>(context, listen: false)
                      .updateAccount(_account.account.copyWith(archive: !_account.account.archive));
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
