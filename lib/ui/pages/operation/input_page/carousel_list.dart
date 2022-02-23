

import 'package:flutter/material.dart';
import 'package:money_tracker/ui/widgets/carousel.dart';

class CarouselList<T> extends StatelessWidget {
  const CarouselList({
    Key? key,
    required Stream<List<T>> stream,
    required String emptyListMessage,
    required bool Function(T) initialItemFinder,
    required Function(T) onItemChanged,
    required Function(BuildContext, T) itemBuilder,
  })  : _emptyListMessage = emptyListMessage,
        _stream = stream,
        _initialItemFinder = initialItemFinder,
        _onItemChanged = onItemChanged,
        _itemBuilder = itemBuilder,
        super(key: key);

  final Stream<List<T>> _stream;
  final String _emptyListMessage;
  final bool Function(T) _initialItemFinder;
  final Function _onItemChanged;
  final Function(BuildContext, T) _itemBuilder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _stream,
      initialData: <T>[],
      builder: (BuildContext context, AsyncSnapshot<List<T>> snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(_emptyListMessage),
          );
        }

        var items = snapshot.data;

        return Carousel(
          key: GlobalKey(),
          items: items!,
          initialItemFinder: _initialItemFinder,
          onPageChanged: (pos) => _onItemChanged(items[pos]),
          itemHeight: 60.0,
          itemBuilder: (context, pos) => _itemBuilder(context, items[pos]),
        );
      },
    );
  }
}
