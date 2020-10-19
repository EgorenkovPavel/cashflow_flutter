import 'package:cashflow/data/objects/category_cashflow_budget.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/charts/balance_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportsPage extends StatelessWidget {
  static const routeName = '/reports';

  static open(BuildContext context) {
    Navigator.of(context).pushNamed(ReportsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations
            .of(context)
            .titleReports),
      ),
      body: StreamBuilder<List<CategoryCashflowBudget>>(
        stream: Provider.of<Repository>(context)
            .watchAllCategoryCashflowBudget(DateTime.now()),
        builder: (BuildContext context, AsyncSnapshot<List<CategoryCashflowBudget>> snapshot) {
          return SingleChildScrollView(child: CategoryTable(categories: snapshot.data));
        },
      ),
    );
  }
}

class CategoryTable extends StatelessWidget{

  final List<CategoryCashflowBudget> categories;

  const CategoryTable({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
         DataColumn(
          label: Text(
            'Category',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          numeric: true,
          label: Text(
            'Budget',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          numeric: true,
          label: Text(
            'Cashflow',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: categories
          .where((c) => c.budget > 0 || c.cashflow > 0)
          .map((c) =>
        DataRow(cells: [
          DataCell(Row(
            children: [
              Icon(getOperationIcon(c.type), color: getOperationColor(c.type),),
              Expanded(child: Text(c.title)),
            ],
          )),
          DataCell(Text('${c.budget}')),
          DataCell(Text('${c.cashflow}')),
        ])
      ).toList(),
     );
  }
}