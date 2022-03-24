import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final ValueSetter<int> onDigitPressed;
  final VoidCallback onBackPressed;

  const Keyboard({
    Key? key,
    required this.onDigitPressed,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, constrains) {
      var _col = constrains.maxWidth / 3;

      return Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 1,
              width: _col,
            ),
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 2,
              width: _col,
            ),
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 3,
              width: _col,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 4,
              width: _col,
            ),
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 5,
              width: _col,
            ),
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 6,
              width: _col,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 7,
              width: _col,
            ),
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 8,
              width: _col,
            ),
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 9,
              width: _col,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            _Button(child: null, onPressed: null, width: _col),
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 0,
              width: _col,
            ),
            _Button(
              child: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: onBackPressed,
              width: _col,
            ),
          ]),
        ],
      );
    });
  }
}

class _DigitButton extends StatelessWidget {
  const _DigitButton({
    Key? key,
    required this.onDigitPressed,
    required this.digit,
    required this.width,
  }) : super(key: key);

  final ValueSetter<int> onDigitPressed;
  final int digit;
  final double width;

  @override
  Widget build(BuildContext context) {
    return _Button(
      child: Text(
        '$digit',
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
      onPressed: () => onDigitPressed(digit),
      width: width,
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.child,
    required this.onPressed,
    required this.width,
  }) : super(key: key);

  final Widget? child;
  final void Function()? onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    if (child == null) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.1,
          vertical: width * 0.05,
        ),
        child: SizedBox(
          height: width * 0.75, //24.0*_ratio,
          width: width * 0.75, //24.0*_ratio,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.1,
        vertical: width * 0.05,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: width * 0.75, //24.0*_ratio,
          width: width * 0.75, //24.0*_ratio,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(width * 0.75 / 2),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
