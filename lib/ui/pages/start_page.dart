import 'package:flutter/material.dart';
import 'package:money_tracker/ui/pages/account/account_list.dart';
import 'package:money_tracker/ui/pages/budget/budget_list.dart';
import 'package:money_tracker/ui/pages/category/category_list.dart';
import 'package:money_tracker/ui/pages/operation/operation_list.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/utils/app_localization.dart';

class StartPage extends StatefulWidget {

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    AccountList(),
    CategoryList(),
    BudgetList(),
    OperationList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //brightness: Brightness.light,
        //backgroundColor: Colors.white,
        title: Text(
          'Money tracker',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          SettingsButton(),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 30.0,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: AppLocalizations.of(context).accounts,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.label),
            label: AppLocalizations.of(context).categories,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: AppLocalizations.of(context).budgets,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: AppLocalizations.of(context).operations,
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => PageNavigator.openOperationInputPage(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.settings,
        //color: Theme.of(context).appBarTheme.color,
      ),
      onPressed: () => PageNavigator.openBackupPage(context),
    );
  }
}