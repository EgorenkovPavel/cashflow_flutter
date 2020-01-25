import 'package:cashflow/lists/account_list.dart';
import 'package:cashflow/lists/category_list.dart';
import 'package:cashflow/lists/operation_list.dart';
import 'package:cashflow/pages/backup_page.dart';
import 'package:cashflow/pages/main_tab.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/material.dart';

import 'main_list.dart';

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
        return MainTab();
      case 1:
        return AccountList();
      case 2:
        return CategoryList();
      case 3:
        return OperationList();
      default:
        return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cashflow'),
        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.filter_list, color: Colors.white,),
//            onPressed: (){
//              (body() as MainList).filterList();
//            },
//          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<AppMenu>(
              child: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem<AppMenu>(
                  child: Text(AppLocalizations.of(context).itemMenuService.toUpperCase()),
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
            icon: Icon(Icons.home),
            title: Text(AppLocalizations.of(context).itemBarMain),
          ),
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
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          (body() as MainList).addItem(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

enum AppMenu { BACKUP }
