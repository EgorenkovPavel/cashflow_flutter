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
        title: Text('Cloud local'),
      ),
      body: BlocConsumer<SyncBloc, SyncState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SyncState_NoDb) {
            return ConnectingView();
          } else if (state is SyncState_Synced) {
            if (state.isAdmin) {
              return AdminSettings();
            } else {
              return ConnectedView();
            }
          } else if (state is SyncState_Failed) {
            if (state.isAdmin) {
              return AdminSettings();
            } else {
              return ConnectedView();
            }
          } else if (state is SyncState_NotSynced) {
            if (state.isAdmin) {
              return AdminSettings();
            } else {
              return ConnectedView();
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class ConnectedView extends StatelessWidget {
  const ConnectedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Database connected'),
        BlocBuilder<SyncBloc, SyncState>(builder: (context, state) {
          if (state is SyncState_Synced) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Last sync ${state.syncDate}'),
            );
          } else {
            return SizedBox();
          }
        }),
        SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.read<SyncBloc>().syncNow(),
              child: Text('Sync'),
            ),
            ElevatedButton(
              onPressed: () => context.read<SyncBloc>().syncLastDay(),
              child: Text('Sync last day'),
            ),
            ElevatedButton(
              onPressed: () => context.read<SyncBloc>().syncLastMonth(),
              child: Text('Sync last month'),
            ),
            ElevatedButton(
              onPressed: () => context.read<SyncBloc>().syncAll(),
              child: Text('Sync all'),
            ),
          ],
        ),
      ],
    );
  }
}

class AdminSettings extends StatelessWidget {
  const AdminSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<SyncBloc, SyncState>(builder: (context, state) {
          if (state is SyncState_Synced) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Last sync ${state.syncDate}'),
            );
          } else {
            return SizedBox();
          }
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => _addUser(context),
              child: Text('Add user'),
            ),
            ElevatedButton(
              onPressed: () => _scanQrCode(context),
              child: Text('Scan QR code'),
            ),
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.read<SyncBloc>().syncNow(),
              child: Text('Sync'),
            ),
            ElevatedButton(
              onPressed: () => context.read<SyncBloc>().syncLastDay(),
              child: Text('Sync last day'),
            ),
            ElevatedButton(
              onPressed: () => context.read<SyncBloc>().syncLastMonth(),
              child: Text('Sync last month'),
            ),
            ElevatedButton(
              onPressed: () => context.read<SyncBloc>().syncAll(),
              child: Text('Sync all'),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _scanQrCode(BuildContext context) async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
    } on PlatformException {
      return;
    }
    if (barcodeScanRes == '') {
      return;
    }

    var userData = jsonDecode(barcodeScanRes);

    await context.read<SyncBloc>().addUser(User.fromJson(userData));
  }

  Future<void> _addUser(BuildContext context) async {
    var _idController = TextEditingController();
    var _nameController = TextEditingController();
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add user'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(
                labelText: 'Id',
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                context.read<SyncBloc>().addUser(User(
                      id: _idController.text,
                      name: _nameController.text,
                      isAdmin: false,
                      photo: '',
                    ));
                Navigator.of(context).pop();
              },
              child: Text('OK'))
        ],
      ),
    );
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
            onPressed: () => context.read<SyncBloc>().createCloudDatabase(),
            child: Text('Create local'),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthStateAuthenticated) {
                return Column(
                  children: [
                    QrImage(
                      data: jsonEncode(state.user),
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                    Text('Id: ${state.user.id}'),
                    Text('Name: ${state.user.name}'),
                  ],
                );
              } else {
                return SizedBox();
              }
            },
          ),
          ElevatedButton(
              onPressed: () => context.read<SyncBloc>().refreshConnection(),
              child: Text('Refresh')),
        ],
      ),
    );
  }
}
