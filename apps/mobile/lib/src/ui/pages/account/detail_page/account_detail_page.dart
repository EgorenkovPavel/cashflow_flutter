import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/pages/account/detail_page/account_detail_bloc.dart';
import 'package:money_tracker/src/ui/pages/operation/operation_list.dart';

class AccountDetailPage extends StatelessWidget {
  final int id;

  const AccountDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<AccountDetailBloc>()..add(AccountDetailEvent.fetch(accountId: id)),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(context.watch<AccountDetailBloc>().state.title),
              actions: <Widget>[
                IconButton(
                  onPressed: () => context.openAccountEditDialog(id),
                  icon: const Icon(Icons.edit, color: Colors.black,),
                ),
              ],
            ),
            body: OperationList(
              context.watch<AccountDetailBloc>().state.operations,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => context.openOperationInputPage(),
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
