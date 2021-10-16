import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/sync_bloc.dart';

class CloudDatabaseSettingsPage extends StatelessWidget {

  const CloudDatabaseSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cloud database'),),
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
    var _controller = TextEditingController();
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add user'),
        content: TextField(
          controller: _controller,
        ),
        actions: [
          TextButton(
              onPressed: () {
                context.read<SyncBloc>().addUser(_controller.text);
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => context.read<SyncBloc>().createCloudDatabase(),
          child: Text('Create database'),
        ),
        Text('or send UserId to admin user'),
        ElevatedButton(
            onPressed: () => context.read<SyncBloc>().refreshConnection(),
            child: Text('Refresh')),
      ],
    );
  }
}


