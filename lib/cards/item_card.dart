import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final String title;
  final Widget child;
  final Function onSave;

  ItemCard({Key key, this.title, @required this.child, this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.title,
              ),
            ),
            child,
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              FlatButton(
                child: Text('Cancel'.toUpperCase()),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              RaisedButton(
                child: Text(
                  'Save'.toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  if(_formKey.currentState.validate()){
                    onSave(context);
                    Navigator.pop(context);
                  }
                },
              )
            ])
          ],
        ),
      ),
    );
  }
}
