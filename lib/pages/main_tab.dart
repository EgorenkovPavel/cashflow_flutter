import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/data/operation_type.dart';
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

  List<bool> isExpanded = List.generate(3, (_)=> false);

  List<AccountWithBalance> accounts = [];
  List<CategoryCashflowBudget> categoriesInput = [];
  List<CategoryCashflowBudget> categoriesOutput = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<Model>(context).watchAllAccountsWithBalance().listen((list) {
      setState(() {
        accounts = list;
      });
    });
    Provider.of<Model>(context).watchAllCategoryCashflowBudget(DateTime.now()).listen((list) {
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
                      accounts.isNotEmpty
                          ? accounts
                              .map((account) => account.sum)
                              .reduce((a, b) => a + b)
                              .toString()
                          : '0',
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
                isExpanded: isExpanded[0]),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {

                int totalBudget = categoriesInput.isNotEmpty
                    ? categoriesInput
                    .map((category) => category.budget)
                    .reduce((a, b) => a + b) : 0;

                int totalCashflow = categoriesInput.isNotEmpty
                    ? categoriesInput
                    .map((category) => category.cashflow)
                    .reduce((a, b) => a + b) : 0;

                return ListTile(
                  title: Text('Input'),
                  subtitle: Text('Budget $totalBudget',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  trailing: Text('$totalCashflow',
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              },
              body: Column(
                children: categoriesInput
                    .map((category) => ListTile(
                          title: Text(category.category.title),
                          subtitle: Text(category.budget.toString()),
                          trailing: Text(category.cashflow.toString()),
                        ))
                    .toList(),
              ),
              isExpanded: isExpanded[1],
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {

                int totalBudget = categoriesOutput.isNotEmpty
                    ? categoriesOutput
                    .map((category) => category.budget)
                    .reduce((a, b) => a + b) : 0;

                int totalCashflow = categoriesOutput.isNotEmpty
                    ? categoriesOutput
                    .map((category) => category.cashflow)
                    .reduce((a, b) => a + b) : 0;

                return ListTile(
                  title: Text('Output'),
                  subtitle: Text('Budget $totalBudget',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  trailing: Text('$totalCashflow',
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              },
              body: Column(
                children: categoriesOutput
                    .map((category) => ListTile(
                  title: Text(category.category.title),
                  subtitle: Text(category.budget.toString()),
                  trailing: Text(category.cashflow.toString()),
                ))
                    .toList(),
              ),
              isExpanded: isExpanded[2],
            ),
          ],
        ),
      ),
    );
  }
}
