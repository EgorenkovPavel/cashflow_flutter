import 'dart:math';

import 'package:flutter/material.dart';

class Carousel<T> extends StatelessWidget {
  final double itemHeight;

  final List<T> items;
  final T? initialValue;
  final ValueChanged<int> onPageChanged;
  final IndexedWidgetBuilder itemBuilder;

  const Carousel({
    super.key,
    required this.items,
    required this.onPageChanged,
    required this.itemBuilder,
    required this.itemHeight,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    if (initialValue == null){
      onPageChanged(0);
    }

    return LayoutBuilder(
      builder: (context, constrains) {
        var pageController = PageController(
          initialPage: initialValue == null ? 0 : items.indexOf(initialValue!),
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
                    width: 3.0,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            PageView.builder(
              controller: pageController,
              scrollDirection: Axis.vertical,
              itemCount: items.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, pos) {
                return AnimatedBuilder(
                  builder: (BuildContext context, Widget? child) {
                    var page = !pageController.position.haveDimensions
                        ? pageController.initialPage.toDouble()
                        : pageController.page;

                    return Transform.scale(
                      scale: 1 - (min((pos - (page ?? 0)).abs(), 1)) / 10,
                      child: child,
                    );
                  },
                  animation: pageController,
                  child: GestureDetector(
                    onTap: () =>
                        pageController.animateToPage(
                          pos,
                          duration: const Duration(seconds: 1),
                          curve: const ElasticOutCurve(),
                        ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .cardColor,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            width: 1.0,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .primary,
                          ),
                        ),
                        height: 20.0,
                        child: itemBuilder(context, pos),
                      ),
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
