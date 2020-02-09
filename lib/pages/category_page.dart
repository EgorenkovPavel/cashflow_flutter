import 'dart:async';

import 'package:cashflow/cards/budget_card.dart';
import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  static const routeName = '/category';

  final int id;

  const CategoryPage({Key key, this.id}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  CategoryData category;
  StreamSubscription<CategoryData> subscription;

  bool _editTitleMode = false;
  TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    subscription = Provider.of<Model>(context, listen: false)
        .getCategoryById(widget.id)
        .listen((CategoryData data) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: header(context),
        actions: <Widget>[appBarIcon()],
      ),
      body: StreamBuilder<List<BudgetData>>(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(!snapshot.hasData){
              return SizedBox();
            }

            List<BudgetData> list = snapshot.data;

            return ListView.builder(itemBuilder: (context, pos){
              return ListTile(
                title: Text(list[pos].date.toString()),
                trailing: Text(list[pos].sum.toString()),
              );
            }, itemCount: list.length,);

          },
          stream: Provider.of<Model>(context, listen: false)
              .watchBudgetByCategory(widget.id),
        ),
  floatingActionButton: FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: (){
//      Provider.of<Model>(context, listen: false).insertBudget(BudgetData(
//        date: DateTime.now(),
//        category: widget.id,
//        sum: 1000,
//      ));
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Dialog(
                child: BudgetCard(
                  categoryId: widget.id,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))));
          });
    },
  ),
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
          Provider.of<Model>(context, listen: false)
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
        style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),
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
                : getOperationTitle(context, category.operationType),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: Colors.white),
          ),
        ],
      );
    }
  }
}
