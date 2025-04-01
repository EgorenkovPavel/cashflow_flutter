import 'package:flutter/material.dart';
import 'package:money_tracker/src/ui/pages/operation/input_page/widgets/carousel.dart';

class CarouselList<T> extends StatelessWidget {
  final List<T> _items;
  final String _emptyListMessage;
  final T? initialValue;
  final Function _onItemChanged;
  final Function(BuildContext, T) _itemBuilder;

  const CarouselList({
    super.key,
    required List<T> items,
    required String emptyListMessage,
    required Function(T) onItemChanged,
    required Function(BuildContext, T) itemBuilder,
    required this.initialValue,
  })  : _emptyListMessage = emptyListMessage,
        _items = items,
        _onItemChanged = onItemChanged,
        _itemBuilder = itemBuilder;

  @override
  Widget build(BuildContext context) {
    return _items.isEmpty
        ? Center(child: Text(_emptyListMessage))
        : Carousel(
            key: GlobalKey(),
            items: _items,
            initialValue: initialValue,
            onPageChanged: (pos) => _onItemChanged(_items[pos]),
            itemHeight: 60.0,
            itemBuilder: (context, pos) => _itemBuilder(context, _items[pos]),
          );
  }
}
