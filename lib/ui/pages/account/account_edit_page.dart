import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';
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
          onPressed: () => OperationList.addItem(context),
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

class AccountEditPageState{
  final bool editTitleMode;
  final String accountTitle;

  AccountEditPageState(this.editTitleMode, this.accountTitle);
}

class AccountEditPageBloc extends Cubit<AccountEditPageState>{

  final Repository _repository;

  bool _editTitleMode = false;
  late Account _account;

  AccountEditPageBloc(this._repository) : super(AccountEditPageState(false, ''));

  Future<void> fetch(int id) async {
    _account = await _repository.getAccountById(id);
    emit(AccountEditPageState(_editTitleMode, _account.title));
  }

  void editTitle(){
    _editTitleMode = true;
    emit(AccountEditPageState(_editTitleMode, _account.title));
  }

  Future<void> saveTitle(String title) async {
    _editTitleMode = false;
    _account = _account.copyWith(title: title);

    await _repository.updateAccount(_account);
    emit(AccountEditPageState(_editTitleMode, _account.title));
  }

}