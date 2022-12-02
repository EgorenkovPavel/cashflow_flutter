import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/common_blocs/sync/sync_bloc.dart';

class SyncButton extends StatelessWidget {
  const SyncButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncBloc, SyncState>(builder: (context, state) {
      return IconButton(
        onPressed: () => onPressed(context),
        icon: _appBarIcon(state),
      );
    });
  }

  String _getTitle(SyncState state) => state.map(
        inProgress: (_) => 'In progress',
        synced: (_) => 'Synced',
        loadingToCloud: (_) => 'Loading to remote',
        loadingFromCloud: (_) => 'Loading from remote',
        noDB: (_) => 'No local',
        notSynced: (_) => 'Not synced',
        failure: (_) => 'Failed',
      );

  Icon _appBarIcon(SyncState state) => _iconBySyncState(state);

  Icon _dialogIcon(SyncState state) =>
      _iconBySyncState(state, color: Colors.black, size: 48);

  Icon _iconBySyncState(SyncState state, {Color? color, double? size}) => Icon(
        state.map(
          inProgress: (_) => Icons.loop,
          loadingToCloud: (_) => Icons.cloud_upload_outlined,
          loadingFromCloud: (_) => Icons.cloud_download_outlined,
          synced: (_) => Icons.cloud_done_outlined,
          notSynced: (_) => Icons.warning_amber_outlined,
          failure: (_) => Icons.sync_problem,
          noDB: (_) => Icons.cloud_off_outlined,
        ),
        color: color,
        size: size,
      );

  void onPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: BlocBuilder<SyncBloc, SyncState>(
          builder: (context, state) => Text(_getTitle(state)),
        ),
        content: BlocBuilder<SyncBloc, SyncState>(builder: (context, state) {
          return state.map(
            loadingToCloud: (state) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dialogIcon(state),
                Text('Accounts ${state.accountCount}'),
                Text('Categories ${state.categoryCount}'),
                Text('Operations ${state.operationCount}'),
              ],
            ),
            loadingFromCloud: (state) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dialogIcon(state),
                Text('Accounts ${state.accountCount}'),
                Text('Categories ${state.categoryCount}'),
                Text('Operations ${state.operationCount}'),
              ],
            ),
            synced: (state) => _dialogIcon(state),
            inProgress: (state) => _dialogIcon(state),
            failure: (state) => _dialogIcon(state),
            noDB: (state) => _dialogIcon(state),
            notSynced: (state) => _dialogIcon(state),
          );
        }),
        actions: [
          TextButton(
            onPressed: () => context.read<SyncBloc>().add(SyncEvent.syncNow()),
            child: Text('Sync'.toUpperCase()),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'.toUpperCase()),
          ),
        ],
      ),
    );
  }
}
