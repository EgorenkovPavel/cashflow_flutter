import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/cards/cashflow_card.dart';
import 'package:cashflow/widgets/cards/last_operations_card.dart';
import 'package:cashflow/widgets/cards/total_balance_card.dart';
import 'package:cashflow/widgets/lists/operation_list.dart';
import 'package:cashflow/widgets/pages/backup_page.dart';
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
      body: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TotalBalanceCard(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CashflowCard(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LastOperationsCard(),
                ),
                SizedBox(
                  height: 60.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

enum AppMenu { BACKUP }
