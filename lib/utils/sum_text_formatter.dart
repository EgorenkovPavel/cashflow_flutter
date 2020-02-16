
import 'package:flutter/services.dart';

class SumTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;
    if (text.isEmpty || text == '0') {
      String newText = '';
      TextSelection selection = newValue.selection
          .copyWith(baseOffset: newText.length, extentOffset: newText.length);
      return newValue.copyWith(text: newText, selection: selection);
    } else if (text.startsWith('0')) {
      String newText = text.substring(1);
      TextSelection selection = newValue.selection
          .copyWith(baseOffset: newText.length, extentOffset: newText.length);
      return newValue.copyWith(text: newText, selection: selection);
    } else {
      return newValue;
    }
  }
}