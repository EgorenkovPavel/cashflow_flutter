import 'dart:async';

import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/item_cards/budget_card.dart';
import 'package:cashflow/widgets/list_tiles/list_tile_budget.dart';
import 'package:cashflow/widgets/list_tiles/list_tile_operation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  static const routeName = '/category';

  static open(BuildContext context, int categoryId) {
    Navigator.of(context)
        .pushNamed(CategoryPage.routeName, arguments: categoryId);
  }

  final int id;

  const CategoryPage({Key key, this.id}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin{
  Category category;
  StreamSubscription<Category> subscription;
  TabController _tabController;

  bool _editTitleMode = false;
  TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);

    super.initState();
    subscription = Provider.of<Repository>(context, listen: false)
        .getCategoryById(widget.id)
        .listen((Category data) {
      setState(() {
        category = data;
      });
      _titleController.text = category.title;
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
    _titleController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: header(context),
          actions: <Widget>[appBarIcon()],
          bottom: TabBar(
            tabs: [
              Tab(text: 'Budget'),
              Tab(text: 'Operations')
            ],
            controller: _tabController,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            buildBudgetList(context),
            buildOperationList(context),
          ],
        ),
        floatingActionButton: AnimatedBuilder(
          animation: _tabController.animation,
          builder: (BuildContext context, Widget child) {
            return Transform.scale(
              scale: 1 - _tabController.animation.value,
              child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    BudgetCard.open(context, widget.id);
                  }
              ),
            );
          },

        )

    );
  }

  Widget buildBudgetList(BuildContext context) {
    return StreamBuilder<List<BudgetData>>(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return emptyBudgetListHint(context);
        }

        List<BudgetData> list = snapshot.data;

        if(list.isEmpty){
          return emptyBudgetListHint(context);
        }

        return ListView.builder(
          itemBuilder: (context, pos) {
            return Column(
              children: <Widget>[
                ListTileBudget(list[pos]),
                Divider(),
              ],
            );
          },
          itemCount: list.length,
        );
      },
      stream: Provider.of<Repository>(context, listen: false)
          .watchBudgetByCategory(widget.id),
    );
  }

  Widget buildOperationList(BuildContext context) {
    return StreamBuilder<List<Operation>>(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return SizedBox();
        }

        List<Operation> operations = snapshot.data;

        return ListView.builder(
          itemBuilder: (context, pos) {
            return ListTileOperation(operations[pos]);
          },
          itemCount: operations.length,
        );
      },
      stream: Provider.of<Repository>(context, listen: false)
          .watchAllOperationsByCategory(widget.id),
    );
  }

  IconButton appBarIcon() {
    if (_editTitleMode) {
      return IconButton(
        icon: Icon(
          Icons.check,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            _editTitleMode = false;
            category = category.copyWith(title: _titleController.text);
          });
          Provider.of<Repository>(context, listen: false)
              .updateCategory(category.copyWith(title: _titleController.text));
        },
      );
    } else {
      return IconButton(
        icon: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            _editTitleMode = true;
          });
        },
      );
    }
  }

  Widget header(BuildContext context) {
    if (_editTitleMode) {
      return TextField(
        controller: _titleController,
        style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
        autofocus: true,
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(category?.title ?? ''),
          Text(
            category == null
                ? ''
                : getOperationTitle(context, category.type),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: Colors.white),
          ),
        ],
      );
    }
  }

  Widget emptyBudgetListHint(BuildContext context) {
    return EmptyListHint(
      title: AppLocalizations.of(context).emptyListBudgets,
      hint: AppLocalizations.of(context).hintEmptyList,
    );
  }
}
