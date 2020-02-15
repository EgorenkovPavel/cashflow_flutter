import 'dart:async';

import 'package:cashflow/cards/budget_card.dart';
import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: header(context),
            actions: <Widget>[appBarIcon()],
            bottom: TabBar(
              tabs: [
                Tab(text: 'Main', ),
                Tab(text: 'Budget'),
                Tab(text: 'Operations')
              ],
            )),
        body: TabBarView(
          children: <Widget>[
            SizedBox(),
            buildBudgetList(context),
            SizedBox(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
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
      ),
    );
  }

  Widget buildBudgetList(BuildContext context) {
    return StreamBuilder<List<BudgetData>>(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return SizedBox();
        }

        List<BudgetData> list = snapshot.data;

        return ListView.builder(
          itemBuilder: (context, pos) {
            var key = GlobalKey();
            return Column(
              children: <Widget>[
                ListTile(
                  key: key,
                  title: Text(DateFormat.yMMM(
                          Localizations.localeOf(context).languageCode)
                      .format(list[pos].date)),
                  trailing: Text(list[pos].sum.toString()),
                  onLongPress: () async {
                    final position = buttonMenuPosition(key.currentContext);
                    int res = await showMenu(
                      context: context,
                      position: position,
                      items: <PopupMenuEntry<int>>[
                        PopupMenuItem<int>(
                          child: Text('Delete'),
                          value: 1,
                        )
                      ],
                    );
                    if (res == 1) {
                      Provider.of<Model>(context, listen: false)
                          .deleteBudget(list[pos]);
                    }
                  },
                ),
                Divider(),
              ],
            );
          },
          itemCount: list.length,
        );
      },
      stream: Provider.of<Model>(context, listen: false)
          .watchBudgetByCategory(widget.id),
    );
  }

  RelativeRect buttonMenuPosition(BuildContext c) {
    final RenderBox bar = c.findRenderObject();
    final RenderBox overlay = Overlay.of(c).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        bar.localToGlobal(bar.size.center(Offset.zero), ancestor: overlay),
        bar.localToGlobal(bar.size.center(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    return position;
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
