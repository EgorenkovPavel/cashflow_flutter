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

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = CategoryBloc(context.read<Repository>())..fetch(widget.id);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _budgetController.dispose();
    _bloc.close();
    super.dispose();
  }

  //TODO add sliver list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<CategoryBloc, CategoryState>(
          bloc: _bloc,
          buildWhen: (previousState, currentState) {
            return currentState is DateState;
          },
          builder: (context, state) {
            _titleController.text = (state as DateState).title;
            _budgetController.text = (state as DateState).budget.toString();

            return Column(
              children: [

                    Container(
                      color: Theme.of(context).primaryColor,
                      child: Column(
                        children: [
                          _InputField(
                            title: 'Title',
                            textEditingController: _titleController,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: _InputField(
                                  title: 'Budget',
                                  keyboardType: TextInputType.number,
                                  textEditingController: _budgetController,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: DropdownList<BudgetType>(
                                    value: state.budgetType,
                                    onChange: (type) {
                                      if (type != null) {
                                        _bloc.onBudgetTypeChanged(type);
                                      }
                                    },
                                    hint: 'Budget type',
                                    items: [BudgetType.MONTH, BudgetType.YEAR],
                                    getListItem: (data) => ListTile(
                                      title: Text(getBudgetTypeTitle(data)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ButtonBar(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    _bloc.save(
                                        _titleController.text, int.parse(_budgetController.text));
                                  },
                                  child: Text('Save'))
                            ],
                          ),
                        ],
                      ),
                    ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Statistics',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(height: 200.0, child: _Diagramm(id: widget.id)),
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
            );
          },
          listener: (context, state) {
            if (state is Close) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PageNavigator.openOperationInputPage(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _Diagramm extends StatelessWidget {
  final int id;

  const _Diagramm({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SumOnDate>>(
        stream: context.read<Repository>().watchCashflowByCategory(id),
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

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: data.length * 20,
              child: charts.BarChart(
                [
                  charts.Series<SumOnDate, String>(
                    id: 'Cashflow',
                    colorFn: (_, __) =>
                        charts.MaterialPalette.blue.shadeDefault,
                    domainFn: (SumOnDate sales, _) =>
                        DateFormat.yM().format(sales.date),
                    measureFn: (SumOnDate sales, _) => sales.sum,
                    data: data,
                  )
                ],
                animate: false,
                behaviors: [
                  new charts.RangeAnnotation([
                    charts.LineAnnotationSegment(
                        200000, charts.RangeAnnotationAxisType.measure,
                        startLabel: 'Measure 2 Start',
                        endLabel: 'Measure 2 End',
                        color: charts.MaterialPalette.gray.shade400),
                  ]),
                ],
              ),
            ),
          );
        });
  }
}

class _InputField extends StatelessWidget {
  final String title;
  final TextInputType? keyboardType;
  final TextEditingController textEditingController;

  const _InputField({
    Key? key,
    required this.title,
    this.keyboardType,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.white),
          ),
          TextField(
            controller: textEditingController,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
