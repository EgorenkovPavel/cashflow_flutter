import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/app.dart';

import '../../../../utils/extensions.dart';
import '../../../blocs/category_cashflow_bloc.dart';

class CategoryItemsListPage extends StatelessWidget {
  final int? parentId;
  final CategoryType type;

  const CategoryItemsListPage({
    super.key,
    required this.parentId,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final title = parentId == null ? '...' : context.getTitleById(parentId!);

    final items = context.watchCategoryCashFlowsByParent(type, parentId);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          if (parentId != null)
            IconButton(
              onPressed: () => context.openCategoryEditDialog(id: parentId!),
              icon: const Icon(Icons.edit, color: Colors.black),
            ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              onTap: () => context.openCategoryPage(item.categoryId),
              title: Text(item.categoryTitle),
              subtitle: Text(
                context.loc.budgetDisplay(
                  '${item.budget}',
                  item.budgetType.toLocaleKey(),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: items.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.openCategoryInputDialog(type: type, isGroup: false),
        child: const Icon(Icons.add),
      ),
    );
  }
}
