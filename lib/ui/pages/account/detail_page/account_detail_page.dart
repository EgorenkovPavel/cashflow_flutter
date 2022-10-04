import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/injection_container.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/account/detail_page/account_detail_bloc.dart';
import 'package:money_tracker/ui/pages/operation/operation_list.dart';

class AccountDetailPage extends StatelessWidget {
  final int id;

  const AccountDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AccountDetailBloc>()..add(Fetch(id)),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(context.watch<AccountDetailBloc>().state.title),
              actions: <Widget>[
                IconButton(
                  onPressed: () =>
                      sl<PageNavigator>().openAccountEditDialog(context, id),
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
            body: OperationList(
              context.watch<AccountDetailBloc>().state.operations,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => sl<PageNavigator>().openOperationInputPage(context),
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
