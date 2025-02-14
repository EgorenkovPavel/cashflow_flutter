import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/blocs/account_balance_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';
import 'sync_button.dart';

import 'home_page_cards/accounts_card.dart';
import 'home_page_cards/last_operations/last_operations.dart';
import 'home_page_cards/month_operations/month_operations.dart';
import 'home_page_cards/totals_card.dart';

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
            children: [
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: TotalsCard(),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: AccountsCard(
                  title: context.loc.accounts,
                  accounts: context.accounts(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: AccountsCard(
                  title: context.loc.debts,
                  accounts: context.debts(),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: MonthOperations(operationType: OperationType.INPUT),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: MonthOperations(operationType: OperationType.OUTPUT),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: LastOperations(),
              ),
            ],
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

extension BlocExt on BuildContext{
  List<AccountBalance> accounts() =>
      watch<AccountBalanceBloc>()
      .state
      .accountBalances;

  List<DebtBalance> debts() =>
      watch<AccountBalanceBloc>()
      .state
      .debtBalances;
}


