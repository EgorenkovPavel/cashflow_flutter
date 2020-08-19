import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatefulWidget {
  static const routeName = '/account';

  static open(BuildContext context, int accountId) {
    Navigator.of(context)
        .pushNamed(AccountPage.routeName, arguments: accountId);
  }

  final int id;

  const AccountPage({Key key, this.id}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  AccountPageBloc _bloc;
  TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<AccountPageBloc>(context);
    _bloc.add(Fetch(widget.id));
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: header(context),
        actions: <Widget>[appBarIcon()],
      ),
    );
  }

  Widget header(BuildContext context) {
    return BlocBuilder<AccountPageBloc, AccountPageState>(
      builder: (BuildContext context, AccountPageState state) {

        _titleController.text = state.accountTitle;

        if (state.editTitleMode) {
          return TextField(
            controller: _titleController,
            style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),
            autofocus: true,
          );
        } else {
          return Text(state.accountTitle);
        }
      },
    );

  }

  Widget appBarIcon() {

    return BlocBuilder<AccountPageBloc, AccountPageState>(
      builder: (BuildContext context, AccountPageState state) {
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

class AccountPageState{
  final bool editTitleMode;
  final String accountTitle;

  AccountPageState(this.editTitleMode, this.accountTitle);
}

class AccountPageBloc extends Bloc<AccountPageEvent, AccountPageState>{

  final Repository _repository;

  bool _editTitleMode = false;
  Account _account;

  AccountPageBloc(this._repository) : super(AccountPageState(false, ''));

  @override
  AccountPageState get initialState => AccountPageState(_editTitleMode, '');

  @override
  Stream<AccountPageState> mapEventToState(AccountPageEvent event) async* {

    if(event is Fetch){
      print(event.id);
      _account = await _repository.getAccountById(event.id);
      yield AccountPageState(_editTitleMode, _account.title);
    }else if(event is EditTitle){
      _editTitleMode = true;
      yield AccountPageState(_editTitleMode, _account.title);
    }else if(event is SaveTitle){
        _editTitleMode = false;
        _account = _account.copyWith(title: event.title);
        yield AccountPageState(_editTitleMode, _account.title);

        _repository.updateAccount(_account);
    }
  }

}