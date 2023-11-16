import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/common_blocs/auth/auth_bloc.dart';
import 'package:money_tracker/src/common_blocs/sync/sync_bloc.dart';
import 'package:money_tracker/src/domain/models/user.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CloudDatabaseSettingsPage extends StatelessWidget {
  const CloudDatabaseSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud local'),
      ),
      body: BlocBuilder<SyncBloc, SyncState>(
        builder: (context, state) {
          return state.map(
            noDB: (_) => const ConnectingView(),
            synced: (state) {
              return state.isAdmin ? const AdminSettings() : const ConnectedView();
            },
            notSynced: (_) => const ConnectedView(),
            inProgress: (_) => const Center(child: CircularProgressIndicator()),
            loadingToCloud: (state) => SyncToCloud(
              accountCount: state.accountCount,
              categoryCount: state.categoryCount,
              operationCount: state.operationCount,
            ),
            loadingFromCloud: (state) => SyncFromCloud(
              accountCount: state.accountCount,
              categoryCount: state.categoryCount,
              operationCount: state.operationCount,
            ),
            failure: (_) => const SizedBox(), // TODO
          );
        },
      ),
    );
  }
}

class SyncToCloud extends StatelessWidget {
  final int accountCount;
  final int categoryCount;
  final int operationCount;

  const SyncToCloud({
    super.key,
    required this.accountCount,
    required this.categoryCount,
    required this.operationCount,
  });

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
          Text('Accounts $accountCount'),
          Text('Categories $categoryCount'),
          Text('Operations $operationCount'),
        ],
      ),
    );
  }
}

class SyncFromCloud extends StatelessWidget {
  final int accountCount;
  final int categoryCount;
  final int operationCount;

  const SyncFromCloud({
    super.key,
    required this.accountCount,
    required this.categoryCount,
    required this.operationCount,
  });

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
          Text('Accounts $accountCount'),
          Text('Categories $categoryCount'),
          Text('Operations $operationCount'),
        ],
      ),
    );
  }
}

class ConnectedView extends StatelessWidget {
  const ConnectedView({super.key});

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
            return state.maybeMap(
              synced: (state) => Text('Last sync ${state.syncDate}'),
              orElse: () => const SizedBox(),
            );
          }),
          const SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () =>
                    context.read<SyncBloc>().add(const SyncEvent.syncNow()),
                child: const Text('Sync'),
              ),
              ElevatedButton(
                onPressed: () =>
                    context.read<SyncBloc>().add(const SyncEvent.syncLastDay()),
                child: const Text('Sync last day'),
              ),
              ElevatedButton(
                onPressed: () =>
                    context.read<SyncBloc>().add(const SyncEvent.syncLastMonth()),
                child: const Text('Sync last month'),
              ),
              ElevatedButton(
                onPressed: () =>
                    context.read<SyncBloc>().add(const SyncEvent.syncAll()),
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
  const AdminSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<SyncBloc, SyncState>(builder: (context, state) {
            return state.maybeMap(
              synced: (state) => Text('Last sync ${state.syncDate}'),
              orElse: () => const SizedBox(),
            );
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
                onPressed: () => context.read<SyncBloc>().add(const SyncEvent.syncNow()),
                child: const Text('Sync'),
              ),
              ElevatedButton(
                onPressed: () => context.read<SyncBloc>().add(const SyncEvent.syncLastDay()),
                child: const Text('Sync last day'),
              ),
              ElevatedButton(
                onPressed: () => context.read<SyncBloc>().add(const SyncEvent.syncLastMonth()),
                child: const Text('Sync last month'),
              ),
              ElevatedButton(
                onPressed: () => context.read<SyncBloc>().add(const SyncEvent.syncAll()),
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

    if (!context.mounted) return;
    context.read<SyncBloc>().add(SyncEvent.addUser(user: User.fromJson(userData)));
  }
}

class ConnectingView extends StatelessWidget {
  const ConnectingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () =>
                context.read<SyncBloc>().add(const SyncEvent.createCloudDatabase()),
            child: const Text('Create local'),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              final user = state.user;
              if (user == null) {
                return const SizedBox();
              } else {
                return Column(children: [
                  QrImageView(
                    data: jsonEncode(state.user),
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  Text('Id: ${user.id}'),
                  Text('Name: ${user.name}'),
                ]);
              }
            },
          ),
          ElevatedButton(
            onPressed: () => context.read<SyncBloc>().add(const SyncEvent.refreshConnection()),
            child: const Text('Refresh'),
          ),
        ],
      ),
    );
  }
}
