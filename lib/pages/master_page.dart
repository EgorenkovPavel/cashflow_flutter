import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/utils/sum_text_formatter.dart';
import 'package:cashflow/widgets/carusel.dart';
import 'package:cashflow/widgets/operation_type_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class MasterPage extends StatefulWidget {
  static const routeName = '/masterPageNew';

  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  OperationType _type;
  bool _showKeyboard = false;
  AccountWithBalance _account;
  CategoryData _category;
  AccountWithBalance _recAccount;
  TextEditingController _sumController = TextEditingController();

  Widget accountPageView(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<Model>(context).watchAllAccountsWithBalance(),
      initialData: <AccountWithBalance>[],
      builder: (BuildContext context,
          AsyncSnapshot<List<AccountWithBalance>> snapshot) {
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return SizedBox();
        }

        List<AccountWithBalance> accounts = snapshot.data;

        return Carusel(
          key: GlobalKey(),
          items: accounts,
          initialItem: _account,
          onPageChanged: (pos) {
            _account = accounts[pos];
          },
          itemHeight: 60.0,
          itemBuilder: (context, pos) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(accounts[pos].account.title),
                Text(
                  accounts[pos].sum.toString(),
                  style: Theme.of(context).textTheme.caption,
                )
              ],
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
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return SizedBox();
        }

        List<CategoryData> categories = snapshot.data;

        return Carusel(
          key: GlobalKey(),
          initialItem: _category,
          items: categories,
          onPageChanged: (pos) {
            _category = categories[pos];
          },
          itemHeight: 60.0,
          itemBuilder: (context, pos) {
            return Center(child: Text(categories[pos].title));
          },
        );
      },
    );
  }

  Widget recAccountPageView(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<Model>(context).watchAllAccountsWithBalance(),
      initialData: <AccountWithBalance>[],
      builder: (BuildContext context,
          AsyncSnapshot<List<AccountWithBalance>> snapshot) {
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return SizedBox();
        }

        List<AccountWithBalance> accounts = snapshot.data;

        return Carusel(
          key: GlobalKey(),
          items: accounts,
          initialItem: _recAccount,
          onPageChanged: (pos) {
            _recAccount = accounts[pos];
          },
          itemHeight: 60.0,
          itemBuilder: (context, pos) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(accounts[pos].account.title),
                Text(
                  accounts[pos].sum.toString(),
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            );
          },
        );
      },
    );
  }

  void _saveOperation(BuildContext context) {
    if (_account == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).emptyAccountError),
      ));
      return;
    }

    if (_type == OperationType.TRANSFER && _recAccount == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).emptyRecAccountError),
      ));
      return;
    }

    if (_type != OperationType.TRANSFER &&
        (_category == null || _category.operationType != _type)) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).emptyCategoryError),
      ));
      return;
    }

    int sum = int.parse(_sumController.text);
    if (sum == 0) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).emptySumError),
      ));
      return;
    }

    if (_type == OperationType.TRANSFER) {
      OperationData operation = OperationData(
          date: DateTime.now(),
          operationType: _type,
          account: _account.account.id,
          recAccount: _recAccount.account.id,
          sum: sum);

      Provider.of<Model>(context, listen: false).insertOperation(operation);
    } else {
      OperationData operation = OperationData(
          date: DateTime.now(),
          operationType: _type,
          account: _account.account.id,
          category: _category.id,
          sum: sum);

      Provider.of<Model>(context, listen: false)..insertOperation(operation);
    }

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(AppLocalizations.of(context).mesOperationCreated),
    ));

    print('TEST');

    _sumController.text = '';
  }

  Widget title(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }

  @override
  void initState() {
    _type = OperationType.INPUT;

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _showKeyboard = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).titleMaster),
      ),
      body: Column(
        children: <Widget>[
          title(AppLocalizations.of(context).titleType),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: OperationTypeRadioButton(
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              title(AppLocalizations.of(context).titleAccount),
              title(AppLocalizations.of(context).titleCategory),
            ],
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Flexible(child: Container(child: accountPageView(context))),
                Flexible(
                    child: Container(
                        child: _type == OperationType.TRANSFER
                            ? recAccountPageView(context)
                            : categoryPageView(context))),
              ],
            ),
          ),
          Builder(builder: (BuildContext context) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FlatButton(
                  child: Text(AppLocalizations.of(context).more.toUpperCase()),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _sumController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onEditingComplete: () => _saveOperation(context),
                    inputFormatters: [SumTextFormatter()],
                  ),
                ),
                FlatButton(
                  child: Text(AppLocalizations.of(context).next.toUpperCase()),
                  onPressed: () => _saveOperation(context),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
