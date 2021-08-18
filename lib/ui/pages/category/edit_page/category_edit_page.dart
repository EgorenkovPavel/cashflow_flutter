import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/domain/models/sum_on_date.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/category/edit_page/category_edit_page_bloc.dart';
import 'package:money_tracker/ui/pages/operation/list_divider_operation.dart';
import 'package:money_tracker/ui/pages/operation/list_tile_operation.dart';
import 'package:money_tracker/ui/widgets/dropdown_list.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CategoryEditPage extends StatefulWidget {
  final int id;

  const CategoryEditPage({Key? key, required this.id}) : super(key: key);

  @override
  _CategoryEditPageState createState() => _CategoryEditPageState();
}

class _CategoryEditPageState extends State<CategoryEditPage>
    with SingleTickerProviderStateMixin {
  late CategoryBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = CategoryBloc(context.read<Repository>())..fetch(widget.id);
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  //TODO add sliver list

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      bloc: _bloc,
      buildWhen: (previousState, currentState) {
        return currentState is DateState;
      },
      listener: (context, state) {
        if (state is Close) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text((state as DateState).title),
            actions: [
              IconButton(
                  onPressed: () =>
                      PageNavigator.openCategoryEditPage(context, id: widget.id),
                  icon: Icon(Icons.edit))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Statistics',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(
                          height: 200.0,
                          child: _Diagramm(
                            id: widget.id,
                            budget: (state as DateState).budget,
                            budgetType: (state as DateState).budgetType,
                          )),
                    ],
                  ),
                ),
                StreamBuilder(
                  stream: context
                      .read<Repository>()
                      .watchAllOperationsByCategory(widget.id),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Operation>> snapshot) {
                    var list = <Operation>[];
                    if (snapshot.hasData) {
                      list = snapshot.data!;
                    }

                    return Column(
                      children: list
                          .expand(
                            (e) => [
                          if (list.indexOf(e) == 0)
                            ListDividerOperation.month(null, e)
                          else
                            ListDividerOperation.month(
                                list[list.indexOf(e) - 1], e),
                          ListTileOperation(e,
                              onTap: () =>
                                  PageNavigator.openOperationEditPage(
                                      context, e.id))
                        ],
                      )
                          .toList(),
                    );
                  },
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => PageNavigator.openOperationInputPage(context),
            child: Icon(Icons.add),
          ),
        );
      },

    );
  }
}

class _Diagramm extends StatelessWidget {
  final int id;
  final int budget;
  final BudgetType budgetType;

  const _Diagramm(
      {Key? key,
      required this.id,
      required this.budget,
      required this.budgetType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SumOnDate>>(
      stream: budgetType == BudgetType.MONTH
          ? context.read<Repository>().watchCashflowByCategoryByMonth(id)
          : context.read<Repository>().watchCashflowByCategoryByYear(id),
      builder: (context, snapshot) {
        var data = <SumOnDate>[];
        if (snapshot.hasData) {
          data = snapshot.data!;
        } else {
          return SizedBox(
            height: 60.0,
            child: CircularProgressIndicator(),
          );
        }

        if (data.isEmpty) {
          return SizedBox(
            height: 60.0,
            child: Text('No data'),
          );
        }

        data.sort((s1, s2) =>
            s1.date.microsecondsSinceEpoch - s2.date.microsecondsSinceEpoch);

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: data.length * 50,
            child: charts.BarChart(
              [
                charts.Series<SumOnDate, String>(
                  id: 'Cashflow',
                  colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                  domainFn: (SumOnDate sales, _) =>
                      DateFormat.yM().format(sales.date),
                  measureFn: (SumOnDate sales, _) => sales.sum,
                  data: data,
                )
              ],
              animate: false,
              primaryMeasureAxis:
                  charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
              behaviors: [
                charts.RangeAnnotation(
                  [
                    charts.LineAnnotationSegment(
                        budget, charts.RangeAnnotationAxisType.measure,
                        startLabel: 'budget',
                        //endLabel: 'Measure 2 End',
                        color: charts.MaterialPalette.gray.shade400),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
