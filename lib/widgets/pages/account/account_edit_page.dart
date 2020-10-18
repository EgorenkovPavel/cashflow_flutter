import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/widgets/pages/operation/list_tile_operation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AccountEditPage extends StatefulWidget {
  static const routeName = '/account';

  static open(BuildContext context, int accountId) {
    Navigator.of(context)
        .pushNamed(AccountEditPage.routeName, arguments: accountId);
  }

  final int id;

  const AccountEditPage({Key key, this.id}) : super(key: key);

  @override
  _AccountEditPageState createState() => _AccountEditPageState();
}

class _AccountEditPageState extends State<AccountEditPage> {

  AccountEditPageBloc _bloc;
  TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<AccountEditPageBloc>(context);
    _bloc.add(Fetch(widget.id));
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
              Tab(text: 'Operations')
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            buildOperationList(context),
          ],
        ),
      ),
    );
  }

  Widget buildOperationList(BuildContext context) {
    return StreamBuilder<List<Operation>>(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return SizedBox();
        }

        List<Operation> operations = snapshot.data;

        return ListView.builder(
          itemBuilder: (context, pos) {
            return ListTileOperation(operations[pos]);
          },
          itemCount: operations.length,
        );
      },
      stream: Provider.of<Repository>(context, listen: false)
          .watchAllOperationsByAccount(widget.id),
    );
  }

  Widget header(BuildContext context) {
    return BlocBuilder<AccountEditPageBloc, AccountEditPageState>(
      builder: (BuildContext context, AccountEditPageState state) {

        _titleController.text = state.accountTitle;

        if (state.editTitleMode) {
          return TextField(
            controller: _titleController,
            style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
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
            onPressed: () => _bloc.add(SaveTitle(_titleController.text)),
          );
        } else {
          return IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () => _bloc.add(EditTitle()),
          );
        }
      },
    );
  }
}

abstract class AccountPageEvent{}

class Fetch extends AccountPageEvent{
  final int id;

  Fetch(this.id);
}

class EditTitle extends AccountPageEvent{}

class SaveTitle extends AccountPageEvent{
  final String title;

  SaveTitle(this.title);
}

class AccountEditPageState{
  final bool editTitleMode;
  final String accountTitle;

  AccountEditPageState(this.editTitleMode, this.accountTitle);
}

class AccountEditPageBloc extends Bloc<AccountPageEvent, AccountEditPageState>{

  final Repository _repository;

  bool _editTitleMode = false;
  Account _account;

  AccountEditPageBloc(this._repository) : super(AccountEditPageState(false, ''));

  @override
  Stream<AccountEditPageState> mapEventToState(AccountPageEvent event) async* {

    if(event is Fetch){
      print(event.id);
      _account = await _repository.getAccountById(event.id);
      yield AccountEditPageState(_editTitleMode, _account.title);
    }else if(event is EditTitle){
      _editTitleMode = true;
      yield AccountEditPageState(_editTitleMode, _account.title);
    }else if(event is SaveTitle){
        _editTitleMode = false;
        _account = _account.copyWith(title: event.title);
        yield AccountEditPageState(_editTitleMode, _account.title);

        _repository.updateAccount(_account);
    }
  }

}