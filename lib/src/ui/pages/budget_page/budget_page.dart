// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/page_navigator.dart';
import 'package:money_tracker/src/ui/pages/budget_page/budget_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key, required this.type}) : super(key: key);

  final OperationType type;

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

const _duration = Duration(seconds: 1);

class _BudgetPageState extends State<BudgetPage> {
  late BudgetBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<BudgetBloc>()..add(BudgetEvent.fetch(operationtype: widget.type));
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetBloc, BudgetState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: AppBarTitle(
              operationType: state.operationType,
              date: state.date,
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: TitleDelegate(
                  items: state.itemsAll,
                ),
              ),
              SliverPersistentHeader(
                delegate: DiagramDelegate(
                  items: state.itemsAll,
                  onBackPressed: () => _bloc.add(const BudgetEvent.previousYear()),
                  onForwardPressed: () => _bloc.add(const BudgetEvent.nextYear()),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: BudgetTypeHeaderDelegate(
                  title: context.loc.budgetTypeTitle(BudgetType.MONTH),
                  cashflow: state.itemsMonthBudget.fold(
                    0,
                    (previousValue, element) =>
                        previousValue + element.monthCashflow,
                  ),
                  showAll: state.showAllMonthBudget,
                  onPressed: () => _bloc.add(const BudgetEvent.showAll(budgetType: BudgetType.MONTH)),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(state.itemsMonthBudget
                    .expand(
                      (e) => [_CategoryItem(category: e), const Divider()],
                    )
                    .toList()),
              ),
              SliverPersistentHeader(
                delegate: BudgetTypeHeaderDelegate(
                  title: context.loc.budgetTypeTitle(BudgetType.YEAR),
                  cashflow: state.itemsYearBudget.fold(
                    0,
                    (previousValue, element) =>
                        previousValue + element.yearCashflow,
                  ),
                  showAll: state.showAllYearBudget,
                  onPressed: () => _bloc.add(const BudgetEvent.showAll(budgetType: BudgetType.YEAR)),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(state.itemsYearBudget
                    .expand(
                      (e) => [_CategoryItem(category: e), const Divider()],
                    )
                    .toList()),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () =>
                sl<PageNavigator>().openCategoryInputDialog(context, type: widget.type),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
    required this.operationType,
    required this.date,
  }) : super(key: key);

  final OperationType operationType;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    var start = operationType == OperationType.INPUT
        ? context.loc.earningIn
        : context.loc.spendingIn;

    var formatDate = DateFormat.yMMMM().format(date);

    return Text('$start $formatDate');
  }
}

class BudgetTypeHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final int cashflow;
  final bool showAll;
  final void Function() onPressed;

  BudgetTypeHeaderDelegate({
    required this.cashflow,
    required this.showAll,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              const Spacer(),
              Text(
                context.loc.numberFormat(cashflow),
                style: Theme.of(context).textTheme.headline6,
              ),
              showAll
                  ? const Icon(Icons.arrow_drop_down)
                  : const Icon(Icons.arrow_drop_up),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class DiagramDelegate extends SliverPersistentHeaderDelegate {
  final List<CategoryCashflow> items;
  final void Function() onBackPressed;
  final void Function() onForwardPressed;

  DiagramDelegate({
    required this.items,
    required this.onBackPressed,
    required this.onForwardPressed,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return PieDiagram(
      list: items.where((item) => item.monthCashflow > 0).toList(),
      onBackPressed: onBackPressed,
      onForwardPressed: onForwardPressed,
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 200;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class TitleDelegate extends SliverPersistentHeaderDelegate {
  final List<CategoryCashflow> items;

  TitleDelegate({
    required this.items,
  });

  int _cashflow(List<CategoryCashflow> items) {
    return items
        .map((e) => e.monthCashflow)
        .fold<int>(0, (previousValue, element) => previousValue + element);
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.loc.titleCashflow,
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
                context.loc.numberFormat(cashflow),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              );
            },
          ),
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

class PieDiagram extends StatelessWidget {
  const PieDiagram({
    Key? key,
    required this.list,
    this.onBackPressed,
    this.onForwardPressed,
  }) : super(key: key);

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
          icon: const Icon(Icons.arrow_back_ios),
        ),
        const SizedBox(
          width: 200.0,
          height: 200.0,
          // child: charts.PieChart(
          //   [
          //     charts.Series<CategoryCashflow, int>(
          //       id: 'Cashflow',
          //       domainFn: (CategoryCashflow sales, _) => sales.category.id,
          //       measureFn: (CategoryCashflow sales, _) => sales.monthCashflow,
          //       data: list,
          //     ),
          //   ],
          //   animate: true,
          //   animationDuration: _duration,
          // ),
        ),
        IconButton(
          onPressed: onForwardPressed,
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final CategoryCashflow category;

  const _CategoryItem({Key? key, required this.category}) : super(key: key);

  int _cashflow() {
    return category.category.budgetType == BudgetType.MONTH
        ? category.monthCashflow
        : category.yearCashflow;
  }

  double _progress() {
    var cash = _cashflow();
    var budget = category.category.budget;
    if (cash == 0) {
      return 0;
    } else if (cash > budget || budget == 0) {
      return 1;
    } else {
      return cash / budget;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () =>
          sl<PageNavigator>().openCategoryPage(context, category.category.id),
      title: Text(category.category.title),
      subtitle: Text(
        context.loc.numberFormat(category.category.budget),
      ),
      trailing: Text(context.loc.numberFormat(_cashflow())),
      leading: CircularProgressIndicator(
        value: _progress(),
      ),
    );
  }
}
