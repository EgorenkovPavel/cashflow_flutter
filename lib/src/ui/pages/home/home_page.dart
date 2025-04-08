import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/view_models.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/blocs/account_balance_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import 'home_page_cards/accounts_card.dart';
import 'home_page_cards/last_operations/last_operations.dart';
import 'home_page_cards/month_operations.dart';
import 'home_page_cards/totals_card.dart';
import 'sync_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money tracker'),
        actions: [
          const SyncButton(),
          IconButton(
            onPressed: () => context.openReportsPage(),
            icon: const Icon(Icons.analytics, color: Colors.black),
          ),
          IconButton(
            onPressed: () => context.openSettingsPage(),
            icon: const Icon(Icons.settings_sharp, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: <Widget>[
              TotalsCard(),
              AccountsCard(
                title: context.loc.accounts,
                accounts: context.watchAccountBalances(),
                onAdd: () => context.openAccountInputDialog(),
              ),
              AccountsCard(
                title: context.loc.debts,
                accounts: context.watchDebtBalances(),
                onAdd: () => context.openDebtInputDialog(),
              ),
              MonthOperations(type: CategoryType.INPUT),
              MonthOperations(type: CategoryType.OUTPUT),
              LastOperations(),
            ]
                .map((e) => Padding(
                      padding: EdgeInsets.all(4.0),
                      child: e,
                    ))
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.openOperationInputPage(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
