import 'package:flutter/material.dart';

class EmptyListHint extends StatelessWidget {

  final String text;

  const EmptyListHint(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .headline
              .copyWith(color: Colors.grey)),
    );
  }
}
