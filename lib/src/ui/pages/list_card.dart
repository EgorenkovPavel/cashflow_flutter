import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {

  final void Function() _onTap;
  final Widget _child;

  const ListCard({super.key, required onTap, required Widget child})
      : _onTap = onTap,
        _child = child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Card(
        child: Center(
          child: _child,
        ),
      ),
    );
  }
}
