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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).itemBarMain),
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
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => OperationList.addItem(context)),
      body: MainTab(),
    );
  }
}

enum AppMenu { BACKUP }
