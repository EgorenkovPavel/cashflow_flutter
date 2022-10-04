import 'package:flutter/material.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/home/last_operations/last_operations.dart';
import 'package:money_tracker/ui/pages/home/month_operations/month_operations.dart';
import 'package:money_tracker/ui/pages/home/sync_button.dart';
import 'package:money_tracker/ui/pages/home/top_header/top_header.dart';
import 'package:money_tracker/utils/extensions.dart';

import '../../../injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money tracker'),
        elevation: 0.0,
        actions: [
          const SyncButton(),
          IconButton(
            onPressed: () => sl<PageNavigator>().openReportsPage(context),
            icon: const Icon(Icons.analytics),
          ),
          IconButton(
            onPressed: () => sl<PageNavigator>().openSettingsPage(context),
            icon: const Icon(Icons.settings_sharp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopHeader(),
            _AddButton(
              title: context.loc.btnAddAccount,
              onPressed: () => sl<PageNavigator>().openAccountInputDialog(context),
            ),
            const MonthOperations(),
            const SizedBox(height: 8.0),
            const LastOperations(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => sl<PageNavigator>().openOperationInputPage(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
        icon: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: onPressed,
        label: Text(
          title.toUpperCase(),
          style: const TextStyle()
              .copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
