import 'package:cashflow/widgets/pages/list_card.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {

  final void Function() _onTap;

  const AddButton({Key key, onTap}) : _onTap = onTap, super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListCard(
      onTap: _onTap,
      child: Center(child: const Icon(Icons.add),
      ),
    );
  }
}