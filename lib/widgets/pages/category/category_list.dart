import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/objects/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/pages/add_list_item_button.dart';
import 'package:cashflow/widgets/pages/category/category_edit_page.dart';
import 'package:cashflow/widgets/pages/category/category_input_page.dart';
import 'package:cashflow/widgets/pages/list_card.dart';
import 'package:cashflow/widgets/sliver_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryList extends StatelessWidget {
  const CategoryList();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      semanticChildCount: 2,
      slivers: <Widget>[
        CategoryListHeader(
          title: AppLocalizations.of(context).typeInput,
        ),
        StreamBuilder<List<Category>>(
            stream: context
                .read<Repository>()
                .watchAllCategoriesByType(OperationType.INPUT),
            builder: (context, state) {
              var _categories = <Category>[];
              if (state.hasData) {
                _categories = state.data;
              }
              return CategoryGrid(
                categories: _categories,
                type: OperationType.INPUT,
              );
            }),
        CategoryListHeader(
          title: AppLocalizations.of(context).typeOutput,
        ),
        StreamBuilder<List<Category>>(
            stream: context
                .read<Repository>()
                .watchAllCategoriesByType(OperationType.OUTPUT),
            builder: (context, state) {
              var _categories = <Category>[];
              if (state.hasData) {
                _categories = state.data;
              }
              return CategoryGrid(
                categories: _categories,
                type: OperationType.OUTPUT,
              );
            }),
      ],
    );
  }
}

class CategoryListHeader extends StatelessWidget {
  const CategoryListHeader({Key key, @required String title})
      : _title = title,
        super(key: key);

  final String _title;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        minHeight: 60,
        maxHeight: 60,
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Center(
            child: Text(
              _title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    Key key,
    @required List<Category> categories,
    @required OperationType type,
  })  : _categories = categories,
        _type = type,
        super(key: key);

  final List<Category> _categories;
  final OperationType _type;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(16.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2.0,
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16.0,
            mainAxisExtent: 100.0),
        delegate: SliverChildListDelegate.fixed(_categories
            .map<Widget>((e) => CategoryListTile(
                  category: e,
                ))
            .toList()
              ..add(AddButton(
                onTap: () {
                  CategoryInputPage.open(context, type: _type);
                },
              ))),
      ),
    );
  }
}

class CategoryListTile extends StatelessWidget {
  final Category category;

  const CategoryListTile({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCard(
      onTap: () => CategoryEditPage.open(context, category.id),
      child: Center(
        child: Text(category.title),
      ),
    );
  }
}
