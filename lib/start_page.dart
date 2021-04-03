import 'package:cashflow/data/objects/account_balance.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/widgets/pages/account/account_edit_page.dart';
import 'package:cashflow/widgets/pages/account/account_input_page.dart';
import 'package:cashflow/widgets/pages/category/category_input_page.dart';
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

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    AccountList(),
    CategoryList(),
    BudgetList(),
    _OperationList(),
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
          'Cashflow',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                BackupPage.open(context);
              })
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 30.0,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          OperationInputPage.open(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class AccountList extends StatelessWidget {
  const AccountList();

  @override
  Widget build(BuildContext context) {
    var stream = context.read<Repository>().watchAllAccountsBalance();
    return StreamBuilder<List<AccountBalance>>(
        stream: stream,
        builder: (context, state) {
          var _accounts = <AccountBalance>[];
          if (state.hasData) {
            _accounts = state.data;
          }
          return GridView.count(
            childAspectRatio: 2.0,
            crossAxisCount: 2,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: _accounts
                .map<Widget>((e) => AccountTile(
                      account: e,
                    ))
                .toList()
                  ..add(AddButton(onTap: (){AccountInputPage.open(context);},)),
          );
        });
  }
}

class AccountTile extends StatelessWidget {
  final AccountBalance account;

  const AccountTile({Key key, this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AccountEditPage.open(context, account.id);
      },
      child: Card(
        //color: Colors.amber,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              account.title,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(account.balance.toString()),
          ],
        )),
      ),
    );
  }
}

class AddButton extends StatelessWidget {

  final void Function() _onTap;

  const AddButton({Key key, onTap}) : _onTap = onTap, super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Card(
        child: Center(child: Icon(Icons.add)),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      semanticChildCount: 2,
      slivers: <Widget>[
        // SliverAppBar(
        //   pinned: true,
        //   backgroundColor: Colors.white,
        //     title: Text(
        //       'Cashflow',
        //       style: Theme.of(context).textTheme.headline6,
        //     ),
        //     actions: [
        //       IconButton(
        //           icon: Icon(
        //             Icons.settings,
        //             color: Colors.black,
        //           ),
        //           onPressed: () {})
        //     ],
        // ),
        CategoryListHeader(
          title: 'Input categories',
        ),
        StreamBuilder<List<Category>>(
            stream: context.read<Repository>().watchAllCategoriesByType(OperationType.INPUT),
            builder: (context, state) {
              var _categories = <Category>[];
              if (state.hasData) {
                _categories = state.data;
              }
              return CategoryGrid(categories: _categories, type: OperationType.INPUT,);
            }),
        CategoryListHeader(
          title: 'Output categories',
        ),
        StreamBuilder<List<Category>>(
            stream: context.read<Repository>().watchAllCategoriesByType(OperationType.OUTPUT),
            builder: (context, state) {
              var _categories = <Category>[];
              if (state.hasData) {
                _categories = state.data;
              }
              return CategoryGrid(categories: _categories, type: OperationType.OUTPUT,);
            }),
      ],
    );
  }
}

class CategoryListHeader extends StatelessWidget {
  const CategoryListHeader({Key key, @required String title})
      : _title = title,
        super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: MySliverAppBar(
        minHeight: 60,
        maxHeight: 60,
        child: Container(color: Colors.white, child: Center(child: Text(_title))),
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    Key key,
    @required List<Category> categories,
    @required OperationType type,
  })  : _categories = categories,
        _type = type,
        super(key: key);

  final List<Category> _categories;
  final OperationType _type;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2.0,
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20.0,
          mainAxisExtent: 100.0),
      delegate: SliverChildListDelegate.fixed(_categories
          .map<Widget>((e) => CategoryListTile(
                category: e,
              ))
          .toList()
            ..add(AddButton(onTap: (){
              CategoryInputPage.open(context, type: _type);
            },))),
    );
  }
}

class CategoryListTile extends StatelessWidget {
  final Category category;

  const CategoryListTile({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(category.title),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  MySliverAppBar(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(MySliverAppBar oldDelegate){
    return maxHeight != oldDelegate.maxHeight
        || minHeight != oldDelegate.minHeight
        || child != oldDelegate.child;
  }
}

class BudgetList extends StatelessWidget {
  
  const BudgetList();
  
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      semanticChildCount: 2,
      slivers: <Widget>[
        CategoryListHeader(
          title: 'Month budgets',
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
                return BudgetListTile();
              },
              childCount: 10,
        )),
        CategoryListHeader(
          title: 'Year budgets',
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return BudgetListTile();
          },
          childCount: 10,
        )),
      ],
    );
  }
}

class BudgetListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Food'),
            LinearProgressIndicator(
              minHeight: 10.0,
              value: 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('0.0'),
                Text('1000'),
                Text('10000')
              ],
            ),
            Text('Rest: 9000')
          ],
        ),
      ),
    );
  }
}

class _OperationList extends StatelessWidget{

  const _OperationList();

  @override
  Widget build(BuildContext context) {
    return OperationList(context.read<Repository>().watchAllOperations());
  }

}