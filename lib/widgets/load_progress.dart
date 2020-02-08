
import 'package:flutter/material.dart';

class LoadProgress extends StatelessWidget {

  final String title;
  final int count;
  final int total;

  const LoadProgress({Key key, this.title, this.count, this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title),
            Text('$count/$total'),
          ],
        ),
        LinearProgressIndicator(
          value: count/total,
        ),
      ],
    );
  }
}
