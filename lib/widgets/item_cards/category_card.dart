import 'package:cashflow/data/objects/category.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/item_cards/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {

  final OperationType type;
  final TextEditingController titleController = TextEditingController();

  CategoryCard({this.type});

  void saveCategory(BuildContext context) {
      Provider.of<Repository>(context, listen: false)
          .insertCategory(Category(title: titleController.text, type: type));
  }

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      title: AppLocalizations.of(context).newCategoryCardTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).titleType,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(getOperationTitle(context, type)),
                )
              ],
          ),
          TextFormField(
            autofocus: true,
            controller: titleController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: AppLocalizations.of(context).title,
            ),
            validator: (value) {
              if (value.isEmpty) {
                return AppLocalizations.of(context).emptyTitleError;
              }
              return null;
            },
          ),
        ],
      ),
      onSave: (context) {
        saveCategory(context);
      },
    );
  }
}
