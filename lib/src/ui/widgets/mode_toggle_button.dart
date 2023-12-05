import 'package:flutter/material.dart';

class ModeToggleButton extends StatelessWidget {
  final ThemeMode mode;
  final void Function(ThemeMode) onPressed;

  const ModeToggleButton({
    super.key,
    required this.mode,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var modes = const [ThemeMode.light, ThemeMode.dark];

    return ToggleButtons(
      isSelected: modes.map((e) => e == mode).toList(),
      onPressed: (index) => onPressed(modes[index]),
      children: const [Icon(Icons.light_mode), Icon(Icons.dark_mode)],
    );
  }
}
