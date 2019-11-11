import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/database.dart';
import 'package:cashflow/widgets/dropdown_list.dart';
import 'package:cashflow/widgets/operation_type_radio_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../model.dart';

class SimpleMasterPage extends StatefulWidget {
  @override
  _SimpleMasterPageState createState() => _SimpleMasterPageState();
}

class _SimpleMasterPageState extends State<SimpleMasterPage> {
  OperationType _type = OperationType.INPUT;
  AccountData _account;
  CategoryData _category;
  AccountData _recAccount;
  int _sum = 0;

  List<AccountData> accountList;
  List<CategoryData> categoryInList;
  List<CategoryData> categoryOutList;

  Widget AnalyticMenu() {
    switch (_type) {
      case OperationType.INPUT:
        return DropdownList<CategoryData>(
            value: _category,
            hint: 'Choose Category',
            onChange: (CategoryData newValue) {
              setState(() {
                _category = newValue;
              });
            },
            items: categoryInList,
            getListItem: (item) =>
                ListTile(title: Text(item.title), trailing: Text('1000')));
      case OperationType.OUTPUT:
        return DropdownList<CategoryData>(
            value: _category,
            hint: 'Choose Category',
            onChange: (CategoryData newValue) {
              setState(() {
                _category = newValue;
              });
            },
            items: categoryOutList,
            getListItem: (item) =>
                ListTile(title: Text(item.title), trailing: Text('1000')));
      case OperationType.TRANSFER:
        return DropdownList<AccountData>(
            value: _recAccount,
            hint: 'Choose Account',
            onChange: (AccountData newValue) {
              setState(() {
                _recAccount = newValue;
              });
            },
            items: accountList,
            getListItem: (item) =>
                ListTile(title: Text(item.title), trailing: Text('1000')));
      default:
        return SizedBox();
    }
  }

  void _saveOperation() {
    if (_type == OperationType.TRANSFER) {
      OperationData operation = OperationData(
          date: DateTime.now(),
          operationType: _type,
          account: _account.id,
          recAccount: _recAccount.id,
          sum: _sum);

      Provider.of<Model>(context).insertOperation(operation);
    } else {
      OperationData operation = OperationData(
          date: DateTime.now(),
          operationType: _type,
          account: _account.id,
          category: _category.id,
          sum: _sum);

      Provider.of<Model>(context).insertOperation(operation);
    }
  }

  Widget AccountMenu() {
    return DropdownList<AccountData>(
        value: _account,
        hint: 'Choose Account',
        onChange: (AccountData newValue) {
          setState(() {
            _account = newValue;
          });
        },
        items: accountList,
        getListItem: (item) =>
            ListTile(title: Text(item.title), trailing: Text('1000'))
    );
  }

  void _addSum(int digit) {
    setState(() {
      _sum = _sum * 10 + digit;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<Model>(context).watchAllAccounts().forEach((list) {
      setState(() {
        accountList = list;
      });
    });

    Provider.of<Model>(context)
        .watchAllCategoriesByType(OperationType.INPUT)
        .forEach((list) {
      setState(() {
        categoryInList = list;
      });
    });

    Provider.of<Model>(context)
        .watchAllCategoriesByType(OperationType.OUTPUT)
        .forEach((list) {
      setState(() {
        categoryOutList = list;
      });
    });

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          OperationTypeRadioButton(
            type: _type,
            onChange: (t) {
              setState(() {
                _type = t;
              });
            },
            items: [OperationType.INPUT, OperationType.OUTPUT, OperationType.TRANSFER],
          ),
          Expanded(child: AccountMenu()),
          Expanded(child: AnalyticMenu()),
          Text(_sum.toString(), style: Theme.of(context).textTheme.display1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FlatButton(
                    child: Text('1'),
                    onPressed: () => _addSum(1),
                  ),
                  FlatButton(child: Text('4'), onPressed: () => _addSum(4)),
                  FlatButton(child: Text('7'), onPressed: () => _addSum(7)),
                ],
              ),
              Column(
                children: <Widget>[
                  FlatButton(child: Text('2'), onPressed: () => _addSum(2)),
                  FlatButton(child: Text('5'), onPressed: () => _addSum(5)),
                  FlatButton(child: Text('8'), onPressed: () => _addSum(8)),
                  FlatButton(child: Text('0'), onPressed: () => _addSum(0)),
                ],
              ),
              Column(
                children: <Widget>[
                  FlatButton(child: Text('3'), onPressed: () => _addSum(3)),
                  FlatButton(child: Text('6'), onPressed: () => _addSum(6)),
                  FlatButton(child: Text('9'), onPressed: () => _addSum(9)),
                  FlatButton(
                    child: Icon(Icons.backspace),
                    onPressed: () {
                      setState(() {
                        _sum = (_sum / 10).floor();
                      });
                    },
                  )
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              Spacer(),
              FlatButton(
                child: Text('MORE'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Spacer(),
              FlatButton(
                child: Text('NEXT'),
                onPressed: _saveOperation,
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
