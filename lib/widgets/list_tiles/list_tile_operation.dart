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

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_operation.account.title),
      subtitle: _operation.type == OperationType.TRANSFER
          ? Text(_operation.recAccount.title)
          : Text(_operation.category.title),
      trailing: Column(
        children: <Widget>[
          Text(
            _operation.sum.toString(),
            style: Theme.of(context).textTheme.headline,
          ),
          Text(
            DateFormat.yMMMd(Localizations.localeOf(context).languageCode)
                .format(_operation.date),
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(
          getOperationIcon(_operation.type),
          color: getOperationColor(_operation.type),
        ),
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
                title: Text('DELETE'),
                onTap: () {
                  Provider.of<Repository>(context, listen: false)
                      .deleteOperation(_operation);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
