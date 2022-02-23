import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/data_source.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/category/detail_page/category_cashflow_diagram.dart';
import 'package:money_tracker/ui/pages/category/detail_page/category_detail_bloc.dart';
import 'package:money_tracker/ui/pages/operation/list_divider_operation.dart';
import 'package:money_tracker/ui/pages/operation/list_tile_operation.dart';
import 'package:money_tracker/utils/app_localization.dart';

class CategoryDetailPage extends StatelessWidget {
  final int id;

  const CategoryDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryDetailBloc(context.read<DataSource>())..add(Fetch(id)),
      child: BlocBuilder<CategoryDetailBloc, CategoryDetailState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.title),
              actions: [
                IconButton(
                    onPressed: () =>
                        PageNavigator.openCategoryEditPage(context, id: id),
                    icon: const Icon(Icons.edit))
              ],
            ),
            body: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: TitleDelegate(
                      id: id,
                      budget: state.budget,
                      budgetType: state.budgetType),
                ),
                BlocBuilder<CategoryDetailBloc, CategoryDetailState>(
                    builder: (context, state) {
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      state.operations
                          .expand(
                            (e) => [
                              if (state.operations.indexOf(e) == 0)
                                ListDividerOperation.day(null, e)
                              else
                                ListDividerOperation.day(
                                    state.operations[
                                        state.operations.indexOf(e) - 1],
                                    e),
                              ListTileOperation(
                                e,
                                onTap: () =>
                                    PageNavigator.openOperationEditPage(
                                        context, e.id),
                              )
                            ],
                          )
                          .toList(),
                    ),
                  );
                }),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => PageNavigator.openOperationInputPage(context),
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

class TitleDelegate extends SliverPersistentHeaderDelegate {
  final int id;
  final int budget;
  final BudgetType budgetType;

  TitleDelegate({
    required this.id,
    required this.budget,
    required this.budgetType,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              '${AppLocalizations.of(context).budget} $budget ${AppLocalizations.of(context).in_period} ${AppLocalizations.of(context).budgetTypeTitle(budgetType)}'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 150,
            child: CategoryCashflowDiagram(
              id: id,
              budget: budget,
              budgetType: budgetType,
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 200;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
