import 'package:cashflow/data/operation_type.dart';
import 'package:cashflow/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../model.dart';

class SimpleMasterPage extends StatefulWidget {
  @override
  _SimpleMasterPageState createState() => _SimpleMasterPageState();
}

class _SimpleMasterPageState extends State<SimpleMasterPage> {

  OperationType _type = OperationType.INPUT;
  AccountData _account;
  CategoryData _category;
  AccountData _recAccount;

  final TextEditingController controller = TextEditingController();

  List<AccountData> accountList;
  List<CategoryData> categoryInList;
  List<CategoryData> categoryOutList;

  Widget AnalyticMenu(){
    switch (_type){
      case OperationType.INPUT:
        return DropdownButton<CategoryData>(
          value: _category,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (CategoryData newValue) {
            setState(() {
              _category = newValue;
            });
          },
          items: categoryInList?.map((CategoryData value){
            return DropdownMenuItem<CategoryData>(
              value: value,
              child: Text(value.title),
            );
          })?.toList(),
        );
      case OperationType.OUTPUT:
        return DropdownButton<CategoryData>(
          value: _category,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (CategoryData newValue) {
            setState(() {
              _category = newValue;
            });
          },
          items: categoryOutList?.map((CategoryData value){
            return DropdownMenuItem<CategoryData>(
              value: value,
              child: Text(value.title),
            );
          })?.toList(),
        );
      case OperationType.TRANSFER:
        return DropdownButton<AccountData>(
          value: _recAccount,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (AccountData newValue) {
            setState(() {
              _recAccount = newValue;
            });
          },
          items: accountList?.map((AccountData value){
            return DropdownMenuItem<AccountData>(
              value: value,
              child: Text(value.title),
            );
          })?.toList(),
        );
      default: return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<Model>(context).watchAllAccounts().forEach((list){
      setState(() {
        accountList = list;
      });
    });

    Provider.of<Model>(context).watchAllCategoriesByType(OperationType.INPUT).forEach((list){
      setState(() {
        categoryInList = list;
      });
    });

    Provider.of<Model>(context).watchAllCategoriesByType(OperationType.OUTPUT).forEach((list){
      setState(() {
        categoryOutList = list;
      });
    });

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DropdownButton<OperationType>(
            value: _type,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (OperationType newValue) {
              setState(() {
                _type = newValue;
              });
            },
            items: [
              DropdownMenuItem<OperationType>(
                value: OperationType.INPUT,
                child: Text('INPUT'),
              ),
              DropdownMenuItem<OperationType>(
                value: OperationType.OUTPUT,
                child: Text('OUTPUT'),
              ),
              DropdownMenuItem<OperationType>(
                value: OperationType.TRANSFER,
                child: Text('TRANSFER'),
              ),
            ],
          ),
          DropdownButton<AccountData>(
            value: _account,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (AccountData newValue) {
              setState(() {
                _account = newValue;
              });
            },
            items: accountList?.map((AccountData value){
               return DropdownMenuItem<AccountData>(
                value: value,
                child: Text(value.title),
              );
            })?.toList(),
          ),
          AnalyticMenu(),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text('SAVE'),
            onPressed: (){
              OperationData operation = OperationData(
                date: DateTime.now(),
                operationType: _type,
                account: _account.id,
                category: _category.id,
                recAccount: _recAccount.id,
                sum: int.parse(controller.text)
              );
              Provider.of<Model>(context).insertOperation(operation);
            },
          )
        ],
      ),
    );
  }
}