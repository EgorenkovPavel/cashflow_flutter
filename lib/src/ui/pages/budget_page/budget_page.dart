// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/blocs/currency_rate_bloc.dart';
import 'package:money_tracker/src/ui/pages/budget_page/budget_bloc.dart';
import 'package:money_tracker/src/ui/widgets/list_item_sum.dart';
import 'package:money_tracker/src/utils/extensions.dart';

import '../../../utils/sum.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key, required this.type});

  final CategoryType type;

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

const _duration = Duration(seconds: 1);

class _BudgetPageState extends State<BudgetPage> {
  late BudgetBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = sl<BudgetBloc>()..add(BudgetEvent.fetch(type: widget.type));
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
              type: state.type,
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
                  onBackPressed: () =>
                      _bloc.add(const BudgetEvent.previousYear()),
                  onForwardPressed: () =>
                      _bloc.add(const BudgetEvent.nextYear()),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: BudgetTypeHeaderDelegate(
                  currency: Currency.RUB,
                  title: context.loc.budgetTypeTitle(BudgetType.MONTH),
                  cashflow: state.itemsMonthBudget.fold(
                    Balance(),
                    (previousValue, element) =>
                        previousValue + element.monthCashFlow,
                  ),
                  showAll: state.showAllMonthBudget,
                  onPressed: () => _bloc.add(
                    const BudgetEvent.showAll(budgetType: BudgetType.MONTH),
                  ),
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
                  currency: Currency.RUB,
                  title: context.loc.budgetTypeTitle(BudgetType.YEAR),
                  cashflow: state.itemsYearBudget.fold(
                    Balance(),
                    (previousValue, element) =>
                        previousValue + element.yearCashFlow,
                  ),
                  showAll: state.showAllYearBudget,
                  onPressed: () => _bloc.add(
                    const BudgetEvent.showAll(budgetType: BudgetType.YEAR),
                  ),
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
        );
      },
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.type,
    required this.date,
  });

  final CategoryType type;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      CategoryType.INPUT => Text(context.loc.earningIn(date)),
      CategoryType.OUTPUT => Text(context.loc.spendingIn(date)),
    };
  }
}

class BudgetTypeHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final Balance cashflow;
  final Currency currency;
  final bool showAll;
  final void Function() onPressed;

  BudgetTypeHeaderDelegate({
    required this.cashflow,
    required this.showAll,
    required this.onPressed,
    required this.title,
    required this.currency,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ...cashflow.sums
                  .map((e) => Chip(label: Text(context.loc.sumFormat(e)))),
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
  final List<CategoryCashFlow> items;
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
      list: items.where((item) => !item.monthCashFlow.isEmpty).toList(),
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
  final List<CategoryCashFlow> items;

  TitleDelegate({
    required this.items,
  });

  Balance _cashflow(List<CategoryCashFlow> items) {
    return items.map((e) => e.monthCashFlow).fold<Balance>(
        Balance(), (previousValue, element) => previousValue + element);
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
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ..._cashflow(items)
              .sums
              .map(
                (sum) => TweenAnimationBuilder<int>(
                  tween: IntTween(
                    begin: 0,
                    end: sum.sum,
                  ),
                  duration: _duration,
                  builder: (context, cashflow, _) {
                    return Text(
                      context.loc.numberFormat(cashflow, sum.currency),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    );
                  },
                ),
              )
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
    super.key,
    required this.list,
    this.onBackPressed,
    this.onForwardPressed,
  });

  final void Function()? onBackPressed;
  final void Function()? onForwardPressed;
  final List<CategoryCashFlow> list;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onBackPressed,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        SizedBox(
          width: 200.0,
          height: 200.0,
          child: PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 0,
              sections: list
                  .map((e) => PieChartSectionData(
                      radius: 90,
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                      color: RandomColor.getColorObject(
                          Options(luminosity: Luminosity.light)),
                      title: e.categoryTitle,
                      titlePositionPercentageOffset: 1.1,
                      value:
                          e.monthCashFlow.toRub(context.usd(), context.eur()) *
                              1.0))
                  .toList(),
            ),
            duration: _duration, // Optional
            curve: Curves.linear, // Optional
          ),
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
  final CategoryCashFlow category;

  const _CategoryItem({required this.category});

  Balance _cashFlow() {
    return category.budgetType == BudgetType.MONTH
        ? category.monthCashFlow
        : category.yearCashFlow;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.openCategoryPage(category.categoryId),
      title: Text(category.categoryTitle),
      subtitle: Text(context.loc.numberFormat(category.budget, baseCurrency)),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: _cashFlow().sums.map((sum) => ListItemSum(sum: sum)).toList(),
      ), //TODO
    );
  }
}
