import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/auth_bloc.dart';
import 'package:money_tracker/domain/models/user.dart';
import 'package:money_tracker/sync_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CloudDatabaseSettingsPage extends StatelessWidget {

  const CloudDatabaseSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cloud local'),),
      body: BlocConsumer<SyncBloc, SyncState>(
        listener: (context, state){},
        builder: (context, state){
          if (state.isAdmin){
            return AdminSettings();
          }else if(state is! SyncState_NoDb){
            return ConnectedView();
          }else{
            return ConnectingView();
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
    return Container(child: Text('Database connected'),);
  }
}


class AdminSettings extends StatelessWidget {
  const AdminSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => _addUser(context),
        child: Text('Add user'));
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
            builder: (context, state){
              if (state is AuthStateAuthenticated){
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
              }else{
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


