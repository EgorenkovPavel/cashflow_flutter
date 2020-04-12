import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {

  final ValueSetter<int> onDigitPressed;
  final VoidCallback onBackPressed;

  const Keyboard({Key key, this.onDigitPressed, this.onBackPressed}) : super(key: key);

  Widget _button(Widget child, onPressed) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 48.0,
        width: 48.0,
        child: RawMaterialButton(
          shape: CircleBorder(),
          child: child,
          elevation: 2.0,
          fillColor: Colors.white,
          padding: const EdgeInsets.all(15.0),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget _digitButton(int digit){
    return _button(Text('$digit'), () => onDigitPressed(digit));
  }

  Widget _rowButton(List<Widget> buttons){
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
          _digitButton(1),
          _digitButton(2),
          _digitButton(3),
        ]),
        _rowButton(<Widget>[
          _digitButton(4),
          _digitButton(5),
          _digitButton(6),
        ]),
        _rowButton(<Widget>[
          _digitButton(7),
          _digitButton(8),
          _digitButton(9),
        ]),
        _rowButton(<Widget>[
          SizedBox(height: 52.0, width: 52.0,),
          _digitButton(0),
          _button(Icon(Icons.arrow_back), onBackPressed),
        ]),
      ],
    );
  }
}
