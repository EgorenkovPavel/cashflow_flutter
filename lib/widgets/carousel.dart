import 'package:flutter/material.dart';

class Carousel<T> extends StatefulWidget {
  final double itemHeight;

  final List<T> items;
  final T initialItem;
  final ValueChanged<int> onPageChanged;
  final IndexedWidgetBuilder itemBuilder;


  Carousel(
      {Key key,
      this.items,
      this.onPageChanged,
      this.itemBuilder,
      this.initialItem,
      this.itemHeight})
      : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState<T> extends State<Carousel<T>> {
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        _pageController = PageController(
          initialPage: widget.items.indexOf(widget.initialItem),
          keepPage: true,
          viewportFraction: 1 / (constrains.maxHeight / widget.itemHeight),
        );
        return Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.all(8.0),
                height: widget.itemHeight - 16.0,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 3.0, color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
            PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: widget.items.length,
              onPageChanged: widget.onPageChanged,
              itemBuilder: (context, pos) {
                return AnimatedBuilder(
                  builder: (BuildContext context, Widget child) {
                    if (!_pageController.position.haveDimensions) {
                      Future.delayed(Duration(seconds: 1), () {
                        setState(() {

                        });
                      });
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
                        child: widget.itemBuilder(context, pos)),
                    onTap: () {
                      _pageController.animateToPage(pos,
                          duration: Duration(seconds: 1),
                          curve: ElasticOutCurve());
                    },
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
