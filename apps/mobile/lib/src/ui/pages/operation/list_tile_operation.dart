import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/interactors/operation_interactor.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/widgets/user_avatar.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../models/operation_view.dart';


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
      builder: (context) => SafeArea(
        child: Wrap(
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final child = _OperationTile(
      operation: _operation,
      onTap: onTap,
      onLongPress: () => _onLongPress(context),
    );

    if (_operation.deleted) {
      return CustomPaint(
        painter: StrikeThroughPainter(),
        child: Opacity(opacity: 0.5, child: child),
      );
    } else {
      return child;
    }
  }
}

class _OperationTile extends StatelessWidget {
  const _OperationTile({
    super.key,
    required this.operation,
    required this.onTap,
    required this.onLongPress,
  });

  final OperationView operation;
  final void Function() onTap;
  final void Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return switch (operation) {
      InputOperationView(category: final analytic, sum: final sum) =>
        ListTile(
          leading: UserAvatar(
            photoUrl: operation.userPhotoUrl,
            name: operation.userName,
          ),
          title: Text(analytic),
          subtitle: Row(
            children: [
              Text(operation.account),
              const SizedBox(width: 8),
              if (operation.synced) const Icon(Icons.check),
            ],
          ),
          trailing: Text(
            context.loc.sumFormat(sum),
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: operation.type.color),
          ),
          onTap: onTap,
          onLongPress: onLongPress,
        ),
      OutputOperationView(category: final analytic, sum: final sum) =>
        ListTile(
          leading: UserAvatar(
            photoUrl: operation.userPhotoUrl,
            name: operation.userName,
          ),
          title: Text(analytic),
          subtitle: Row(
            children: [
              Text(operation.account),
              const SizedBox(width: 8),
              if (operation.synced) const Icon(Icons.check),
            ],
          ),
          trailing: Text(
            context.loc.sumFormat(sum),
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: operation.type.color),
          ),
          onTap: onTap,
          onLongPress: onLongPress,
        ),
      TransferOperationView(recAccount: final analytic, sum: final sum) =>
        ListTile(
          leading: UserAvatar(
            photoUrl: operation.userPhotoUrl,
            name: operation.userName,
          ),
          title: Text(analytic),
          subtitle: Row(
            children: [
              Text(operation.account),
              const SizedBox(width: 8),
              if (operation.synced) const Icon(Icons.check),
            ],
          ),
          trailing: Text(
            context.loc.sumFormat(sum),
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: operation.type.color),
          ),
          onTap: onTap,
          onLongPress: onLongPress,
        ),
      ExchangeOperationView(receivedSum: final recSum) =>
        ListTile(
          leading: UserAvatar(
            photoUrl: operation.userPhotoUrl,
            name: operation.userName,
          ),
          title: Text(operation.account),
          subtitle: Row(
            children: [if (operation.synced) const Icon(Icons.check)],
          ),
          trailing: Text(
            context.loc.sumFormat(recSum),
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: operation.type.color),
          ),

          onTap: onTap,
          onLongPress: onLongPress,
        ),
    };
  }
}

class StrikeThroughPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;

    // Диагональная линия от левого верхнего к правому нижнему
    canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), paint);

    canvas.drawLine(Offset(0, size.height), Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
