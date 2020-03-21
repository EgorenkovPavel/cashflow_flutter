import 'dart:math';

import 'package:cashflow/data/repository.dart';
import 'package:cashflow/widgets/lists/account_list.dart';
import 'package:cashflow/widgets/lists/category_list.dart';
import 'package:cashflow/widgets/lists/operation_list.dart';
import 'package:cashflow/widgets/pages/backup_page.dart';
import 'package:cashflow/widgets/pages/main_tab.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../lists/main_list.dart';

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

    final Repository repository = Provider.of<Repository>(context, listen: false);
    tabs = [
      MainTab(),
      AccountList(repository.watchAllAccountsBalance()),
      CategoryList(repository.watchAllCategories()),
      OperationList(repository.watchAllOperations()),
    ];

    _tabController = TabController(length: tabs.length, vsync: this);
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
            pageWidget(context, 0, tabs[0]),
            pageWidget(context, 1, tabs[1]),
            pageWidget(context, 2, tabs[2]),
            pageWidget(context, 3, tabs[3]),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            if (_tabController.index != 0) {
              (tabs[_tabController.index] as MainList).addItem(context);
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

  Widget pageWidget(BuildContext context, int index, Widget child){
    return AnimatedBuilder(
      animation: _tabController.animation,
      builder: (BuildContext context, Widget child) => Padding(
        padding: EdgeInsets.all((index - _tabController.animation.value).abs() * 30),
        child: Material(child: child, elevation: 16.0,),
      ),
      child: child,
    );
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
