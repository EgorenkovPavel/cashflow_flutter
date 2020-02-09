import 'package:cashflow/cards/item_card.dart';
import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BudgetCard extends StatefulWidget {

  final int categoryId;

  BudgetCard({@required this.categoryId});

  @override
  _BudgetCardState createState() => _BudgetCardState();
}

class _BudgetCardState extends State<BudgetCard> {

  final TextEditingController controller = TextEditingController();

  void saveBudget(BuildContext context) {

      Provider.of<Model>(context, listen: false).insertBudget(
          BudgetData(date: DateTime.now(),
              category: widget.categoryId,
              sum: int.parse(controller.text)));
  }

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      title: 'Budget', // TODO
      child: Column(
        children: <Widget>[
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