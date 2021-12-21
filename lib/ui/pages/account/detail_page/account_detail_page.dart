import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/local/local_source.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/account/detail_page/account_detail_page_bloc.dart';
import 'package:money_tracker/ui/pages/operation/operation_list.dart';

class AccountDetailPage extends StatelessWidget {
  final int id;

  const AccountDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        AccountDetailPageBloc(context.read<LocalSource>())
          ..fetch(id),
        child: Scaffold(
          appBar: AppBar(
            title: BlocBuilder<AccountDetailPageBloc, AccountEditPageState>(
              builder: (context, state) => Text(state.accountTitle),
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () =>
                      PageNavigator.openAccountEditPage(context, id),
                  icon: Icon(Icons.edit))
            ],
          ),
          body:
          OperationList(filter: OperationListFilter(accountsIds: {id})),
          floatingActionButton: FloatingActionButton(
            onPressed: () => PageNavigator.openOperationInputPage(context),
            child: Icon(Icons.add),
          ),
        ),
    );
  }
}