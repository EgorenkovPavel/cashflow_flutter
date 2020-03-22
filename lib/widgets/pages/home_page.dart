import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/lists/account_list.dart';
import 'package:cashflow/widgets/lists/category_list.dart';
import 'package:cashflow/widgets/lists/operation_list.dart';
import 'package:cashflow/widgets/pages/backup_page.dart';
import 'package:cashflow/widgets/pages/main_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  Widget getBody() {
    switch (currentPage) {
      case 0:
        return MainTab();
      case 1:
        return AccountList(Provider.of<Repository>(context, listen: false)
            .watchAllAccountsBalance());
      case 2:
        return CategoryList(Provider.of<Repository>(context, listen: false)
            .watchAllCategories());
      case 3:
        return OperationList(Provider.of<Repository>(context, listen: false)
            .watchAllOperations());
      case 4: return BackupPage();
    }
  }

  void addItem() {
    switch (currentPage) {
      case 0:
        OperationList.addItem(context);
        break;
      case 1:
        AccountList.addItem(context);
        break;
      case 2:
        CategoryList.addItem(context);
        break;
      case 3:
        OperationList.addItem(context);
        break;
    }
  }

  String pageTitle(int pageIndex) {
    switch (pageIndex) {
      case 0: return AppLocalizations.of(context).itemBarMain;
      case 1: return AppLocalizations.of(context).itemBarAccounts;
      case 2: return AppLocalizations.of(context).itemBarCategories;
      case 3: return AppLocalizations.of(context).itemBarOperations;
      case 4: return AppLocalizations.of(context).itemMenuService;
    }
  }

  Widget menuItem(int pageIndex, IconData icon) {
    return ListTile(
      leading: currentPage == pageIndex
          ? Icon(
              icon,
              color: Theme.of(context).accentColor,
            )
          : Icon(icon),
      title: currentPage == pageIndex
          ? Text(
              pageTitle(pageIndex),
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: Theme.of(context).accentColor),
            )
          : Text(pageTitle(pageIndex)),
      onTap: () {
        setState(() {
          currentPage = pageIndex;
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle(currentPage)),
      ),
      floatingActionButton: currentPage == 4 ? SizedBox() :
          FloatingActionButton(child: Icon(Icons.add), onPressed: addItem),
      body: getBody(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Center(
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: CircleAvatar(
                    child: FlutterLogo(),
                  ),
                ),
              ),
            ),
            menuItem(0, Icons.home),
            menuItem(1, Icons.account_balance_wallet),
            menuItem(2, Icons.dns),
            menuItem(3, Icons.view_list),
            menuItem(4, Icons.settings),
          ],
        ),
      ),
    );
  }
}
