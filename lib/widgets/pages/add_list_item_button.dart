import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {

  final void Function() _onTap;

  const AddButton({Key key, onTap}) : _onTap = onTap, super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Card(
        child: Center(child: const Icon(Icons.add)),
      ),
    );
  }
}