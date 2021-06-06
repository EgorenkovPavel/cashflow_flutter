import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models/category.dart';
import 'package:money_tracker/domain/models/operation_type.dart';
import 'package:money_tracker/ui/pages/list_card.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/widgets/sliver_header_delegate.dart';
import 'package:money_tracker/utils/app_localization.dart';

class CategoryList extends StatelessWidget {
  const CategoryList();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      semanticChildCount: 2,
      slivers: <Widget>[
        CategoryListHeader(
          title: AppLocalizations.of(context).typeInput,
          onAdd: () => PageNavigator.openCategoryInputPage(context,
              type: OperationType.INPUT),
        ),
        StreamBuilder<List<Category>>(
          stream: context
              .read<Repository>()
              .watchAllCategoriesByType(OperationType.INPUT),
          builder: (context, state) {
            var _categories = <Category>[];
            if (state.hasData && state.data != null) {
              _categories = state.data!;
            }
            return CategoryGrid(
              categories: _categories,
              type: OperationType.INPUT,
            );
          },
        ),
        CategoryListHeader(
          title: AppLocalizations.of(context).typeOutput,
          onAdd: () => PageNavigator.openCategoryInputPage(context,
              type: OperationType.OUTPUT),
        ),
        StreamBuilder<List<Category>>(
          stream: context
              .read<Repository>()
              .watchAllCategoriesByType(OperationType.OUTPUT),
          builder: (context, state) {
            var _categories = <Category>[];
            if (state.hasData && state.data != null) {
              _categories = state.data!;
            }
            return CategoryGrid(
              categories: _categories,
              type: OperationType.OUTPUT,
            );
          },
        ),
      ],
    );
  }
}

class CategoryListHeader extends StatelessWidget {
  const CategoryListHeader(
      {Key? key, required String title, required this.onAdd})
      : _title = title,
        super(key: key);

  final String _title;
  final void Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        minHeight: 60,
        maxHeight: 60,
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  _title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Positioned(
                right: 0.0,
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: onAdd,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    Key? key,
    required List<Category> categories,
    required OperationType type,
  })  : _categories = categories,
        super(key: key);

  final List<Category> _categories;

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
        delegate: SliverChildListDelegate.fixed(
          _categories
              .map<Widget>(
                (e) => CategoryListTile(
                  category: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class CategoryListTile extends StatelessWidget {
  final Category category;

  const CategoryListTile({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCard(
      onTap: () => PageNavigator.openCategoryEditPage(context, category.id),
      child: Center(
        child: Text(category.title),
      ),
    );
  }
}
