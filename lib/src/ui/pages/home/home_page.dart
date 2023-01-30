import 'package:flutter/material.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/pages/home/last_operations/last_operations.dart';
import 'package:money_tracker/src/ui/pages/home/month_operations/month_operations.dart';
import 'package:money_tracker/src/ui/pages/home/sync_button.dart';
import 'package:money_tracker/src/ui/pages/home/top_header/top_header.dart';
import 'package:money_tracker/src/utils/extensions.dart';

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
            onPressed: () => context.openReportsPage(),
            icon: const Icon(Icons.analytics),
          ),
          IconButton(
            onPressed: () => context.openSettingsPage(),
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
              onPressed: () => context.openAccountInputDialog(),
            ),
            const MonthOperations(),
            const SizedBox(height: 8.0),
            const LastOperations(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.openOperationInputPage(),
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
