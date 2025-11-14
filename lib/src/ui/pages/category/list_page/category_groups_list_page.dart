import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/blocs/category_cashflow_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class CategoryGroupsListPage extends StatelessWidget {
  final CategoryType type;

  const CategoryGroupsListPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final noParentsItemsCount = context.watchItemsAmountNoParent(type);

    return Scaffold(
      appBar: AppBar(title: Text(context.loc.categories)),
      body: SafeArea(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: 2,
          children: [
            ...context
                .watchCategoryGroups(type)
                .map(
                  (e) => GroupCard(
                    id: e.id,
                    type: type,
                    title: e.title,
                    count: context.watchGroupItemsAmount(e.id),
                  ),
                ),
            if (noParentsItemsCount > 0)
              GroupCard(type: type, title: '...', count: noParentsItemsCount),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.openCategoryInputDialog(type: type, isGroup: true),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class GroupCard extends StatelessWidget {
  final int? id;
  final CategoryType type;
  final String title;
  final int count;

  const GroupCard({
    super.key,
    required this.title,
    required this.count,
    this.id,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: .all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              Text(
                '$count items',
                style: Theme.of(context).textTheme.labelSmall,
              ), // TODO loc
            ],
          ),
        ),
      ),
      onTap: () => context.openCategoryItemsListPage(type, id),
    );
  }
}
