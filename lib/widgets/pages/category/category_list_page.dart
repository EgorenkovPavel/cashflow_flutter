import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/pages/category/category_input_page.dart';
import 'package:cashflow/widgets/pages/category/category_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CategoryListPage extends StatefulWidget {
  static const String routeName = '/categories';

  static void open(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryListPage.routeName);
  }

  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage>
    with SingleTickerProviderStateMixin {
  static const List<OperationType> tabTypes = [
    OperationType.INPUT,
    OperationType.OUTPUT
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabTypes.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).categories),
        bottom: TabBar(
          tabs: tabTypes
              .map((type) => Tab(text: getOperationTitle(context, type)))
              .toList(),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabTypes.map((type) => buildList(context, type)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => CategoryInputPage.open(context,
            type: tabTypes[_tabController.index]),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildList(BuildContext context, OperationType type) {
    return StreamBuilder<Map<Category, int>>(
      stream: Provider.of<Repository>(context, listen: false)
          .watchCategoryBudgetByType(type),
      builder:
          (BuildContext context, AsyncSnapshot<Map<Category, int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.data.isEmpty) {
          return emptyListHint(context);
        }

        final items = snapshot.data ?? <Category, int>{};

        return listBuilder(context, items);
      },
    );
  }

  Widget listBuilder(BuildContext context, Map<Category, int> categories) {
    return ListView.separated(
      itemCount: categories.length,
      itemBuilder: (_, index) {
        final itemCategory = categories.entries.toList()[index];
        return ListTile(
          title: Text(itemCategory.key.title),
          subtitle: Text(
              '${AppLocalizations.of(context).titleBudget} '
                  '${NumberFormat().format(itemCategory.value)}'),
          onTap: () => CategoryEditPage.open(context, itemCategory.key.id),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
    );
  }

  Widget emptyListHint(BuildContext context) {
    return EmptyListHint(
      title: AppLocalizations.of(context).emptyListCategories,
      hint: AppLocalizations.of(context).hintEmptyList,
    );
  }
}
