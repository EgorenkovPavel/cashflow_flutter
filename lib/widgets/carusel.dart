import 'package:flutter/material.dart';

class Carusel<T> extends StatelessWidget {
  final double itemHeight;

  final List<T> items;
  final T initialItem;
  final ValueChanged<int> onPageChanged;
  final IndexedWidgetBuilder itemBuilder;

  PageController _pageController;

  Carusel(
      {Key key,
      this.items,
      this.onPageChanged,
      this.itemBuilder,
      this.initialItem,
      this.itemHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        _pageController = PageController(
          initialPage: items.indexOf(initialItem),
          keepPage: true,
          viewportFraction: 1 / (constrains.maxHeight / itemHeight),
        );
        return Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.all(8.0),
                height: itemHeight - 16.0,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 3.0, color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
            PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                itemCount: items.length,
                onPageChanged: onPageChanged,
                itemBuilder: (context, pos) {
                  return AnimatedBuilder(
                    builder: (BuildContext context, Widget child) {
                      if (!_pageController.position.haveDimensions) {
                        Future.delayed(Duration(seconds: 1),(){this.build(context);});
                        return child;
                      }
                      return Transform.scale(
                        scale: 1 - (pos - _pageController.page).abs() / 10,
                        child: child,
                      );
                    },
                    animation: _pageController,
                    child: GestureDetector(
                      child: Container(
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                width: 1.0,
                                color: Theme.of(context).primaryColor),
                          ),
                          height: 20.0,
                          child: itemBuilder(context, pos)),
                      onTap: () {
                        _pageController.animateToPage(pos,
                            duration: Duration(seconds: 1),
                            curve: ElasticOutCurve());
                      },
                    ),
                  );
                }),
          ],
        );
      },
    );
  }
}
