import 'package:flutter/material.dart';
import 'package:money_tracker/src/domain/models.dart';
import 'package:money_tracker/src/ui/app.dart';
import 'package:money_tracker/src/ui/blocs/category_cashflow_bloc.dart';
import 'package:money_tracker/src/utils/extensions.dart';

class CategoryListPage extends StatelessWidget {
  final CategoryType type;

  const CategoryListPage({super.key, required this.type});

  Future<void> onAdd(BuildContext context) async {
    await showDialog<Category>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(context.loc.create),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                  context.openCategoryInputDialog(type: type, isGroup: false);
                },
                child: Text(context.loc.item),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                  context.openCategoryInputDialog(type: type, isGroup: true);
                },
                child: Text(context.loc.group),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.categories),
      ),
      body: ListView(
        children: [
          ...context
              .readHierarchy(type)
              .map((e) => _CategoryListTile(category: e))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onAdd(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CategoryListTile extends StatelessWidget {
  final Category category;

  const _CategoryListTile({required this.category});

  @override
  Widget build(BuildContext context) {
    return switch (category) {
      InputCategoryItem() => _ItemListTile(item: category as CategoryItem),
      OutputCategoryItem() => _ItemListTile(item: category as CategoryItem),
      InputCategoryGroup() => _GroupListTile(group: category as CategoryGroup),
      OutputCategoryGroup() => _GroupListTile(group: category as CategoryGroup),
    };
  }
}

class _ItemListTile extends StatelessWidget {
  final CategoryItem item;

  const _ItemListTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: item.parentId == null ? null : Icon(Icons.remove),
      title: Text(item.title),
      onTap: () => context.openCategoryPage(item.id),
    );
  }
}

class _GroupListTile extends StatelessWidget {
  final CategoryGroup group;

  const _GroupListTile({required this.group});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.folder),
      title: Text(group.title),
      onTap: () => context.openCategoryPage(group.id),
    );
  }
}
