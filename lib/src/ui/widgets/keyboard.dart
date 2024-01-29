import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final ValueSetter<int> onDigitPressed;
  final VoidCallback onBackPressed;

  const Keyboard({
    super.key,
    required this.onDigitPressed,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, constrains) {
      var col = constrains.maxWidth / 3;

      return Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 1,
              width: col,
            ),
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 2,
              width: col,
            ),
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 3,
              width: col,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 4,
              width: col,
            ),
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 5,
              width: col,
            ),
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 6,
              width: col,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 7,
              width: col,
            ),
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 8,
              width: col,
            ),
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 9,
              width: col,
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            _Button(child: null, onPressed: null, width: col),
            _DigitButton(
              onDigitPressed: onDigitPressed,
              digit: 0,
              width: col,
            ),
            _Button(
              onPressed: onBackPressed,
              width: col,
              child: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ]),
        ],
      );
    });
  }
}

class _DigitButton extends StatelessWidget {
  const _DigitButton({
    required this.onDigitPressed,
    required this.digit,
    required this.width,
  });

  final ValueSetter<int> onDigitPressed;
  final int digit;
  final double width;

  @override
  Widget build(BuildContext context) {
    return _Button(
      onPressed: () => onDigitPressed(digit),
      width: width,
      child: Text(
        '$digit',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.child,
    required this.onPressed,
    required this.width,
  });

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
