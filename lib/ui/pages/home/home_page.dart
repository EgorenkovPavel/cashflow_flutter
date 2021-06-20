import 'package:flutter/material.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/home/budget_subtitle.dart';
import 'package:money_tracker/ui/pages/home/last_operations.dart';
import 'package:money_tracker/ui/pages/home/top_header.dart';

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
            BudgetSubtitle(type: OperationType.INPUT),
            BudgetSubtitle(type: OperationType.OUTPUT),
            LastOperations(),
            SizedBox(height: 80.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => PageNavigator.openOperationInputPage(context),
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}

