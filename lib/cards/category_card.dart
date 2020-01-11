import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/cards/item_card.dart';
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
  final TextEditingController budgetController = TextEditingController();

  @override
  void initState() {
    if(widget.category != null){
      titleController.text = widget.category.title;
      budgetController.text = widget.category.budget.toString();

      _type = widget.category.operationType;
    }else{
      _type = OperationType.INPUT;
    }
  }

  void _onTypeChanged(OperationType type){
    setState(() {
      _type = type;
    });
  }

  void saveCategory(BuildContext context){
    if(widget.category == null){
      widget.category = CategoryData(title: titleController.text, operationType: _type, budget: int.parse(budgetController.text));
      Provider.of<Model>(context, listen: false).insertCategory(widget.category);
    }else{
      widget.category = widget.category.copyWith(title: titleController.text, operationType: _type, budget: int.parse(budgetController.text));
      Provider.of<Model>(context, listen: false).updateCategory(widget.category);
    }
  }

  //TODO fix on text input error

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      title: widget.category == null ? 'New category' : 'Category',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(controller: titleController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 8.0),
            child: Text('Type', style: Theme.of(context).textTheme.caption,),
          ),
          OperationTypeRadioButton(
            type: _type,
            onChange: _onTypeChanged,
            items: [OperationType.INPUT, OperationType.OUTPUT],
          ),
          SizedBox(height: 8.0,),
          TextField(controller: budgetController,
            keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Budget',
            ),
          ),
        ],
      ),
      onSave: (context){saveCategory(context);},
    );
  }
}
