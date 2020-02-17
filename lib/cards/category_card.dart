import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/cards/item_card.dart';
import 'package:cashflow/utils/app_localization.dart';
import 'package:cashflow/widgets/operation_type_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatefulWidget {
  CategoryData category;

  CategoryCard({this.category});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  OperationType _type;

  final TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    if (widget.category != null) {
      titleController.text = widget.category.title;

      _type = widget.category.operationType;
    } else {
      _type = OperationType.INPUT;
    }
  }

  void _onTypeChanged(OperationType type) {
    setState(() {
      _type = type;
    });
  }

  void saveCategory(BuildContext context) {
    if (widget.category == null) {
      widget.category = CategoryData(
          title: titleController.text,
          operationType: _type);
      Provider.of<Model>(context, listen: false)
          .insertCategory(widget.category);
    } else {
      widget.category = widget.category.copyWith(
          title: titleController.text,
          operationType: _type,);
      Provider.of<Model>(context, listen: false)
          .updateCategory(widget.category);
    }
  }

  //TODO fix on text input error

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      title: widget.category == null
          ? AppLocalizations.of(context).newCategoryCardTitle
          : AppLocalizations.of(context).categoryCardTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
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
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 8.0),
            child: Text(
              AppLocalizations.of(context).titleType,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          OperationTypeRadioButton(
            type: _type,
            onChange: _onTypeChanged,
            items: [OperationType.INPUT, OperationType.OUTPUT],
          ),
        ],
      ),
      onSave: (context) {
        saveCategory(context);
      },
    );
  }
}
