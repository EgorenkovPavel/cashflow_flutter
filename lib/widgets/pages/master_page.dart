import 'package:cashflow/data/mappers/account_balance_mapper.dart';
import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/utils/sum_text_formatter.dart';
import 'package:cashflow/widgets/carousel.dart';
import 'package:cashflow/widgets/item_cards/account_card.dart';
import 'package:cashflow/widgets/item_cards/category_card.dart';
import 'package:cashflow/widgets/keyboard.dart';
import 'package:cashflow/widgets/lists/account_list.dart';
import 'package:cashflow/widgets/lists/category_list.dart';
import 'package:cashflow/widgets/operation_type_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MasterPage extends StatefulWidget {
  static const routeName = '/masterPageNew';

  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  OperationType _type;
  AccountBalance _account;
  Category _categoryIn;
  Category _categoryOut;
  AccountBalance _recAccount;
  int _sum = 0;
  bool _showKeyboard = false;

  Widget accountPageView(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<Repository>(context).watchAllAccountsBalance(),
      initialData: <AccountBalance>[],
      builder:
          (BuildContext context, AsyncSnapshot<List<AccountBalance>> snapshot) {
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
                  NumberFormat().format(accounts[pos].balance),
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            );
          },
        );
      },
    );
  }

  Widget categoryInPageView(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<Repository>(context)
          .watchAllCategoriesByType(OperationType.INPUT),
      initialData: <Category>[],
      builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return SizedBox();
        }

        List<Category> categories = snapshot.data;

        return Carousel(
          key: GlobalKey(),
          initialItem: _categoryIn,
          items: categories,
          onPageChanged: (pos) {
            _categoryIn = categories[pos];
            print(_categoryIn.title);
          },
          itemHeight: 60.0,
          itemBuilder: (context, pos) {
            return Center(child: Text(categories[pos].title));
          },
        );
      },
    );
  }

  Widget categoryOutPageView(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<Repository>(context)
          .watchAllCategoriesByType(OperationType.OUTPUT),
      initialData: <Category>[],
      builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
        if (!snapshot.hasData || snapshot.data.isEmpty) {
          return SizedBox();
        }

        List<Category> categories = snapshot.data;

        return Carousel(
          key: GlobalKey(),
          initialItem: _categoryOut,
          items: categories,
          onPageChanged: (pos) {
            _categoryOut = categories[pos];
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
      builder:
          (BuildContext context, AsyncSnapshot<List<AccountBalance>> snapshot) {
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
                  NumberFormat().format(accounts[pos].balance),
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            );
          },
        );
      },
    );
  }

  Widget analyticList(BuildContext context) {
    switch (_type) {
      case OperationType.INPUT:
        return categoryInPageView(context);
      case OperationType.OUTPUT:
        return categoryOutPageView(context);
      case OperationType.TRANSFER:
        return recAccountPageView(context);
      default:
        return SizedBox();
    }
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

    if (_type == OperationType.INPUT && _categoryIn == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).emptyCategoryError),
      ));
      return;
    }

    if (_type == OperationType.OUTPUT && _categoryOut == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).emptyCategoryError),
      ));
      return;
    }

    if (_sum == 0) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context).emptySumError),
      ));
      return;
    }

    switch (_type) {
      case OperationType.INPUT:
        {
          Operation operation = Operation(
              date: DateTime.now(),
              type: _type,
              account: const AccountBalanceMapper().mapToAccount(_account),
              category: _categoryIn,
              sum: _sum);

          Provider.of<Repository>(context, listen: false)
              .insertOperation(operation);
          break;
        }
      case OperationType.OUTPUT:
        {
          Operation operation = Operation(
              date: DateTime.now(),
              type: _type,
              account: const AccountBalanceMapper().mapToAccount(_account),
              category: _categoryOut,
              sum: _sum);

          Provider.of<Repository>(context, listen: false)
              .insertOperation(operation);
          break;
        }
      case OperationType.TRANSFER:
        {
          Operation operation = Operation(
              date: DateTime.now(),
              type: _type,
              account: const AccountBalanceMapper().mapToAccount(_account),
              recAccount:
                  const AccountBalanceMapper().mapToAccount(_recAccount),
              sum: _sum);

          Provider.of<Repository>(context, listen: false)
              .insertOperation(operation);
          break;
        }
    }

    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(AppLocalizations.of(context).mesOperationCreated),
    ));

    setState(() {
      _sum = 0;
    });
  }

  Widget title(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle,
    );
  }

  Widget buildList(String titleStr, Function onAdd, Widget list) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                title(titleStr),
                _showKeyboard
                    ? SizedBox()
                    : IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: onAdd,
                      ),
              ],
            ),
            Divider(),
            Flexible(child: Container(child: list)),
          ],
        ),
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
    return WillPopScope(
      onWillPop: () {
        if (_showKeyboard) {
          setState(() {
            _showKeyboard = false;
          });
        } else {
          Navigator.of(context).pop();
        }
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).titleMaster),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
            Expanded(
              child: Row(
                children: <Widget>[
                  buildList(
                      AppLocalizations.of(context).titleAccount,
                          () => AccountCard.open(context),
                      accountPageView(context)),
                  _type == OperationType.INPUT ? buildList(
                      AppLocalizations.of(context).titleCategory,
                          () => CategoryCard.open(context, type: OperationType.INPUT),
                      categoryInPageView(context)) : SizedBox(),
                  _type == OperationType.OUTPUT ? buildList(
                      AppLocalizations.of(context).titleCategory,
                          () => CategoryCard.open(context, type: OperationType.OUTPUT),
                      categoryOutPageView(context)) : SizedBox(),
                  _type == OperationType.TRANSFER ? buildList(
                      AppLocalizations.of(context).titleAccount,
                          () => AccountCard.open(context),
                      recAccountPageView(context)) : SizedBox(),
                ],
              ),
            ),
            Builder(builder: (BuildContext context) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  margin: const EdgeInsets.only(top: 6.0),
                  //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16.0)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: Text(
                            AppLocalizations.of(context).more.toUpperCase()),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                if (!_showKeyboard) {
                                  setState(() {
                                    _showKeyboard = true;
                                  });
                                }
                              },
                              child: Container(
                                child: Text(
                                  '$_sum',
                                  style: Theme.of(context)
                                      .textTheme
                                      .display1
                                      .copyWith(color: Colors.black),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    border: Border.all(
                                        color: _showKeyboard
                                            ? Theme.of(context).accentColor
                                            : Theme.of(context).primaryColor,
                                        width: 2.0)),
                                width: double.infinity,
                                height: 48.0,
                                alignment: Alignment.center,
                              ),
                            ),
                            _showKeyboard
                                ? Keyboard(
                                    onDigitPressed: (int digit) {
                                      setState(() {
                                        _sum = _sum * 10 + digit;
                                      });
                                    },
                                    onBackPressed: () {
                                      setState(() {
                                        _sum = (_sum / 10).floor();
                                      });
                                    },
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                      FlatButton(
                        child: Text(
                            AppLocalizations.of(context).next.toUpperCase()),
                        onPressed: () => _saveOperation(context),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
