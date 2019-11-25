import 'package:cashflow/pages/account_page.dart';
import 'package:cashflow/pages/backup_page.dart';
import 'package:cashflow/pages/master_page.dart';
import 'package:cashflow/widgets/account_list.dart';
import 'package:cashflow/widgets/category_list.dart';
import 'package:cashflow/widgets/operation_list.dart';
import 'package:flutter/material.dart';

import 'category_page.dart';

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

    switch(_selectedIndex){
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
        Navigator.of(context).pushNamed(AccountPage.routeName);
      } else if (_selectedIndex == 1) {
        Navigator.of(context).pushNamed(CategoryPage.routeName);
      } else if (_selectedIndex == 2) {
        Navigator.of(context).pushNamed(MasterPage.routeName);
      }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cashflow'),
        actions: <Widget>[
          PopupMenuButton<AppMenu>(
            child: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem<AppMenu>(
                child: Text('BACKUP'),
                value: AppMenu.BACKUP,
              )
            ],
            onSelected: (value){
              switch (value){
                case AppMenu.BACKUP: {
                  Navigator.of(context).pushNamed(BackupPage.routeName);
                  break;
                }
              }
            },
          ),
        ],
      ),
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text('Accounts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dns),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            title: Text('Operations'),
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
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

enum AppMenu{
  BACKUP
}