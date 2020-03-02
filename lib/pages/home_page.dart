import 'dart:math';

import 'package:cashflow/lists/account_list.dart';
import 'package:cashflow/lists/category_list.dart';
import 'package:cashflow/lists/operation_list.dart';
import 'package:cashflow/pages/backup_page.dart';
import 'package:cashflow/pages/main_tab.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'main_list.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  int _selectedIndex = 0;
  TabController _tabController;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PopupMenuButton<AppMenu>(
                  child: Icon(Icons.more_vert),
                  itemBuilder: (context) =>
                  [
                    PopupMenuItem<AppMenu>(
                      child: Text(AppLocalizations
                          .of(context)
                          .itemMenuService
                          .toUpperCase()),
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
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            MainTab(),
            AccountList(),
            CategoryList(),
            OperationList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 4.0,
            child: Padding(
              padding: const EdgeInsets.only(right: 80.0),
//              child: TabBar(
//                tabs: [
//                  Tab(
//                    icon: new Icon(Icons.home),
//                    text: AppLocalizations.of(context).itemBarMain,
//                  ),
//                  Tab(
//                    icon: new Icon(Icons.account_balance_wallet),
//                    text: AppLocalizations.of(context).itemBarAccounts,
//                  ),
//                  Tab(
//                    icon: new Icon(Icons.dns),
//                    text: AppLocalizations.of(context).itemBarCategories,
//                  ),
//                  Tab(
//                    icon: new Icon(Icons.view_list),
//                    text:  AppLocalizations.of(context).itemBarOperations,
//                  ),
//                ],
//                labelColor: Colors.amber[800],
//                unselectedLabelColor:  Colors.black26,
//                //indicatorSize: TabBarIndicatorSize.tab,
//                //indicatorPadding: EdgeInsets.all(5.0),
//                indicatorColor: Colors.red,
//              ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                tabTitle(context, 0, Icons.home, AppLocalizations.of(context).itemBarMain),
                tabTitle(context, 1, Icons.account_balance_wallet, AppLocalizations.of(context).itemBarAccounts),
                tabTitle(context, 2, Icons.dns, AppLocalizations.of(context).itemBarCategories),
                tabTitle(context, 3, Icons.view_list, AppLocalizations.of(context).itemBarOperations),
              ],
            ),
            ),
          )

    );
  }

  Widget tabTitle(BuildContext context, int index, IconData icon, String title){
    return AnimatedBuilder(
      animation: _tabController.animation,
      builder: (BuildContext context, Widget child) {
        return Transform.scale(
          scale: 1 - (min((index - _tabController.animation.value).abs(), 1)) /2,
          child: child,
        );
      },
      child: GestureDetector(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon),
            Text(title),
          ],
        ),
        onTap: () =>_tabController.animateTo(index),
      ),
    );
  }


//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Cashflow'),
//        actions: <Widget>[
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: PopupMenuButton<AppMenu>(
//              child: Icon(Icons.more_vert),
//              itemBuilder: (context) => [
//                PopupMenuItem<AppMenu>(
//                  child: Text(AppLocalizations.of(context)
//                      .itemMenuService
//                      .toUpperCase()),
//                  value: AppMenu.BACKUP,
//                )
//              ],
//              onSelected: (value) {
//                switch (value) {
//                  case AppMenu.BACKUP:
//                    {
//                      Navigator.of(context).pushNamed(BackupPage.routeName);
//                      break;
//                    }
//                }
//              },
//            ),
//          ),
//        ],
//      ),
//      body: body(),
//      bottomNavigationBar: BottomNavigationBar(
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text(AppLocalizations.of(context).itemBarMain),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.account_balance_wallet),
//            title: Text(AppLocalizations.of(context).itemBarAccounts),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.dns),
//            title: Text(AppLocalizations.of(context).itemBarCategories),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.view_list),
//            title: Text(AppLocalizations.of(context).itemBarOperations),
//          ),
//        ],
//        type: BottomNavigationBarType.fixed,
//        currentIndex: _selectedIndex,
//        selectedItemColor: Colors.amber[800],
//        onTap: _onItemTapped,
//      ),
//      floatingActionButton: _selectedIndex == 0
//          ? SizedBox()
//          : FloatingActionButton(
//              child: Icon(Icons.add),
//              onPressed: () {
//                (body() as MainList).addItem(context);
//              },
//            ),
//    );
//  }
}

enum AppMenu { BACKUP }
