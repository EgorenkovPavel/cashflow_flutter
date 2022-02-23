import 'package:flutter/material.dart';
import 'package:money_tracker/data/data_source.dart';
import 'package:money_tracker/domain/models/operation.dart';
import 'package:money_tracker/domain/models/operation_type.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:provider/provider.dart';

class ListTileOperation extends StatelessWidget {
  final Operation _operation;
  final GestureTapCallback onTap;

  const ListTileOperation(this._operation, {Key? key, required this.onTap})
      : super(key: key);

  void onLongPress(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Wrap(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.control_point_duplicate),
            title: Text(AppLocalizations.of(context).duplicate),
            onTap: () {
              Provider.of<DataSource>(context, listen: false)
                  .operations
                  .duplicate(_operation);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: Text(AppLocalizations.of(context).delete),
            onTap: () {
              Provider.of<DataSource>(context, listen: false)
                  .operations
                  .delete(_operation);
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
      subtitle: Row(
        children: [
          Text(_operation.account.title,),
          const SizedBox(width: 8,),
          if (_operation.synced) const Icon(Icons.check),
          const SizedBox(width: 8,),
          if (_operation.deleted) const Icon(Icons.cancel),
        ],
      ),
      title: _operation.type == OperationType.TRANSFER
          ? Text(_operation.recAccount!.title)
          : Text(_operation.category!.title),
      trailing: Text(
        AppLocalizations.of(context).numberFormat(_operation.sum),
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(color: _operation.type.color()),
      ),
      onTap: onTap,
      onLongPress: () => onLongPress(context),
    );
  }
}
