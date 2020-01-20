import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/widgets/carusel.dart';
import 'package:cashflow/widgets/operation_type_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MasterPageNew extends StatefulWidget {
  static const routeName = '/masterPageNew';

  @override
  _MasterPageNewState createState() => _MasterPageNewState();
}

class _MasterPageNewState extends State<MasterPageNew> {
  OperationType _type;
  bool _showKeyboard = false;
  AccountWithBalance _account;
  CategoryData _category;

  Widget accountList(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<Model>(context).watchAllAccountsWithBalance(),
      initialData: <AccountWithBalance>[],
      builder: (BuildContext context,
          AsyncSnapshot<List<AccountWithBalance>> snapshot) {
        if (!snapshot.hasData) {
          return SizedBox();
        }

        List<AccountWithBalance> accounts = snapshot.data;

        return ListView.builder(
            itemCount: accounts.length,
            itemBuilder: (BuildContext context, int pos) {
              return ListTile(
                title: Text(accounts[pos].account.title),
                subtitle: Text(accounts[pos].sum.toString()),
              );
            });
      },
    );
  }

  Widget accountPageView(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<Model>(context).watchAllAccountsWithBalance(),
      initialData: <AccountWithBalance>[],
      builder: (BuildContext context,
          AsyncSnapshot<List<AccountWithBalance>> snapshot) {
        if (!snapshot.hasData) {
          return SizedBox();
        }

        List<AccountWithBalance> accounts = snapshot.data;

        return Carusel(
          key: GlobalKey(),
          items: accounts,
          initialItem: _account,
          onPageChanged: (pos) {
            print(accounts[pos].account.title);
            _account = accounts[pos];
          },
          itemHeigth: 60.0,
          itemBuilder: (context, pos) {
            return Container(
              height: 20.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(accounts[pos].account.title),
                  Text(accounts[pos].sum.toString(), style: Theme.of(context).textTheme.caption,)
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget categoryPageView(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<Model>(context).watchAllCategoriesByType(_type),
      initialData: <CategoryData>[],
      builder:
          (BuildContext context, AsyncSnapshot<List<CategoryData>> snapshot) {
        if (!snapshot.hasData) {
          return SizedBox();
        }

        List<CategoryData> categories = snapshot.data;

        return Carusel(
          key: GlobalKey(),
          initialItem: _category,
          items: categories,
          onPageChanged: (pos) {
            print(categories[pos].title);
            _category = categories[pos];
          },
          itemHeigth: 60.0,
          itemBuilder: (context, pos) {
            return Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(width: 1.0, color: Theme.of(context).primaryColor),
              ),
              height: 20.0,
              child: Center(child: Text(categories[pos].title)),
            );
          },
        );
      },
    );
  }

  Widget keyboard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.zero,
              shape: CircleBorder(
                  side: BorderSide(width: 1.0, color: Colors.grey)),
              child: Text('1'),
              onPressed: () => _addSum(1),
            ),
            FlatButton(
                child: Text('4'),
                shape: CircleBorder(
                    side: BorderSide(width: 1.0, color: Colors.grey)),
                padding: EdgeInsets.zero,
                onPressed: () => _addSum(4)),
            FlatButton(
                child: Text('7'),
                shape: CircleBorder(
                    side: BorderSide(width: 1.0, color: Colors.grey)),
                padding: EdgeInsets.zero,
                onPressed: () => _addSum(7)),
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
                  //_sum = (_sum / 10).floor();
                });
              },
            )
          ],
        )
      ],
    );
  }

  void _addSum(int diget) {}

  @override
  void initState() {
    _type = OperationType.INPUT;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          OperationTypeRadioButton(
            type: _type,
            items: [
              OperationType.INPUT,
              OperationType.OUTPUT,
              OperationType.TRANSFER
            ],
            onChange: (newValue) {
              setState(() {
                _type = newValue;
              });
            },
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Flexible(child: Container(child: accountPageView(context))),
                Flexible(
                    child: Container(
                        child: _type == OperationType.TRANSFER
                            ? accountPageView(context)
                            : categoryPageView(context))),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlatButton(
                child: Text('More'),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0),
                            borderRadius: BorderRadius.circular(4.0)),
                        alignment: Alignment.center,
                        child: Text('0'),
                      ),
                      onTap: () {
                        setState(() {
                          _showKeyboard = !_showKeyboard;
                        });
                      },
                    ),
                    _showKeyboard ? keyboard() : SizedBox(),
                  ],
                ),
              ),
              FlatButton(
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
