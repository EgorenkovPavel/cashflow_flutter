import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/data/repository.dart';
import 'package:money_tracker/domain/models.dart';
import 'package:money_tracker/ui/page_navigator.dart';
import 'package:money_tracker/ui/pages/category/detail_page/category_cashflow_diagram.dart';
import 'package:money_tracker/ui/pages/category/detail_page/category_detail_page_bloc.dart';
import 'package:money_tracker/ui/pages/operation/list_divider_operation.dart';
import 'package:money_tracker/ui/pages/operation/list_tile_operation.dart';
import 'package:provider/provider.dart';

class CategoryDetailPage extends StatefulWidget {
  final int id;

  const CategoryDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage>
    with SingleTickerProviderStateMixin {
  late CategoryBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = CategoryBloc(context.read<Repository>())..fetch(widget.id);
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  //TODO add sliver list

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.title),
            actions: [
              IconButton(
                  onPressed: () => PageNavigator.openCategoryEditPage(context,
                      id: widget.id),
                  icon: Icon(Icons.edit))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Budget ${state.budget} in ${getBudgetTypeTitle(state.budgetType)}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 200.0,
                      child: CategoryCashflowDiagram(
                        id: widget.id,
                        budget: state.budget,
                        budgetType: state.budgetType,
                      )),
                ),
                _OperationList(id: widget.id),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => PageNavigator.openOperationInputPage(context),
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class _OperationList extends StatelessWidget {
  const _OperationList({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<Repository>().watchAllOperationsByCategory(id),
      builder: (BuildContext context, AsyncSnapshot<List<Operation>> snapshot) {
        var list = <Operation>[];
        if (snapshot.hasData) {
          list = snapshot.data!;
        }

        return Column(
          children: list
              .expand(
                (e) => [
                  if (list.indexOf(e) == 0)
                    ListDividerOperation.day(null, e)
                  else
                    ListDividerOperation.day(list[list.indexOf(e) - 1], e),
                  ListTileOperation(e,
                      onTap: () =>
                          PageNavigator.openOperationEditPage(context, e.id))
                ],
              )
              .toList(),
        );
      },
    );
  }
}
