
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget{

  final String title;

  const CardTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

}