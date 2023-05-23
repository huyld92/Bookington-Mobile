import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyFormatter extends TextInputFormatter {
  final NumberFormat _formatter;

  CurrencyFormatter(this._formatter);

  // @override
  // TextEditingValue formatEditUpdate(
  //     TextEditingValue oldValue, TextEditingValue newValue) {
  //   if (newValue.text.isEmpty) {
  //     return newValue.copyWith(text: '');
  //   } else if (newValue.text == _formatter.currencySymbol) {
  //     return oldValue;
  //   } else {
  //     double value = double.parse(newValue.text.replaceAll(',', ''));
  //     String newText = _formatter.format(value);
  //     int selectionIndex = newValue.selection.end +
  //         (newText.length - newValue.text.replaceAll(',', '').length);
  //     return TextEditingValue(
  //       text: newText,
  //       selection: TextSelection.collapsed(offset: selectionIndex),
  //     );
  //   }
  // }
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else {
      double? value = double.tryParse(newValue.text.replaceAll(',', ''));
      if (value == null) {
        // If the new value is not a valid number, return the old value instead.
        return oldValue;
      }
      String newText = _formatter.format(value);
      int selectionIndex = newValue.selection.end +
          (newText.length - newValue.text.replaceAll(',', '').length);
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: selectionIndex),
      );
    }
  }
}