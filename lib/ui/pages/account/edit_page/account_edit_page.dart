
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<AccountEditPageBloc>(context);
    _bloc.fetch(widget.id);
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: header(context),
          actions: <Widget>[appBarIcon()],
          bottom: TabBar(
            tabs: [
              Tab(text: AppLocalizations.of(context).operations)
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
           OperationList(filter: OperationListFilter(accountsIds: {widget.id}))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => PageNavigator.openOperationInputPage(context),
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return BlocBuilder<AccountEditPageBloc, AccountEditPageState>(
      builder: (BuildContext context, AccountEditPageState state) {

        _titleController.text = state.accountTitle;

        if (state.editTitleMode) {
          return TextField(
            controller: _titleController,
            style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
            autofocus: true,
          );
        } else {
          return Text(state.accountTitle);
        }
      },
    );

  }

  Widget appBarIcon() {

    return BlocBuilder<AccountEditPageBloc, AccountEditPageState>(
      builder: (BuildContext context, AccountEditPageState state) {
        if (state.editTitleMode) {
          return IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () => _bloc.saveTitle(_titleController.text),
          );
        } else {
          return IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () => _bloc.editTitle(),
          );
        }
      },
    );
  }
}
