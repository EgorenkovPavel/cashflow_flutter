

import 'package:cashflow/widgets/sliver_header_delegate.dart';
import 'package:flutter/material.dart';

class BudgetList extends StatelessWidget {

  const BudgetList();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      semanticChildCount: 2,
      slivers: <Widget>[
        BudgetListHeader(
          title: 'Month budgets',
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return BudgetListTile();
          },
          childCount: 10,
        )),
        BudgetListHeader(
          title: 'Year budgets',
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return BudgetListTile();
          },
          childCount: 10,
        )),
      ],
    );
  }
}

class BudgetListHeader extends StatelessWidget {
  const BudgetListHeader({Key key, @required String title})
      : _title = title,
        super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        minHeight: 60,
        maxHeight: 60,
        child: Container(color: Colors.white, child: Center(child: Text(_title))),
      ),
    );
  }
}

class BudgetListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Food'),
            LinearProgressIndicator(
              minHeight: 10.0,
              value: 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('0.0'),
                Text('1000'),
                Text('10000')
              ],
            ),
            Text('Rest: 9000')
          ],
        ),
      ),
    );
  }
}
