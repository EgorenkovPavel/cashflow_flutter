import 'package:flutter/material.dart';

class CardBarButton extends StatelessWidget{

  final String title;
  final Function onPressed;

  const CardBarButton({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        title.toUpperCase(),
        style: DefaultTextStyle.of(context).style.copyWith(
            color: Theme.of(context).accentColor, fontWeight: FontWeight.bold),
      ),
      onPressed: onPressed,
    );
  }

}