import 'package:flutter/material.dart';
import 'package:money_tracker/ui/themes.dart';

class Subtitle extends StatelessWidget {
  final Widget? leading;
  final Widget? child;
  final void Function()? onPress;

  const Subtitle({
    Key? key,
    this.leading,
    this.child,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(Dimensions.padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leading ?? SizedBox(),
            Row(
              children: [
                child ?? SizedBox(),
                onPress == null
                    ? SizedBox()
                    : Icon(Icons.arrow_forward_ios_outlined),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

