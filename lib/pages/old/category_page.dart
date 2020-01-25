import 'package:cashflow/data/database.dart';
import 'package:cashflow/data/model.dart';
import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/widgets/operation_type_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CategoryPage extends StatefulWidget {

  static const routeName = '/category';

  @override
  _CategoryPageState createState() => _CategoryPageState();

}

class _CategoryPageState extends State<CategoryPage> {

  bool loadedArgs = false;
  OperationType _type;

  final TextEditingController controller = TextEditingController();

  CategoryData category = null;

  void _onTypeChanged(OperationType type){
    setState(() {
      _type = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(!loadedArgs) {
      category = ModalRoute
          .of(context)
          .settings
          .arguments;
      controller.text = category == null ? '' : category.title;
      _type = category == null ? OperationType.INPUT : category.operationType;

      loadedArgs = true;
    }
    return Scaffold(
      appBar: AppBar(title: Text('Category'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.save),
          onPressed: (){
            if(category == null){
              category = CategoryData(title: controller.text, operationType: _type);
              Provider.of<Model>(context, listen: false).insertCategory(category);
            }else{
              category = category.copyWith(title: controller.text, operationType: _type);
              Provider.of<Model>(context, listen: false).updateCategory(category);
            }

            Navigator.pop(context);
          },)
      ],),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
      ),
    );
  }

}
