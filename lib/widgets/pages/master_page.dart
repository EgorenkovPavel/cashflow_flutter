import 'package:cashflow/data/mappers/account_balance_mapper.dart';
import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/utils/sum_text_formatter.dart';
import 'package:cashflow/widgets/carousel.dart';
import 'package:cashflow/widgets/operation_type_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MasterPage extends StatefulWidget {
  static const routeName = '/masterPageNew';

  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  OperationType _type;
  AccountBalance _account;
  Category _category;
  AccountBalance _recAccount;
  TextEditingController _sumController = TextEditingController();

  Widget accountPageView(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<Repository>(context).watchAllAccountsBalance(),
      initialData: <AccountBalance>[],
      builder: (BuildContext context,
          AsyncSnapshot<List<AccountBalance>> snapshot) {
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return SizedBox();
        }

        List<AccountBalance> accounts = snapshot.data;

        return Carousel(
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
                Text(accounts[pos].title),
                Text(
                  accounts[pos].balance.toString(),
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
      stream: Provider.of<Repository>(context).watchAllCategoriesByType(_type),
      initialData: <Category>[],
      builder:
          (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return SizedBox();
        }

        List<Category> categories = snapshot.data;

        return Carousel(
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
      stream: Provider.of<Repository>(context).watchAllAccountsBalance(),
      initialData: <AccountBalance>[],
      builder: (BuildContext context,
          AsyncSnapshot<List<AccountBalance>> snapshot) {
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return SizedBox();
        }

        List<AccountBalance> accounts = snapshot.data;

        return Carousel(
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
                Text(accounts[pos].title),
                Text(
                  accounts[pos].balance.toString(),
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
        (_category == null || _category.type != _type)) {
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
      Operation operation = Operation(
          date: DateTime.now(),
          type: _type,
          account: const AccountBalanceMapper().mapToAccount(_account),
          recAccount: const AccountBalanceMapper().mapToAccount(_recAccount),
          sum: sum);

      Provider.of<Repository>(context, listen: false).insertOperation(operation);
    } else {
      Operation operation = Operation(
          date: DateTime.now(),
          type: _type,
          account: const AccountBalanceMapper().mapToAccount(_account),
          category: _category,
          sum: sum);

      Provider.of<Repository>(context, listen: false).insertOperation(operation);
    }

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(AppLocalizations.of(context).mesOperationCreated),
    ));

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
    super.initState();
    _type = OperationType.INPUT;
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
