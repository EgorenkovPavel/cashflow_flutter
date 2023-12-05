import 'package:flutter/material.dart';

class EmptyListHint extends StatelessWidget {
  final String title;
  final String hint;

  const EmptyListHint({super.key, required this.title, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(
            Icons.add,
            color: Colors.grey,
            size: 48.0,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.grey),
          ),
          Text(
            hint,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
