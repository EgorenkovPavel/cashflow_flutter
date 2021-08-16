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

final _duration = const Duration(seconds: 1);

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

    var date = DateFormat.yMMMM().format(state.date);

    return Text('$start $date');
  }

  int _cashflow(List<CategoryCashflow> items) {
    return items
        .map((e) => e.monthCashflow)
        .fold<int>(0, (previousValue, element) => previousValue + element);
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
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                //pinned: true,
                delegate: TitleDelegate(
                    items: state.items,),
              ),
              SliverPersistentHeader(delegate: DiagammDelegate(items: state.items,
                  onBackPressed: _bloc.onBackPressed,
                  onForwardPressed: _bloc.onForwardPressed)),
              SliverList(
                delegate: SliverChildListDelegate(state.items
                    .map((e) => _CategoryItem(category: e))
                    .toList()),
              ),
              SliverPersistentHeader(delegate: ShowButtonDelegate(
                showAll: state.showAll,
                collapse: _bloc.collapse,
                expand: _bloc.expand,
              ))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () =>
                PageNavigator.openCategoryInputPage(context, type: widget.type),
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class ShowButtonDelegate extends SliverPersistentHeaderDelegate{

  final bool showAll;
  final void Function() collapse;
  final void Function() expand;

  ShowButtonDelegate({required this.showAll, required this.collapse, required this.expand});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _ShowAllButton(
                            onPressed: showAll
                                ? collapse
                                : expand,
                            showAll: !showAll)
                      ;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 50;

  @override
  // TODO: implement minExtent
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

}

class DiagammDelegate extends SliverPersistentHeaderDelegate{

  final List<CategoryCashflow> items;
  final void Function() onBackPressed;
  final void Function() onForwardPressed;

  DiagammDelegate(
      {required this.items,
        required this.onBackPressed,
        required this.onForwardPressed});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return
    PieDiagram(
      list: items.where((item) => item.monthCashflow > 0).toList(),
      onBackPressed: onBackPressed,
      onForwardPressed: onForwardPressed,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 200;

  @override
  // TODO: implement minExtent
  double get minExtent => 200;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

}

class TitleDelegate extends SliverPersistentHeaderDelegate {
  final List<CategoryCashflow> items;

  TitleDelegate(
      {required this.items,});

  int _cashflow(List<CategoryCashflow> items) {
    return items
        .map((e) => e.monthCashflow)
        .fold<int>(0, (previousValue, element) => previousValue + element);
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return
        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cashflow',
                style: Theme.of(context).textTheme.headline6,
              ),
              TweenAnimationBuilder<int>(
                  tween: IntTween(
                    begin: 0,
                    end: _cashflow(items),
                  ),
                  duration: _duration,
                  builder: (context, cashflow, _) {
                    return Text(
                      NumberFormat().format(cashflow),
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Theme.of(context).primaryColor),
                    );
                  }),
            ],
          ),
        );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _ShowAllButton extends StatelessWidget {
  const _ShowAllButton(
      {Key? key, required this.onPressed, required this.showAll})
      : super(key: key);

  final void Function() onPressed;
  final bool showAll;

  @override
  Widget build(BuildContext context) {
    var _icon = showAll ? Icons.arrow_downward : Icons.arrow_upward;
    var _title = showAll ? 'Show all' : 'Collapse';

    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _icon,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            _title.toUpperCase(),
            style: TextStyle().copyWith(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
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
          child: charts.PieChart(
            [
              charts.Series<CategoryCashflow, int>(
                id: 'Cashflow',
                domainFn: (CategoryCashflow sales, _) => sales.category.id,
                measureFn: (CategoryCashflow sales, _) => sales.monthCashflow,
                data: list,
              )
            ],
            animate: true,
            animationDuration: _duration,
          ),
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
        duration: _duration,
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

class _CategoryItem extends StatelessWidget {
  final CategoryCashflow category;

  const _CategoryItem({Key? key, required this.category}) : super(key: key);

  double _progress() {
    var _cashflow = category.monthCashflow;
    var _budget = category.category.budget;
    if (_cashflow == 0) {
      return 0;
    } else if (_cashflow > _budget || _budget == 0) {
      return 1;
    } else {
      return _cashflow / _budget;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.category.title,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(NumberFormat().format(category.monthCashflow)),
            ],
          ),
          LinearProgressIndicator(
            minHeight: 10,
            color: Theme.of(context).accentColor,
            value: _progress(),
          ),
        ],
      ),
    );
  }
}
