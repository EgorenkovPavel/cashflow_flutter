import 'dart:async';

import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/pages/old/account_page.dart';
import 'package:cashflow/pages/old/category_page.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TestWidget();
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({
    Key key,
  }) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  List<bool> isExpanded = List.generate(3, (_) => false);

  List<AccountWithBalance> accounts = [];
  List<CategoryCashflowBudget> categoriesInput = [];
  List<CategoryCashflowBudget> categoriesOutput = [];

  StreamSubscription<List<AccountWithBalance>> subAccount;
  StreamSubscription<List<CategoryCashflowBudget>> subCategory;

  @override
  void initState() {
    super.initState();
    subAccount = Provider.of<Model>(context, listen: false)
        .watchAllAccountsWithBalance()
        .listen((list) {
      setState(() {
        accounts = list;
      });
    });
    subCategory = Provider.of<Model>(context, listen: false)
        .watchAllCategoryCashflowBudget(DateTime.now())
        .listen((list) {
      setState(() {
        categoriesInput = list
            .where((category) =>
                category.category.operationType == OperationType.INPUT)
            .toList();

        categoriesOutput = list
            .where((category) =>
                category.category.operationType == OperationType.OUTPUT)
            .toList();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    subAccount.cancel();
    subCategory.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: ExpansionPanelList(
          expansionCallback: (pos, isExp) {
            setState(() {
              isExpanded[pos] = !isExp;
            });
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    AppLocalizations.of(context).titleTotalSum,
                    style: Theme.of(context).textTheme.title,
                  ),
                  trailing: Text(
                    accounts
                        .map((account) => account.sum)
                        .fold(0, (a, b) => a + b)
                        .toString(),
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              },
              body: Column(
                children: accounts
                    .map((account) => ListTile(
                          title: Text(account.account.title),
                          trailing: Text(account.sum.toString()),
                        ))
                    .toList(),
              ),
              isExpanded: isExpanded[0],
              canTapOnHeader: true,
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                int totalBudget = categoriesInput
                    .map((category) => category.budget)
                    .fold(0, (a, b) => a + b);

                int totalCashflow = categoriesInput
                    .map((category) => category.cashflow)
                    .fold(0, (a, b) => a + b);

                return ListTile(
                  title: Text(AppLocalizations.of(context).typeInput),
                  subtitle: Text(
                    '${AppLocalizations.of(context).titleBudget} $totalBudget',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  trailing: Text(
                    '$totalCashflow',
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              },
              body: Column(
                children: categoriesInput
                    .map((category) => CategoryListItem(category))
                    .toList(),
              ),
              isExpanded: isExpanded[1],
              canTapOnHeader: true,
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                int totalBudget = categoriesOutput
                    .map((category) => category.budget)
                    .fold(0, (a, b) => a + b);

                int totalCashflow = categoriesOutput
                    .map((category) => category.cashflow)
                    .fold(0, (a, b) => a + b);

                return ListTile(
                  title: Text(AppLocalizations.of(context).typeOutput),
                  subtitle: Text(
                    '${AppLocalizations.of(context).titleBudget} $totalBudget',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  trailing: Text(
                    '$totalCashflow',
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              },
              body: Column(
                children: categoriesOutput
                    .map((category) => CategoryListItem(category))
                    .toList(),
              ),
              isExpanded: isExpanded[2],
              canTapOnHeader: true,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  final CategoryCashflowBudget category;

  const CategoryListItem(this.category, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.category.title),
      subtitle: Text(
        '${AppLocalizations.of(context).titleBudget} ${category.budget}',
        style: Theme.of(context).textTheme.caption,
      ),
      trailing: Text(category.cashflow.toString()),
      onTap: (){
        Navigator.of(context).pushNamed(CategoryPage.routeName, arguments: category.category.id);
      },
    );
  }
}
