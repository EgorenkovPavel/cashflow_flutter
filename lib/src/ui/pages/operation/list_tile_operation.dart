import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/interactors/operation_interactor.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/widgets/user_avatar.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../domain/view_models.dart';

class ListTileOperation extends StatelessWidget {
  final OperationView _operation;
  final GestureTapCallback onTap;

  const ListTileOperation(this._operation, {super.key, required this.onTap});

  void _onDuplicate(BuildContext context) {
    sl<OperationInteractor>().duplicate(_operation.id);
    Navigator.of(context).pop();
  }

  void _onDelete(BuildContext context) {
    sl<OperationInteractor>().deleteById(_operation.id);
    Navigator.of(context).pop();
  }

  void _onRecover(BuildContext context) {
    sl<OperationInteractor>().recover(_operation.id);
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
      leading: UserAvatar(
        photoUrl: _operation.userPhotoUrl,
        name: _operation.userName,
      ),
      subtitle: Row(
        children: [
          Text(_operation.account),
          const SizedBox(width: 8),
          if (_operation.synced) const Icon(Icons.check),
          const SizedBox(width: 8),
          if (_operation.deleted) const Icon(Icons.cancel),
        ],
      ),
      title: Text(_operation.analytic),
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
