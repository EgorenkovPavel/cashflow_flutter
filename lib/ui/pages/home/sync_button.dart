
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/common_blocs/sync/states.dart';
import 'package:money_tracker/common_blocs/sync/sync_bloc.dart';

class SyncButton extends StatelessWidget {
  const SyncButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncBloc, SyncState>(builder: (context, state) {
      return IconButton(
          onPressed: () => onPressed(context), icon: iconBySyncState(state));
    });
  }

  String getTitle(SyncState state) {
    if (state is SyncStateInProgress) {
      return 'In progress';
    } else if (state is SyncStateSynced) {
      return 'Synced';
    } else if (state is SyncStateLoadingToCloud) {
      return 'Loading to remote';
    } else if (state is SyncStateLoadingFromCloud) {
      return 'Loading from remote';
    } else if (state is SyncStateNoDb) {
      return 'No local';
    } else if (state is SyncStateNotSynced) {
      return 'Not synced';
    } else if (state is SyncStateFailed) {
      return 'Failed';
    } else {
      return '';
    }
  }

  Icon iconBySyncState(SyncState state, {Color? color, double? size}) {
    if (state is SyncStateInProgress) {
      return Icon(
        Icons.loop,
        color: color,
        size: size,
      );
    } else if (state is SyncStateSynced) {
      return Icon(
        Icons.cloud_done_outlined,
        color: color,
        size: size,
      );
    } else if (state is SyncStateLoadingToCloud) {
      return Icon(
        Icons.cloud_upload_outlined,
        color: color,
        size: size,
      );
    } else if (state is SyncStateLoadingFromCloud) {
      return Icon(
        Icons.cloud_download_outlined,
        color: color,
        size: size,
      );
    } else if (state is SyncStateNoDb) {
      return Icon(
        Icons.cloud_off_outlined,
        color: color,
        size: size,
      );
    } else if (state is SyncStateNotSynced) {
      return Icon(
        Icons.warning_amber_outlined,
        color: color,
        size: size,
      );
    } else if (state is SyncStateFailed) {
      return Icon(
        Icons.sync_problem,
        color: color,
        size: size,
      );
    } else {
      return const Icon(null);
    }
  }

  void onPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: BlocBuilder<SyncBloc, SyncState>(
          builder: (context, state) => Text(getTitle(state)),
        ),
        content: BlocBuilder<SyncBloc, SyncState>(builder: (context, state) {
          if(state is SyncStateLoadingToCloud) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                iconBySyncState(state, color: Colors.black, size: 48),
                Text('Accounts ${state.accountCount}'),
                Text('Categories ${state.categoryCount}'),
                Text('Operations ${state.operationCount}'),
              ],
            );
          }else if(state is SyncStateLoadingFromCloud){
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                iconBySyncState(state, color: Colors.black, size: 48),
                Text('Accounts ${state.accountCount}'),
                Text('Categories ${state.categoryCount}'),
                Text('Operations ${state.operationCount}'),
              ],
            );
          }else {
            return iconBySyncState(state, color: Colors.black, size: 48);
          }
        }),
        actions: [
          TextButton(
              onPressed: () => context.read<SyncBloc>().syncNow(),
              child: Text('Sync'.toUpperCase())),
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'.toUpperCase()))
        ],
      ),
    );
  }
}
