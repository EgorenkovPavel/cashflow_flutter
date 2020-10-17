import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/pages/category_input_page.dart';
import 'package:flutter/material.dart';

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
        onPressed: () => CategoryInputPage.open(context, type: type),
      ),
    );
  }
}
