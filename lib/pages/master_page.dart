import 'package:cashflow/data/operation_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MasterPage extends StatefulWidget {
  static const routeName = '/master';

  @override
  _MasterPageState createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: OperationType.INPUT,
              ),
              Text('Input'),
              Radio(
                value: OperationType.OUTPUT,
              ),
              Text('Output'),
              Radio(
                value: OperationType.TRANSFER,
              ),
              Text('Transfer'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, pos){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Text('TEST'),
                    color: Colors.black45,
                  ),
                );
              },
              itemCount: 20,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, pos){
                return ListTile(
                  title: Text('Text'),
                );
              },
              itemCount: 20,
            ),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('More'),
              ),
              Expanded(child: TextField()),
              FlatButton(
                child: Text('Next'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
