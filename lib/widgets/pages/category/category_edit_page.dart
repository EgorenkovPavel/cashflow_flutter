import 'dart:async';

import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/empty_list_hint.dart';
import 'package:cashflow/widgets/pages/budget/budget_card.dart';
import 'package:cashflow/widgets/pages/budget/list_tile_budget.dart';
import 'package:cashflow/widgets/pages/operation/operation_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryEditPage extends StatefulWidget {
  static const routeName = '/category';

  static open(BuildContext context, int categoryId) {
    Navigator.of(context)
        .pushNamed(CategoryEditPage.routeName, arguments: categoryId);
  }

  final int id;

  const CategoryEditPage({Key key, this.id}) : super(key: key);

  @override
  _CategoryEditPageState createState() => _CategoryEditPageState();
}

class _CategoryEditPageState extends State<CategoryEditPage>
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
          title: _header(context),
          actions: <Widget>[_appBarIcon()],
          bottom: TabBar(
            tabs: [
              Tab(text: AppLocalizations.of(context).titleBudget),
              Tab(text: AppLocalizations.of(context).operations)
            ],
            controller: _tabController,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            _buildBudgetList(context),
            //buildOperationList(context),
            OperationList(Provider.of<Repository>(context, listen: false)
                .watchAllOperationsByCategory(widget.id))
          ],
        ),
       floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          if (_tabController.index == 0){
            BudgetCard.open(context, widget.id);
          }else if (_tabController.index == 1){
            OperationList.addItem(context);
          }
        },
      ),

    );
  }

  Widget _buildBudgetList(BuildContext context) {
    return StreamBuilder<List<BudgetData>>(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return _emptyBudgetListHint(context);
        }

        List<BudgetData> list = snapshot.data;

        if(list.isEmpty){
          return _emptyBudgetListHint(context);
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

  IconButton _appBarIcon() {
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

  Widget _header(BuildContext context) {
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

  Widget _emptyBudgetListHint(BuildContext context) {
    return EmptyListHint(
      title: AppLocalizations.of(context).emptyListBudgets,
      hint: AppLocalizations.of(context).hintEmptyList,
    );
  }
}