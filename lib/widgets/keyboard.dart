import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {

  final ValueSetter<int> onDigitPressed;
  final VoidCallback onBackPressed;

  const Keyboard({Key key, this.onDigitPressed, this.onBackPressed})
      : super(key: key);

  Widget _button(BuildContext context, Widget child, onPressed) {
    double _ratio = MediaQuery
        .of(context)
        .devicePixelRatio;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0*_ratio, vertical: 2.0*_ratio),
      child: SizedBox(
        height: 24.0*_ratio,
        width: 24.0*_ratio,
        child: RawMaterialButton(
          shape: CircleBorder(),
          child: child,
          elevation: 2.0,
          fillColor: Colors.white,
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget _digitButton(BuildContext context, int digit) {
    return _button(context, Text('$digit', style: Theme
        .of(context)
        .textTheme
        .title,), () => onDigitPressed(digit));
  }

  Widget _rowButton(List<Widget> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttons,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _rowButton(<Widget>[
          _digitButton(context, 1),
          _digitButton(context, 2),
          _digitButton(context, 3),
        ]),
        _rowButton(<Widget>[
          _digitButton(context, 4),
          _digitButton(context, 5),
          _digitButton(context, 6),
        ]),
        _rowButton(<Widget>[
          _digitButton(context, 7),
          _digitButton(context, 8),
          _digitButton(context, 9),
        ]),
        _rowButton(<Widget>[
          _button(context, SizedBox(), null),
          _digitButton(context, 0),
          _button(context, Icon(Icons.arrow_back), onBackPressed),
        ]),
      ],
    );
  }
}
