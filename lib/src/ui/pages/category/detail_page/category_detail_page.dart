import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/src/injection_container.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/pages/category/detail_page/budget_bar_chart.dart';
import 'package:money_tracker/src/ui/pages/category/detail_page/category_detail_bloc.dart';

import '../../operation/list_divider_operation.dart';
import '../../operation/list_tile_operation.dart';

class CategoryDetailPage extends StatelessWidget {
  final int id;

  const CategoryDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CategoryDetailBloc>()
            ..add(CategoryDetailEvent.fetch(categoryId: id)),
      child: BlocBuilder<CategoryDetailBloc, CategoryDetailState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.title),
              actions: [
                IconButton(
                  onPressed: () => context.openCategoryEditDialog(id: id),
                  icon: const Icon(Icons.edit, color: Colors.black),
                ),
              ],
            ),
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BudgetBarChart(categoryId: id),
                  ),
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
                                    state.operations[state.operations.indexOf(
                                          e,
                                        ) -
                                        1],
                                    e,
                                  ),
                                ListTileOperation(
                                  e,
                                  onTap: () =>
                                      context.openOperationEditPage(e.id),
                                ),
                              ],
                            )
                            .toList(),
                      ),
                    );
                  },
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => context.openOperationInputPage(),
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
