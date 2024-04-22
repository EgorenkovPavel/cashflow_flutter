import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/common_blocs/sync/sync_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class SyncButton extends StatelessWidget {
  const SyncButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncBloc, SyncState>(builder: (context, state) {
      return IconButton(
        onPressed: () => onPressed(context),
        icon: _appBarIcon(state),
      );
    });
  }

  String _getTitle(BuildContext context, SyncState state) => state.map(
        inProgress: (_) => context.loc.syncStateInProgress,
        synced: (_) => context.loc.syncStateSynced,
        loadingToCloud: (_) => context.loc.syncStateLoadingToCloud,
        loadingFromCloud: (_) => context.loc.syncStateLoadingFromCloud,
        noDB: (_) => context.loc.syncStateNoDB,
        notSynced: (_) => context.loc.syncStateNotSynced,
        failure: (_) => context.loc.syncStateFailure,
      );

  Icon _appBarIcon(SyncState state) => _iconBySyncState(state, color: Colors.black);

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
          builder: (context, state) => Text(_getTitle(context, state)),
        ),
        content: BlocBuilder<SyncBloc, SyncState>(builder: (context, state) {
          return state.map(
            loadingToCloud: (state) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dialogIcon(state),
                Text('${context.loc.accounts} ${state.accountCount}'),
                Text('${context.loc.categories} ${state.categoryCount}'),
                Text('${context.loc.operations} ${state.operationCount}'),
              ],
            ),
            loadingFromCloud: (state) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dialogIcon(state),
                Text('${context.loc.accounts} ${state.accountCount}'),
                Text('${context.loc.categories} ${state.categoryCount}'),
                Text('${context.loc.operations} ${state.operationCount}'),
              ],
            ),
            synced: (state) => _dialogIcon(state),
            inProgress: (state) => _dialogIcon(state),
            failure: (state) => _dialogIcon(state),
            noDB: (state) => _dialogIcon(state),
            notSynced: (state) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dialogIcon(state),
                Text(state.message),
              ],
            ),
          );
        }),
        actions: [
          TextButton(
            onPressed: () => context.read<SyncBloc>().add(const SyncEvent.syncNow()),
            child: Text(context.loc.btnSync.toUpperCase()),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(context.materialLoc.closeButtonLabel.toUpperCase()),
          ),
        ],
      ),
    );
  }
}
