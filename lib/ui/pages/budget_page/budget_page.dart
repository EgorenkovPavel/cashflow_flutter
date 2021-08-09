import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/budget_page/budget_page_bloc.dart';
import 'package:provider/provider.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key, required this.type}) : super(key: key);

  final OperationType type;

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  late BudgetPageBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BudgetPageBloc(context.read<Repository>())..fetch(widget.type);
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  Widget _calcTitle(BudgetPageState state) {
    var start =
        widget.type == OperationType.INPUT ? 'Earning in' : 'Spending in';

    var date = DateFormat.yMMM().format(state.date);

    var sum = state.items
        .map((e) => e.monthCashflow)
        .fold<int>(0, (previousValue, element) => previousValue + element);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$start $date'),
        Text('${NumberFormat().format(sum)}'),
      ],
    ) ;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetPageBloc, BudgetPageState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: _calcTitle(state),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PieDiagram(
                list: state.items,
                onBackPressed: _bloc.onBackPressed,
                onForwardPressed: _bloc.onForwardPressed,
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  var item = state.items[index];
                  return Padding(
                    key: ValueKey(item.category.id),
                    padding: const EdgeInsets.all(8.0),
                    child: CategoryItem(category: item),
                  );
                },
                itemCount: state.items.length,
              )),
              TextButton(
                onPressed: (){
                  if (state.showAll){
                    _bloc.collapse();
                  }else{
                    _bloc.expand();
                  }
                },
                child: Text(!state.showAll ? 'Show all' : 'Collapse'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PieDiagram extends StatelessWidget {
  const PieDiagram(
      {Key? key, required this.list, this.onBackPressed, this.onForwardPressed})
      : super(key: key);

  final void Function()? onBackPressed;
  final void Function()? onForwardPressed;
  final List<CategoryCashflow> list;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onBackPressed,
          icon: Icon(Icons.arrow_back_ios),
        ),
        SizedBox(
          width: 200.0,
          height: 200.0,
          child: charts.PieChart([
            charts.Series<CategoryCashflow, int>(
              id: 'Cashflow',
              domainFn: (CategoryCashflow sales, _) => sales.category.id,
              measureFn: (CategoryCashflow sales, _) => sales.monthCashflow,
              data: list,
            )
          ], animate: true),
        ),
        IconButton(
          onPressed: onForwardPressed,
          icon: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.category}) : super(key: key);

  final CategoryCashflow category;

  static const double _borderWidth = 2.0;
  static const double _height = 30.0;
  static const double _borderRadius = 8.0;
  static const double _leftPadding = 8.0;

  double _partOfWidth(int cashflow) {
    if (cashflow == 0) {
      return 0;
    } else if (cashflow > category.category.budget ||
        category.category.budget == 0) {
      return cashflow / category.monthCashflow;
    } else {
      return cashflow / category.category.budget;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          PageNavigator.openCategoryEditPage(context, category.category.id),
      child: TweenAnimationBuilder<int>(
        tween: IntTween(
          begin: 0,
          end: category.monthCashflow,
        ),
        duration: const Duration(seconds: 1),
        builder: (context, cashflow, _) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  Container(
                    width: constraints.maxWidth,
                    height: _height,
                    padding: const EdgeInsets.only(left: _leftPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_borderRadius),
                      border: Border.all(
                          color: Theme.of(context).accentColor,
                          width: _borderWidth),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${category.category.title} ',
                              style: TextStyle(color: Colors.black87),
                            ),
                            TextSpan(
                              text: NumberFormat().format(cashflow),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth * _partOfWidth(cashflow),
                    height: _height,
                    padding: const EdgeInsets.only(
                        left: _borderWidth + _leftPadding),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(_borderRadius),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        overflow: TextOverflow.clip,
                        softWrap: false,
                        maxLines: 1,
                        text: TextSpan(
                          children: [
                            TextSpan(text: '${category.category.title} '),
                            TextSpan(
                              text: NumberFormat().format(cashflow),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
