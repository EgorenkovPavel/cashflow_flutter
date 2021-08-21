import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/account/edit_page/account_edit_page_bloc.dart';
import 'package:money_tracker/ui/pages/operation/operation_list.dart';
import 'package:money_tracker/utils/app_localization.dart';

class AccountEditPage extends StatefulWidget {
  final int id;

  const AccountEditPage({Key? key, required this.id}) : super(key: key);

  @override
  _AccountEditPageState createState() => _AccountEditPageState();
}

class _AccountEditPageState extends State<AccountEditPage> {
  late AccountEditPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AccountEditPageBloc(context.read<Repository>());
    _bloc.fetch(widget.id);
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<AccountEditPageBloc, AccountEditPageState>(
          bloc: _bloc,
          builder: (context, state) => Text(state.accountTitle),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () =>
                  PageNavigator.openAccountEditPage(context, widget.id),
              icon: Icon(Icons.edit))
        ],
      ),
      body:
          OperationList(filter: OperationListFilter(accountsIds: {widget.id})),
      floatingActionButton: FloatingActionButton(
        onPressed: () => PageNavigator.openOperationInputPage(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
