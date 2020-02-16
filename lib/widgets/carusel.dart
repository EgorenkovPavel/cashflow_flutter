import 'package:flutter/material.dart';

class Carusel<T> extends StatelessWidget {
  final double itemHeigth;

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
      this.itemHeigth})
      : super(key: key);

  Future<void> animateTo(T item){
    if(items.contains(item)) {
      _pageController.animateToPage(items.indexOf(item),
          duration: Duration(seconds: 1),
          curve: ElasticOutCurve());
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        _pageController = PageController(
          initialPage: items.indexOf(initialItem),
          keepPage: true,
          viewportFraction: 1 / (constrains.maxHeight / itemHeigth),
        );
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
                controller: _pageController,
                scrollDirection: Axis.vertical,
                itemCount: items.length,
                onPageChanged: onPageChanged,
                itemBuilder: (context, pos){
                  return GestureDetector(
                    child: Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              width: 1.0, color: Theme.of(context).primaryColor),
                        ),
                        height: 20.0,
                        child: itemBuilder(context, pos)),
                    onTap: (){
                      _pageController.animateToPage(pos, duration: Duration(seconds: 1), curve: ElasticOutCurve());
                    },
                  );
                }),
          ],
        );
      },
    );
  }
}
