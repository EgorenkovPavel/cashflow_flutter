import 'package:flutter/material.dart';
import 'package:money_tracker/ui/widgets/carousel.dart';

class CarouselList<T> extends StatelessWidget {

  final List<T> _items;
  final String _emptyListMessage;
  final bool Function(T) _initialItemFinder;
  final Function _onItemChanged;
  final Function(BuildContext, T) _itemBuilder;

  const CarouselList({
    Key? key,
    required List<T> items,
    required String emptyListMessage,
    required bool Function(T) initialItemFinder,
    required Function(T) onItemChanged,
    required Function(BuildContext, T) itemBuilder,
  })  : _emptyListMessage = emptyListMessage,
        _items = items,
        _initialItemFinder = initialItemFinder,
        _onItemChanged = onItemChanged,
        _itemBuilder = itemBuilder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _items.isEmpty
        ? Center(child: Text(_emptyListMessage))
        : Carousel(
            key: GlobalKey(),
            items: _items,
            initialItemFinder: _initialItemFinder,
            onPageChanged: (pos) => _onItemChanged(_items[pos]),
            itemHeight: 60.0,
            itemBuilder: (context, pos) => _itemBuilder(context, _items[pos]),
          );
  }
}
