import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/data_repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/account/detail_page/account_detail_page_bloc.dart';
import 'package:money_tracker/ui/pages/operation/operation_list.dart';

class AccountDetailPage extends StatefulWidget {
  final int id;

  const AccountDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _AccountDetailPageState createState() => _AccountDetailPageState();
}

class _AccountDetailPageState extends State<AccountDetailPage> {
  late AccountDetailPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = AccountDetailPageBloc(context.read<DataRepository>());
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
        title: BlocBuilder<AccountDetailPageBloc, AccountEditPageState>(
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
