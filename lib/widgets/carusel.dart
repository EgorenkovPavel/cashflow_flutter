import 'package:flutter/material.dart';

class Carusel<T> extends StatelessWidget {
  final double itemHeigth;

  final List<T> items;
  final T initialItem;
  final ValueChanged<int> onPageChanged;
  final IndexedWidgetBuilder itemBuilder;

  Carusel(
      {Key key,
      this.items,
      this.onPageChanged,
      this.itemBuilder,
      this.initialItem,
      this.itemHeigth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.all(8.0),
                height: itemHeigth - 16.0,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 3.0, color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
            PageView.builder(
                controller: PageController(
                  initialPage: items.indexOf(initialItem),
                  keepPage: true,
                  viewportFraction: 1 / (constrains.maxHeight / itemHeigth),
                ),
                scrollDirection: Axis.vertical,
                itemCount: items.length,
                onPageChanged: onPageChanged,
                itemBuilder: itemBuilder),
          ],
        );
      },
    );
  }
}
