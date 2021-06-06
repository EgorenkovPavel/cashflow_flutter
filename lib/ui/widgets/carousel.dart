import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Carousel<T> extends StatelessWidget {
  final double itemHeight;

  final List<T> items;
  final bool Function(T) initialItemFinder;
  final ValueChanged<int> onPageChanged;
  final IndexedWidgetBuilder itemBuilder;

  Carousel(
      {Key? key,
      required this.items,
        required this.onPageChanged,
        required this.itemBuilder,
        required this.initialItemFinder,
        required this.itemHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        var _pageController = PageController(
          initialPage: items.indexWhere(initialItemFinder),
          keepPage: true,
          viewportFraction: 1 / (constrains.maxHeight / itemHeight),
        );
        return Stack(
          children: <Widget>[
            Center(
              child: Container(
                height: itemHeight - 0.0, // - 16.0,
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
                  builder: (BuildContext context, Widget? child) {
                    var page = !_pageController.position.haveDimensions
                        ? _pageController.initialPage.toDouble()
                        : _pageController.page;
                    return Transform.scale(
                      scale: 1 - (min((pos - (page ?? 0)).abs(), 1)) / 10,
                      child: child,
                    );
                  },
                  animation: _pageController,
                  child: GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(pos,
                          duration: Duration(seconds: 1),
                          curve: ElasticOutCurve());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            width: 1.0, color: Theme.of(context).primaryColor),
                      ),
                      height: 20.0,
                      child: itemBuilder(context, pos),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
