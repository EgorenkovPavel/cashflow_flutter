import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/item_cards/category_card.dart';
import 'package:cashflow/widgets/lists/category_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CashflowPage extends StatelessWidget {
  static const String routeName = '/cashflow';

  final OperationType type;

  const CashflowPage({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(AppLocalizations.of(context).titleCashflow),
            Text(
              '${getOperationTitle(context, type)}',
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
//      body: CategoryList(Provider.of<Repository>(context, listen: false)
//          .watchCategoryCashflowBudgetByType(DateTime.now(), type)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => CategoryCard.open(context, type: type),
      ),
    );
  }
}
