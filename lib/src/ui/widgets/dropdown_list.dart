import 'package:flutter/material.dart';

typedef WidgetByItem<T> = Widget Function(T value);

class DropdownList<T> extends StatelessWidget {
  final T? value;
  final String hint;
  final void Function(T?)? onChange;
  final List<T> items;
  final WidgetByItem<T> getListItem;

  const DropdownList({
    Key? key,
    this.value,
    this.hint = '',
    this.onChange,
    required this.items,
    required this.getListItem,
  }) : super(key: key);

  void _onChanged(T? newValue){
    if (onChange != null) {
      onChange!(newValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: DropdownButton<T>(
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(hint),
        ),
        value: value,
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        elevation: 16,
        underline: const SizedBox(),
        onChanged: _onChanged,
        items: items
            .map((item) =>
                DropdownMenuItem<T>(value: item, child: getListItem(item)))
            .toList(),
      ),
    );
  }
}
