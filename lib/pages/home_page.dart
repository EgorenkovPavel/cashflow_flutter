import 'package:cashflow/cards/account_card.dart';
import 'package:cashflow/cards/operation_card.dart';
import 'package:cashflow/data/database.dart';
import 'package:cashflow/lists/account_list.dart';
import 'package:cashflow/lists/category_list.dart';
import 'package:cashflow/lists/operation_list.dart';
import 'package:cashflow/pages/backup_page.dart';
import 'package:cashflow/pages/master_page.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/material.dart';

import '../cards/category_card.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget body() {
    switch (_selectedIndex) {
      case 0:
        return AccountList();
      case 1:
        return CategoryList();
      case 2:
        return OperationList();
      default:
        return SizedBox();
    }
  }

  void _addElement(BuildContext context) {
    if (_selectedIndex == 0) {
      //Navigator.of(context).pushNamed(AccountPage.routeName);
      showAccount();
    } else if (_selectedIndex == 1) {
      //Navigator.of(context).pushNamed(CategoryPage.routeName);
      showCategory();
    } else if (_selectedIndex == 2) {
      Navigator.of(context).pushNamed(MasterPage.routeName);
//      showOperation();
    }
  }

  void showAccount({AccountWithBalance account}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              child: AccountCard(
                account: account,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))));
        });
  }

  void showCategory([CategoryData category]) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              child: CategoryCard(
                category: category,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))));
        });
  }

  void showOperation([OperationItem operation]) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              child: OperationCard(
                operation: operation,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cashflow'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<AppMenu>(
              child: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem<AppMenu>(
                  child: Text(AppLocalizations.of(context).itemMenuService),
                  value: AppMenu.BACKUP,
                )
              ],
              onSelected: (value) {
                switch (value) {
                  case AppMenu.BACKUP:
                    {
                      Navigator.of(context).pushNamed(BackupPage.routeName);
                      break;
                    }
                }
              },
            ),
          ),
        ],
      ),
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text(AppLocalizations.of(context).itemBarAccounts),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dns),
            title: Text(AppLocalizations.of(context).itemBarCategories),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            title: Text(AppLocalizations.of(context).itemBarOperations),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addElement(context);
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}

enum AppMenu { BACKUP }
