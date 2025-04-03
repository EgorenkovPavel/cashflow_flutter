import 'package:flutter/material.dart';
import 'package:money_tracker/src/utils/extensions.dart';
import '../../utils/sum.dart';

class ListItemSum extends StatelessWidget {
  final Sum sum;
  const ListItemSum({
    super.key, required this.sum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        color: Theme.of(context).primaryColor.withAlpha(30),
      ),
      padding:
      EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
      child: Text(
        context.loc.sumFormat(sum),
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Theme.of(context).primaryColor),
      ),
    );
  }
}