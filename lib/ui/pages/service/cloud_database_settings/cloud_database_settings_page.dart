import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/common_blocs/sync/states.dart';
import 'package:money_tracker/common_blocs/sync/sync_bloc.dart';
import 'package:money_tracker/domain/models/user.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CloudDatabaseSettingsPage extends StatelessWidget {
  const CloudDatabaseSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud local'),
      ),
      body: BlocBuilder<SyncBloc, SyncState>(
        builder: (context, state) {
          if (state is SyncStateNoDb) {
            return const ConnectingView();
          } else if (state is SyncStateSynced) {
            if (state.isAdmin) {
              return const AdminSettings();
            } else {
              return const ConnectedView();
            }
          } else if (state is SyncStateNotSynced) {
            return const ConnectedView();
          } else if (state is SyncStateInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SyncStateLoadingToCloud) {
            return SyncToCloud(state: state);
          } else if (state is SyncStateLoadingFromCloud) {
            return SyncFromCloud(state: state);
          } else {
            //TODO discribe other states
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class SyncToCloud extends StatelessWidget {
  final SyncStateLoadingToCloud state;

  const SyncToCloud({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.cloud_upload_outlined,
            color: Colors.black,
            size: 48,
          ),
          Text('Accounts ${state.accountCount}'),
          Text('Categories ${state.categoryCount}'),
          Text('Operations ${state.operationCount}'),
        ],
      ),
    );
  }
}

class SyncFromCloud extends StatelessWidget {
  final SyncStateLoadingFromCloud state;

  const SyncFromCloud({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.cloud_download_outlined,
            color: Colors.black,
            size: 48,
          ),
          Text('Accounts ${state.accountCount}'),
          Text('Categories ${state.categoryCount}'),
          Text('Operations ${state.operationCount}'),
        ],
      ),
    );
  }
}

class ConnectedView extends StatelessWidget {
  const ConnectedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Database connected'),
          const SizedBox(height: 8.0),
          BlocBuilder<SyncBloc, SyncState>(builder: (context, state) {
            return state is SyncStateSynced
                ? Text('Last sync ${state.syncDate}')
                : const SizedBox();
          }),
          const SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () => context.read<SyncBloc>().add(SyncNow()),
                child: const Text('Sync'),
              ),
              ElevatedButton(
                onPressed: () => context.read<SyncBloc>().add(SyncLastDay()),
                child: const Text('Sync last day'),
              ),
              ElevatedButton(
                onPressed: () => context.read<SyncBloc>().add(SyncLastMonth()),
                child: const Text('Sync last month'),
              ),
              ElevatedButton(
                onPressed: () => context.read<SyncBloc>().add(SyncAll()),
                child: const Text('Sync all'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AdminSettings extends StatelessWidget {
  const AdminSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<SyncBloc, SyncState>(builder: (context, state) {
            return state is SyncStateSynced
                ? Text('Last sync ${state.syncDate}')
                : const SizedBox();
          }),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _scanQrCode(context),
                child: const Text('Scan QR code'),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () => context.read<SyncBloc>().add(SyncNow()),
                child: const Text('Sync'),
              ),
              ElevatedButton(
                onPressed: () => context.read<SyncBloc>().add(SyncLastDay()),
                child: const Text('Sync last day'),
              ),
              ElevatedButton(
                onPressed: () => context.read<SyncBloc>().add(SyncLastMonth()),
                child: const Text('Sync last month'),
              ),
              ElevatedButton(
                onPressed: () => context.read<SyncBloc>().add(SyncAll()),
                child: const Text('Sync all'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _scanQrCode(BuildContext context) async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );
    } on PlatformException {
      return;
    }
    if (barcodeScanRes == '') {
      return;
    }

    var userData = jsonDecode(barcodeScanRes);

    context.read<SyncBloc>().add(AddUser(User.fromJson(userData)));
  }
}

class ConnectingView extends StatelessWidget {
  const ConnectingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () =>
                context.read<SyncBloc>().add(CreateCloudDatabase()),
            child: const Text('Create local'),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return state is Authenticated
                  ? Column(children: [
                      QrImage(
                        data: jsonEncode(state.user),
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                      Text('Id: ${state.user.id}'),
                      Text('Name: ${state.user.name}'),
                    ])
                  : const SizedBox();
            },
          ),
          ElevatedButton(
            onPressed: () => context.read<SyncBloc>().add(RefreshConnection()),
            child: const Text('Refresh'),
          ),
        ],
      ),
    );
  }
}
