import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {

  final ValueSetter<int> onDigitPressed;
  final VoidCallback onBackPressed;

  const Keyboard({Key? key, required this.onDigitPressed, required this.onBackPressed})
      : super(key: key);

  Widget _button(BuildContext context, Widget? child, onPressed, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.1, vertical: width*0.05),
      child: SizedBox(
        height: width *0.75,//24.0*_ratio,
        width: width *0.75,//24.0*_ratio,
        child: child == null ? null : RawMaterialButton(
          shape: CircleBorder(),
          elevation: 2.0,
          fillColor: Theme.of(context).buttonColor,//Colors.white,
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }

  Widget _digitButton(BuildContext context, int digit, double width) {
    return _button(context, Text('$digit', style: Theme
        .of(context)
        .textTheme
        .headline6,), () => onDigitPressed(digit), width);
  }

  Widget _rowButton(List<Widget> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttons,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, constrains) {
        var _col = constrains.maxWidth / 3;
        return Column(
          children: <Widget>[
            _rowButton(<Widget>[
              _digitButton(context, 1, _col),
              _digitButton(context, 2, _col),
              _digitButton(context, 3, _col),
            ]),
            _rowButton(<Widget>[
              _digitButton(context, 4, _col),
              _digitButton(context, 5, _col),
              _digitButton(context, 6, _col),
            ]),
            _rowButton(<Widget>[
              _digitButton(context, 7, _col),
              _digitButton(context, 8, _col),
              _digitButton(context, 9, _col),
            ]),
            _rowButton(<Widget>[
              _button(context, null, null, _col),
              _digitButton(context, 0, _col),
              _button(context, Icon(Icons.arrow_back), onBackPressed, _col),
            ]),
          ],
        );
      }
    );
  }
}
