import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {

  final String title;

  const CardTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
