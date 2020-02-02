import 'package:cashflow/cards/item_card.dart';
import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/dropdown_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BudgetCard extends StatefulWidget {

  final BudgetData budget;

  BudgetCard({this.budget});

  @override
  _BudgetCardState createState() => _BudgetCardState();
}

class _BudgetCardState extends State<BudgetCard> {
  CategoryData category;

  final TextEditingController controller = TextEditingController();

  void saveBudget(BuildContext context) {
    if (widget.budget == null) {
      Provider.of<Model>(context, listen: false).updateBudget(
          BudgetData(date: DateTime(2020, 2),
              category: category.id,
              sum: int.parse(controller.text)));
    } else {
      Provider.of<Model>(context, listen: false)
          .updateBudget(widget.budget.copyWith(
          date: DateTime(2020, 2),
          category: category.id,
          sum: int.parse(controller.text)
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.budget != null) {
      controller.text = widget.budget.sum.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      title: widget.budget == null
          ? AppLocalizations
          .of(context)
          .newAccountCardTitle
          : AppLocalizations
          .of(context)
          .accountCardTitle,
      child: Column(
        children: <Widget>[
          StreamBuilder<List<CategoryData>>(
              stream: Provider.of<Model>(context).watchAllCategories(),
              initialData: [],
              builder: (context, snapshot) {

                if(!snapshot.hasData || snapshot.data.isEmpty){
                  return SizedBox();
                }

                List<CategoryData> categories = snapshot.data;

                return DropdownList<CategoryData>(
                  value: category,
                  items: categories,
                  onChange: (newValue) {
                    setState(() {
                      category = newValue;
                    });
                  },
                  getListItem: (value) {
                    return ListTile(
                      title: Text(value.title),
                    );
                  },
                );
              }
          ),
          TextFormField(
            controller: controller,
            keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: AppLocalizations
                  .of(context)
                  .titleSum,
            ),
            validator: (value) {
              if (value.isEmpty) {
                return AppLocalizations
                    .of(context)
                    .emptyTitleError;
              }
              return null;
            },
          ),
        ],
      ),
      onSave: (context) {
        saveBudget(context);
      },
    );
  }
}