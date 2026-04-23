import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_tracker/src/ui/blocs/currency_rate_bloc.dart';

import '../../../../../domain/models.dart';
import '../../../../../utils/extensions.dart';
import '../../../../blocs/category_cashflow_bloc.dart';
import '../../../../models/category_view.dart';

class CategoryCard extends StatelessWidget {
  final int? categoryId;
  final CategoryType categoryType;
  final void Function(int) onChangeCategory;

  const CategoryCard({
    super.key,
    required this.categoryId,
    required this.onChangeCategory,
    required this.categoryType,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => CategoryDialog(
                type: categoryType,
                onChangeCategory: onChangeCategory,
                selectedItem: categoryId,
              ),
            );
          },
          child: switch (categoryId) {
            final id? => _InfoCard(categoryId: id),
            _ => _EmptyCard(),
          },
        ),
      ),
    );
  }
}

class _EmptyCard extends StatelessWidget {
  const _EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(child: Center(child: Text(context.loc.hintCategory)));
  }
}

class _InfoCard extends StatelessWidget {
  final int categoryId;

  const _InfoCard({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final category = context.watchCashflowById(categoryId);

    return Card(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                category.categoryTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.loc.budgetType,
                    style: Theme.of(context).textTheme.labelMedium,),
                  Text(context.loc.budgetTypeTitle(category.budgetType)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.loc.titlePlan,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    context.loc.sumFormat(
                      Money(switch (category.budgetType) {
                        BudgetType.MONTH => category.monthBudget,
                        BudgetType.YEAR => category.yearBudget,
                      }, .RUB),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.loc.titleFact,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    context.loc.sumFormat(
                      context.balanceToRub(switch (category.budgetType) {
                        BudgetType.MONTH => category.monthCashFlow,
                        BudgetType.YEAR => category.yearCashFlow,
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryDialog extends StatefulWidget {
  final CategoryType type;
  final int? selectedItem;
  final void Function(int) onChangeCategory;

  const CategoryDialog({
    super.key,
    required this.type,
    required this.onChangeCategory,
    required this.selectedItem,
  });

  @override
  State<CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  int? _parentId;

  @override
  void initState() {
    super.initState();

    _parentId = switch (widget.selectedItem) {
      final id? => context.getCategoryParentById(id),
      _ => null,
    };

    _parentId ??= context.readCategoryGroups(widget.type).firstOrNull?.id;
  }

  @override
  Widget build(BuildContext context) {
    final noParentsItemsCount = context.watchItemsAmountNoParent(widget.type);

    final List<CategoryView?> groups = <CategoryView?>[
      ...context.watchCategoryGroups(widget.type),
    ];
    if (noParentsItemsCount > 0) {
      groups.add(null);
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(context.loc.hintCategory),
        ),
        SingleChildScrollView(
          scrollDirection: .horizontal,
          child: Row(
            children: [
              ...groups.map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(e?.title ?? '...'),
                    selected: _parentId == e?.id,
                    onSelected: (_) {
                      setState(() {
                        _parentId = e?.id;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: context
                .watchCategoryItemsByParent(widget.type, _parentId)
                .map(
                  (e) => _CategoryItem(
                    category: e,
                    onChangeCategory: widget.onChangeCategory,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    super.key,
    required this.category,
    required this.onChangeCategory,
  });

  final CategoryView category;
  final void Function(int) onChangeCategory;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onChangeCategory(category.id);
        context.pop();
      },
      title: Text(category.title),
    );
  }
}
