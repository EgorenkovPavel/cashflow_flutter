import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/sync_bloc.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/home/last_operations.dart';
import 'package:money_tracker/ui/pages/home/month_operations.dart';
import 'package:money_tracker/ui/pages/home/top_header.dart';
import 'package:money_tracker/utils/app_localization.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money tracker'),
        elevation: 0.0,
        actions: [
          SyncButton(),
          IconButton(
            onPressed: () => PageNavigator.openReportsPage(context),
            icon: Icon(Icons.analytics),
          ),
          IconButton(
            onPressed: () => PageNavigator.openSettingsPage(context),
            icon: Icon(Icons.settings_sharp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(),
            _AddButton(
              title: AppLocalizations.of(context).btnAddAccount,
              onPressed: () => PageNavigator.openAccountInputPage(context),
            ),
            MonthOperations(),
            SizedBox(
              height: 8.0,
            ),
            LastOperations(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => PageNavigator.openOperationInputPage(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

class SyncButton extends StatelessWidget {
  const SyncButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncBloc, SyncState>(builder: (context, state) {
      return IconButton(
          onPressed: () => onPressed(context), icon: iconBySyncState(state));
    });
  }

  String getTitle(SyncState state){
    if (state is SyncState_InProgress) {
      return 'In progress';
    } else if (state is SyncState_Synced) {
      return 'Synced';
    } else if (state is SyncState_LoadingToCloud) {
      return 'Loading to remote';
    } else if (state is SyncState_LoadingFromCloud) {
      return 'Loading from remote';
    } else if (state is SyncState_NoDb) {
      return 'No local';
    } else if (state is SyncState_NotSynced) {
      return 'Not synced';
    } else if (state is SyncState_Failed) {
      return 'Failed';
    } else {
      return '';
    }
  }

  Icon iconBySyncState(SyncState state, {Color? color, double? size}) {
    if (state is SyncState_InProgress) {
      return Icon(
        Icons.loop,
        color: color,
        size: size,
      );
    } else if (state is SyncState_Synced) {
      return Icon(
        Icons.cloud_done_outlined,
        color: color,
        size: size,
      );
    } else if (state is SyncState_LoadingToCloud) {
      return Icon(
        Icons.cloud_upload_outlined,
        color: color,
        size: size,
      );
    } else if (state is SyncState_LoadingFromCloud) {
      return Icon(
        Icons.cloud_download_outlined,
        color: color,
        size: size,
      );
    } else if (state is SyncState_NoDb) {
      return Icon(
        Icons.cloud_off_outlined,
        color: color,
        size: size,
      );
    } else if (state is SyncState_NotSynced) {
      return Icon(
        Icons.warning_amber_outlined,
        color: color,
        size: size,
      );
    } else if (state is SyncState_Failed) {
      return Icon(
        Icons.sync_problem,
        color: color,
        size: size,
      );
    } else {
      return Icon(null);
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
          return iconBySyncState(state, color: Colors.black, size: 48);
        }),
        actions: [
          TextButton(
              onPressed: () => context.read<SyncBloc>().sync(),
              child: Text('Sync'.toUpperCase())),
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'.toUpperCase()))
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
        icon: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: onPressed,
        label: Text(
          title.toUpperCase(),
          style: TextStyle()
              .copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
