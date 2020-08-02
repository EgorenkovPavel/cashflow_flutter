import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/item_cards/category_card.dart';
import 'package:cashflow/widgets/pages/category_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  static const String routeName = '/categories';

  static open(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryList.routeName);
  }

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList>
    with SingleTickerProviderStateMixin{

  static const List<OperationType> tabTypes = [
    OperationType.INPUT,
    OperationType.OUTPUT
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabTypes.length);
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
          child: Icon(Icons.add),
          onPressed: () => CategoryCard.open(context,
              type: tabTypes[_tabController.index]),
        ),
    );
  }

  Widget buildList(BuildContext context, OperationType type) {
    return StreamBuilder<List<Category>>(
      stream: Provider.of<Repository>(context, listen: false)
          .watchAllCategoriesByType(type),
      builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.data.isEmpty) {
          return emptyListHint(context);
        }

        final List<Category> items = snapshot.data ?? List<Category>();

        return listBuilder(context, items);
      },
    );
  }

  Widget listBuilder(BuildContext context, List<Category> categories) {
    return ListView.separated(
      itemCount: categories.length,
      itemBuilder: (_, index) {
        final itemCategory = categories[index];
        return ListTile(
          title: Text(itemCategory.title),
          onTap: () => CategoryPage.open(context, itemCategory.id),
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
