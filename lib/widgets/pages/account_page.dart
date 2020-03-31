import 'dart:async';

import 'package:cashflow/data/objects/account.dart';
import 'package:cashflow/data/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  Account account;
  StreamSubscription<Account> subscription;

  bool _editTitleMode = false;
  TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    subscription = Provider.of<Repository>(context, listen: false)
        .getAccountById(widget.id)
        .listen((Account data) {
      setState(() {
        account = data;
      });
      _titleController.text = account.title;
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
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
    if (_editTitleMode) {
      return TextField(
        controller: _titleController,
        style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),
        autofocus: true,
      );
    } else {
      return Text(account?.title ?? '');
    }
  }

  IconButton appBarIcon() {
    if (_editTitleMode) {
      return IconButton(
        icon: Icon(
          Icons.check,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            _editTitleMode = false;
            account = account.copyWith(title: _titleController.text);
          });
          Provider.of<Repository>(context, listen: false)
              .updateAccount(account.copyWith(title: _titleController.text));
        },
      );
    } else {
      return IconButton(
        icon: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            _editTitleMode = true;
          });
        },
      );
    }
  }
}
