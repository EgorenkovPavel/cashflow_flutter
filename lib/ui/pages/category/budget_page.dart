import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:provider/provider.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({Key? key, required this.type}) : super(key: key);

  final OperationType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: type == OperationType.INPUT
                      ? 'Earning in '
                      : 'Spending in ',
                  style: Theme.of(context).textTheme.headline6),
              TextSpan(
                  text: DateFormat.MMMM().format(DateTime.now()),
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Theme.of(context).primaryColor)),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<CategoryCashflow>>(
        future: context
            .read<Repository>()
            .getCategoryCashflowByType(DateTime.now(), type),
        initialData: [],
        builder: (context, snapshot) {
          List<CategoryCashflow> list = [];
          if (snapshot.hasData) {
            list = snapshot.data!;
          }
          list.sort((c1, c2) => c2.cashflow - c1.cashflow);

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PieDiagram(list: list),
              ...list
                  .map<Widget>(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CategoryItem(category: e),
                    ),
                  )
                  .toList(),
              // OperationList(),
            ],
          );
        },
      ),
    );
  }
}

class PieDiagram extends StatelessWidget {
  const PieDiagram({Key? key, required this.list}) : super(key: key);

  final List<CategoryCashflow> list;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        SizedBox(
          width: 200.0,
          height: 200.0,
          child: charts.PieChart([
            charts.Series<CategoryCashflow, int>(
              id: 'Cashflow',
              domainFn: (CategoryCashflow sales, _) => sales.category.id,
              measureFn: (CategoryCashflow sales, _) => sales.cashflow,
              data: list,
            )
          ], animate: false),
        ),
        IconButton(
          onPressed: () {},
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          PageNavigator.openCategoryEditPage(context, category.category.id),
      child: TweenAnimationBuilder<int>(
        tween: IntTween(
          begin: 0,
          end: category.cashflow,
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
                    width: constraints.maxWidth *
                        (cashflow > category.category.budget ||
                                category.category.budget == 0
                            ? 1
                            : cashflow / category.category.budget),
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
