import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/cards/cashflow_card.dart';
import 'package:cashflow/widgets/cards/last_operations_card.dart';
import 'package:cashflow/widgets/cards/total_balance_card.dart';
import 'package:cashflow/widgets/pages/operation/operation_list.dart';
import 'package:cashflow/widgets/pages/service/backup_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  final List<Widget> _cards = [
    TotalBalanceCard(),
    CashflowCard(),
    LastOperationsCard()
  ];

  Widget wrapCard(Widget w) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: w,
      ));

  Widget appBarMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PopupMenuButton<AppMenu>(
        itemBuilder: (context) => [
          PopupMenuItem<AppMenu>(
            value: AppMenu.BACKUP,
            child: Text(
                AppLocalizations.of(context).itemMenuService.toUpperCase()),
          )
        ],
        onSelected: (value) {
          switch (value) {
            case AppMenu.BACKUP:
              {
                BackupPage.open(context);
                break;
              }
          }
        },
        child: Icon(Icons.more_vert),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cashflow'),
        actions: <Widget>[
          appBarMenu(context),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green, Colors.greenAccent])),
        child: ListView(
          children: _cards.map(wrapCard).toList()
            ..add(SizedBox(
              height: 60.0,
            )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => OperationList.addItem(context),
          child: Icon(Icons.add),),
    );
  }
}

enum AppMenu { BACKUP }
