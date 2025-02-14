import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/interfaces/data_repository.dart';
import 'package:money_tracker/src/domain/models/operation/operation.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class ListTileOperation extends StatelessWidget {
  final Operation _operation;
  final GestureTapCallback onTap;

  const ListTileOperation(this._operation, {super.key, required this.onTap});

  void _onDuplicate(BuildContext context) {
    sl<DataRepository>().duplicateOperation(_operation);
    Navigator.of(context).pop();
  }

  void _onDelete(BuildContext context) {
    sl<DataRepository>().deleteOperation(_operation); //TODO move to bloc
    Navigator.of(context).pop();
  }

  void _onRecover(BuildContext context) {
    sl<DataRepository>().recoverOperation(_operation);
    Navigator.of(context).pop();
  }

  void _onLongPress(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) => Wrap(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.control_point_duplicate),
            title: Text(context.loc.duplicate),
            onTap: () => _onDuplicate(context),
          ),
          if (_operation.deleted)
            ListTile(
              leading: const Icon(Icons.delete_outline),
              title: Text(context.loc.recover),
              onTap: () => _onRecover(context),
            ),
          if (!_operation.deleted)
            ListTile(
              leading: const Icon(Icons.delete),
              title: Text(context.loc.delete),
              onTap: () => _onDelete(context),
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
          Text(
            _operation.account.title,
          ),
          const SizedBox(
            width: 8,
          ),
          if (_operation.synced) const Icon(Icons.check),
          const SizedBox(
            width: 8,
          ),
          if (_operation.deleted) const Icon(Icons.cancel),
        ],
      ),
      title: Text(_operation.analyticTitle),
      trailing: Text(
        context.loc.sumFormat(_operation.sum),
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: _operation.type.color),
      ),
      onTap: onTap,
      onLongPress: () => _onLongPress(context),
    );
  }
}
