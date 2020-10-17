import 'package:flutter/material.dart';

class EmptyCardHint extends StatelessWidget{

  final String title;

  const EmptyCardHint({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(color: Colors.black38)),
    );
  }

}