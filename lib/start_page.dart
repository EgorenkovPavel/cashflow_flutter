import 'package:cashflow/data/repository.dart';
import 'package:cashflow/widgets/pages/account/account_list.dart';
import 'package:cashflow/widgets/pages/budget/budeget_list.dart';
import 'package:cashflow/widgets/pages/category/category_list.dart';
import 'package:cashflow/widgets/pages/operation/operation_input_page.dart';
import 'package:cashflow/widgets/pages/operation/operation_list.dart';
import 'package:cashflow/widgets/pages/service/backup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    _OperationList(),
  ];

  static const _barItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Accounts',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Categories',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.school),
      label: 'Budgets',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.school),
      label: 'Operations',
    ),
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
        backgroundColor: Colors.white,
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
        items: _barItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => OperationInputPage.open(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.settings,
        color: Colors.black,
      ),
      onPressed: () => BackupPage.open(context),
    );
  }
}

class _OperationList extends StatelessWidget {
  const _OperationList();

  @override
  Widget build(BuildContext context) {
    return OperationList(context.read<Repository>().watchAllOperations());
  }
}
