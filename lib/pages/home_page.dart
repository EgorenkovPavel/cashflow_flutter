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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Widget> tabs = [];

  @override
  void initState() {
    super.initState();
    tabs = [
      MainTab(),
      AccountList(),
      CategoryList(),
      OperationList(),
    ];

    _tabController = TabController(length: tabs.length, vsync: this);
  }

  Widget body(_selectedIndex) {
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
                itemBuilder: (context) => [
                  PopupMenuItem<AppMenu>(
                    child: Text(AppLocalizations.of(context)
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
          children: [
            body(0),
            body(1),
            body(2),
            body(3),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            if (_tabController.index != 0) {
              (body(_tabController.index) as MainList).addItem(context);
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 4.0,
          child: Padding(
            padding: const EdgeInsets.only(right: 80.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                tabTitle(context, 0, Icons.home,
                    AppLocalizations.of(context).itemBarMain),
                tabTitle(context, 1, Icons.account_balance_wallet,
                    AppLocalizations.of(context).itemBarAccounts),
                tabTitle(context, 2, Icons.dns,
                    AppLocalizations.of(context).itemBarCategories),
                tabTitle(context, 3, Icons.view_list,
                    AppLocalizations.of(context).itemBarOperations),
              ],
            ),
          ),
        ));
  }

  Widget tabTitle(
      BuildContext context, int index, IconData icon, String title) {
    var _tween = ColorTween(begin: Colors.black26, end: Colors.amber);

    return AnimatedBuilder(
      animation: _tabController.animation,
      builder: (BuildContext context, Widget child) => Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: GestureDetector(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  icon,
                  color: _tween.transform(max(
                      1 - (index - _tabController.animation.value).abs(), 0)),
                ),
                Transform.scale(
                  scale: 1.0 -
                      min((index - _tabController.animation.value).abs(), 1.0),
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Colors.amber),
                  ),
                ),
              ],
            ),
          ),
          onTap: () => _tabController.animateTo(index),
        ),
      ),
    );
  }
}

enum AppMenu { BACKUP }
