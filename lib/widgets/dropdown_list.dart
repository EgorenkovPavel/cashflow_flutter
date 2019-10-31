import 'package:flutter/material.dart';

typedef WidgetByItem<T> = Widget Function(T value);

class DropdownList<T> extends StatelessWidget {
  final T value;
  final String hint;
  final Function onChange;
  final List<T> items;
  final WidgetByItem<T> getListItem;


  const DropdownList({Key key, this.value, this.hint, this.onChange, this.items, this.getListItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      //padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: DropdownButton<T>(
        isExpanded: true,
        hint: Text(hint),
        value: value,
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        elevation: 16,

        //style: TextStyle(color: Colors.deepPurple),
//      underline: Container(
//        height: 2,
//        color: Colors.deepPurpleAccent,
//      ),
        onChanged: (T newValue) {
          onChange(newValue);
        },
        items: items?.map((item) =>
            DropdownMenuItem<T>(
            value: item,
            child: getListItem(item))
        )?.toList(),
      ),
    );
  }
}
