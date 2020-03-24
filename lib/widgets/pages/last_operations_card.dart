import 'package:cashflow/data/objects/operation.dart';
import 'package:cashflow/data/repository.dart';
import 'package:cashflow/widgets/card_title.dart';
import 'package:cashflow/widgets/list_tiles/list_tile_operation.dart';
import 'package:cashflow/widgets/pages/operation_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LastOperationsCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CardTitle('Last operations'),
          Divider(),
          StreamBuilder<List<Operation>>(
            stream: Provider.of<Repository>(context, listen: false).watchLastOperations(5),
            builder: (BuildContext context, AsyncSnapshot snapshot) {

              if(!snapshot.hasData){
                return SizedBox();
              }
              List<Operation> list = snapshot.data;
              return Column(
                children: list.map((op) => Column(
                  children: <Widget>[
                    ListTileOperation(op),
                    Divider(),
                  ],
                )).toList(),
              );
            },
          ),
          Align(
            child: FlatButton(child: Text('Show all'), onPressed: () {
              Navigator.of(context).pushNamed(OperationPage.routeName);
            },),
          )
        ],
      ),
    );
  }

}