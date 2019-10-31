import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        return DropdownButton<CategoryData>(
          value: _category,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (CategoryData newValue) {
            setState(() {
              _category = newValue;
            });
          },
          items: categoryInList?.map((CategoryData value) {
            return DropdownMenuItem<CategoryData>(
              value: value,
              child: Text(value.title),
            );
          })?.toList(),
        );
      case OperationType.OUTPUT:
        return DropdownButton<CategoryData>(
          value: _category,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (CategoryData newValue) {
            setState(() {
              _category = newValue;
            });
          },
          items: categoryOutList?.map((CategoryData value) {
            return DropdownMenuItem<CategoryData>(
              value: value,
              child: Text(value.title),
            );
          })?.toList(),
        );
      case OperationType.TRANSFER:
        return DropdownButton<AccountData>(
          value: _recAccount,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (AccountData newValue) {
            setState(() {
              _recAccount = newValue;
            });
          },
          items: accountList?.map((AccountData value) {
            return DropdownMenuItem<AccountData>(
              value: value,
              child: Text(value.title),
            );
          })?.toList(),
        );
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

  Widget OperationMenu() {
    return DropdownButton<OperationType>(
      value: _type,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (OperationType newValue) {
        setState(() {
          _type = newValue;
        });
      },
      items: [
        DropdownMenuItem<OperationType>(
          value: OperationType.INPUT,
          child: Text('INPUT'),
        ),
        DropdownMenuItem<OperationType>(
          value: OperationType.OUTPUT,
          child: Text('OUTPUT'),
        ),
        DropdownMenuItem<OperationType>(
          value: OperationType.TRANSFER,
          child: Text('TRANSFER'),
        ),
      ],
    );
  }

  Widget AccountMenu() {
    return DropdownButton<AccountData>(
              value: _account,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (AccountData newValue) {
                setState(() {
                  _account = newValue;
                });
              },
              items: accountList?.map((AccountData value) {
                return DropdownMenuItem<AccountData>(
                  value: value,
                  child: ListTile(title: Text(value.title)),
                );
              })?.toList(),
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
          OperationMenu(),
          Expanded(child: AccountMenu()),
          Expanded(child: AnalyticMenu()),
          Text(_sum.toString()),
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
