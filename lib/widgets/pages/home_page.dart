import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/lists/operation_list.dart';
import 'package:cashflow/widgets/pages/backup_page.dart';
import 'package:cashflow/widgets/pages/main_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  Widget appBarMenu(BuildContext context){
    return Padding(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).itemBarMain),
        actions: <Widget>[
          appBarMenu(context),
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
