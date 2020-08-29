import 'package:flutter/material.dart';

class EmptyListHint extends StatelessWidget {

  final String title;
  final String hint;

  const EmptyListHint({this.title, this.hint});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.add, color: Colors.grey,size: 48.0,),
          Text(title, style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Colors.grey)),
          Text(hint,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(color: Colors.grey)),
        ],
      ),
    );
  }
}
