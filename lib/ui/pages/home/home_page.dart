import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/home/last_operations.dart';
import 'package:money_tracker/ui/pages/home/month_operations.dart';
import 'package:money_tracker/ui/pages/home/top_header.dart';
import 'package:money_tracker/utils/app_localization.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money tracker'),
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () => PageNavigator.openReportsPage(context),
            icon: Icon(Icons.analytics),
          ),
          IconButton(
            onPressed: () => PageNavigator.openSettingsPage(context),
            icon: Icon(Icons.settings_sharp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(),
            _AddButton(
              title: AppLocalizations.of(context).btnAddAccount,
              onPressed: () => PageNavigator.openAccountInputPage(context),
            ),
            MonthOperations(),
            SizedBox(height: 8.0,),
            LastOperations(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => PageNavigator.openOperationInputPage(context),
        child: Icon(Icons.add),
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
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Text(
              title.toUpperCase(),
              style: TextStyle().copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
