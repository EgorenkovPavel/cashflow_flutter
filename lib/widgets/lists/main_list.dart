
import 'package:flutter/material.dart';

abstract class MainList<T> extends StatelessWidget{

  final Stream<List<T>> stream;

  const MainList(this.stream, {Key key}) : super(key: key);

  void addItem(BuildContext context);

  void onItemTap(BuildContext context, T item);

  Widget listBuilder(BuildContext context, List<T> list);

  Widget emptyListHint();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<T>>(
      stream: stream,
      builder:
          (BuildContext context, AsyncSnapshot<List<T>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.data.isEmpty) {
          return emptyListHint();
        }

        final List<T> items = snapshot.data ?? List<T>();

        return listBuilder(context, items);
      },
    );
  }
}