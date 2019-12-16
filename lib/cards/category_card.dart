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

  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    if(widget.category != null){
      controller.text = widget.category.title;
      _type = widget.category.operationType;
    }
  }

  void _onTypeChanged(OperationType type){
    setState(() {
      _type = type;
    });
  }

  void saveCategory(BuildContext context){
    if(widget.category == null){
      widget.category = CategoryData(title: controller.text, operationType: _type);
      Provider.of<Model>(context, listen: false).insertCategory(widget.category);
    }else{
      widget.category = widget.category.copyWith(title: controller.text, operationType: _type);
      Provider.of<Model>(context, listen: false).updateCategory(widget.category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ItemCard(
      title: widget.category == null ? 'New category' : 'Category',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(controller: controller,
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
        ],
      ),
      onSave: (context){saveCategory(context);},
    );
  }
}
