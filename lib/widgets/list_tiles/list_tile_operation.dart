import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListTileOperation extends StatelessWidget {
  final Operation _operation;
  final GestureTapCallback onTap;

  const ListTileOperation(this._operation, {Key key, this.onTap})
      : super(key: key);

  void onLongPress(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('DELETE'),
            onTap: () {
              Provider.of<Repository>(context, listen: false)
                  .deleteOperation(_operation);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(_operation.account.title),
      title: _operation.type == OperationType.TRANSFER
          ? Text(_operation.recAccount.title)
          : Text(_operation.category.title),
      trailing: Text(
        NumberFormat().format(_operation.sum),
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: getOperationColor(_operation.type)),
      ),
      onTap: onTap,
      onLongPress: () => onLongPress(context),
    );
  }
}
