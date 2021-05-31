import 'package:cashflow/data/objects/budget.dart';
import 'package:cashflow/data/objects/budget_type.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/objects/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/widgets/pages/budget/budget_card.dart';
import 'package:cashflow/widgets/sliver_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BudgetList extends StatelessWidget {
  const BudgetList();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      semanticChildCount: 2,
      slivers: <Widget>[
        BudgetListHeader(
          title: 'Month budgets',
          onAdd: () => BudgetCard.add(context, BudgetType.MONTH),
        ),
        StreamBuilder<List<Budget>>(
            stream: Provider.of<Repository>(context)
                .watchBudgetByType(BudgetType.MONTH),
            builder: (context, snapshot) {
              List<Budget> budgets = [];

              if (snapshot.hasData) {
                budgets.addAll(snapshot.data!);
              }

              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _BudgetListTile(
                    budget: budgets[index],
                    spend: 100,
                  );
                },
                childCount: budgets.length,
              ));
            }),
        BudgetListHeader(
          title: 'Year budgets',
          onAdd: () => BudgetCard.add(context, BudgetType.YEAR),
        ),
        StreamBuilder<List<Budget>>(
            stream: Provider.of<Repository>(context)
                .watchBudgetByType(BudgetType.YEAR),
            builder: (context, snapshot) {
              List<Budget> budgets = [];

              if (snapshot.hasData) {
                budgets.addAll(snapshot.data!);
              }

              return SliverList(
                  delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return _BudgetListTile(
                    budget: budgets[index],
                    spend: 100,
                  );
                },
                childCount: budgets.length,
              ));
            }),
      ],
    );
  }
}

class BudgetListHeader extends StatelessWidget {
  const BudgetListHeader({Key? key, required String title, this.onAdd})
      : _title = title,
        super(key: key);

  final String _title;
  final void Function()? onAdd;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        minHeight: 60,
        maxHeight: 60,
        child: Container(
            color: Theme.of(context).backgroundColor,
            child: Stack(
              alignment: Alignment.center,
                children: [
              Center(child: Text(_title, style: Theme.of(context).textTheme.headline6,)),
              Positioned(child: IconButton(icon: Icon(Icons.add),onPressed: onAdd,), right: 0.0,)
            ])),
      ),
    );
  }
}

class _BudgetListTile extends StatelessWidget {
  final Budget budget;
  final int spend;

  const _BudgetListTile({Key? key, required this.budget, required this.spend})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(budget.category.title),
            LinearProgressIndicator(
              minHeight: 10.0,
              value: budget.sum == 0 ? 1.0 : spend / budget.sum,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('0'), Text('$spend'), Text('${budget.sum}')],
            ),
            Text('Rest: ${budget.sum - spend}')
          ],
        ),
      ),
    );
  }
}
