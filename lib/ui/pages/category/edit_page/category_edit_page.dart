import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/budget/list_tile_budget.dart';
import 'package:money_tracker/ui/pages/category/edit_page/category_edit_page_bloc.dart';
import 'package:money_tracker/ui/pages/operation/operation_list.dart';
import 'package:money_tracker/ui/widgets/empty_list_hint.dart';
import 'package:money_tracker/utils/app_localization.dart';
import 'package:provider/provider.dart';

class CategoryEditPage extends StatefulWidget {
  final int id;

  const CategoryEditPage({Key? key, required this.id}) : super(key: key);

  @override
  _CategoryEditPageState createState() => _CategoryEditPageState();
}

class _CategoryEditPageState extends State<CategoryEditPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late CategoryBloc _bloc;

  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _bloc = CategoryBloc(Provider.of<Repository>(context, listen: false))
      ..fetch(widget.id);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _tabController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryBloc, CategoryState>(
      bloc: _bloc,
      listener: (context, state) {},
      child: Scaffold(
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
            OperationList(
                filter: OperationListFilter(categoriesIds: {widget.id}))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_tabController.index == 0) {
              PageNavigator.addBudget(context, BudgetType.MONTH);
            } else if (_tabController.index == 1) {
              OperationList.addItem(context);
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildBudgetList(BuildContext context) {
    return StreamBuilder<List<Budget>>(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return _emptyBudgetListHint(context);
        }

        List<Budget> list = snapshot.data;

        if (list.isEmpty) {
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

  Widget _appBarIcon() {
    return BlocBuilder<CategoryBloc, CategoryState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state.editTitleMode) {
          return IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () => _bloc.saveTitle(_titleController.text),
          );
        } else {
          return IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () => _bloc.editTitle(),
          );
        }
      },
    );
  }

  Widget _header(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      bloc: _bloc,
      builder: (context, state) {
        _titleController.text = state.category?.title ?? '';

        if (state.editTitleMode) {
          return TextField(
            controller: _titleController,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
            autofocus: true,
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(state.category?.title ?? ''),
              Text(
                state.category == null
                    ? ''
                    : getOperationTitle(context, state.category!.type),
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _emptyBudgetListHint(BuildContext context) {
    return EmptyListHint(
      title: AppLocalizations.of(context).emptyListBudgets,
      hint: AppLocalizations.of(context).hintEmptyList,
    );
  }
}
