import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/domain/models/sum_on_date.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/category/edit_page/category_edit_page_bloc.dart';
import 'package:money_tracker/ui/pages/operation/list_tile_operation.dart';
import 'package:money_tracker/ui/pages/operation/operation_list.dart';
import 'package:money_tracker/utils/app_localization.dart';
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
    _bloc = CategoryBloc(Provider.of<Repository>(context, listen: false))
      ..fetch(widget.id);
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
        child: Column(
          children: [
            _InputField(
              title: 'Title',
              textEditingController: _titleController,
            ),
            _InputField(
              title: 'Budget',
              keyboardType: TextInputType.number,
              textEditingController: _budgetController,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Statistics', style: Theme.of(context).textTheme.caption,),
                  SizedBox(
                      height: 200.0,
                      child: _Diagramm(id: widget.id)),
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
                      .map((e) => ListTileOperation(e,
                          onTap: () => PageNavigator.openOperationEditPage(
                              context, e.id)))
                      .toList(),
                );
              },
            )
          ],
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


class _Diagramm extends StatelessWidget{

  final int id;

  const _Diagramm({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SumOnDate>>(
      stream: context.read<Repository>().watchCashflowByCategory(id),
      builder: (context, snapshot) {

        var data = <SumOnDate>[];
        if(snapshot.hasData){
          data = snapshot.data!;
        }

        return charts.BarChart(
          [
            charts.Series<SumOnDate, String>(
              id: 'Cashflow',
              colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
              domainFn: (SumOnDate sales, _) => DateFormat.yM().format(sales.date),
              measureFn: (SumOnDate sales, _) => sales.sum,
              data: data,
            )
          ],
          animate: false,
          behaviors: [
        new charts.RangeAnnotation([
            charts.LineAnnotationSegment(
                300, charts.RangeAnnotationAxisType.measure,
                startLabel: 'Measure 2 Start',
                endLabel: 'Measure 2 End',
                color: charts.MaterialPalette.gray.shade400),
        ]),
          ],
        );
      }
    );
  }

}

class _InputField extends StatelessWidget {
  final String title;
  final TextInputType? keyboardType;
  final TextEditingController textEditingController;

  const _InputField({
    Key? key,
    required this.title,
    this.keyboardType, required this.textEditingController,
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
            style: Theme.of(context).textTheme.caption,
          ),
          TextField(
            controller: textEditingController,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
