import 'package:intl/intl.dart';

import '_string_mask.dart';

class MoneyStringMask extends StringMask {
  final String decimalSeparator;
  final String thousandSeparator;
  final String rightSymbol;
  final String leftSymbol;
  final int precision;

  MoneyStringMask(
      {this.decimalSeparator = '.',
      this.thousandSeparator = ',',
      this.rightSymbol = '',
      this.leftSymbol = '',
      this.precision = 2}) {
    _validateConfig();
  }

  double _valueFromString(String text) {
    final string = getOnlyNumbers(text);
    if (string.isEmpty) return 0;
    return double.parse(string);
  }

  _validateConfig() {
    bool rightSymbolHasNumbers = getOnlyNumbers(this.rightSymbol).length > 0;

    if (rightSymbolHasNumbers) {
      throw ArgumentError("rightSymbol must not have numbers.");
    }
  }

  String applyMask(String text) {
    if (text == null || text.isEmpty) return "";
    final value = _valueFromString(text);
    List<String> textRepresentation = value
        .toStringAsFixed(precision)
        .replaceAll('.', '')
        .split('')
        .reversed
        .toList(growable: true);

    textRepresentation.insert(precision, decimalSeparator);

    for (var i = precision + 4; true; i = i + 4) {
      if (textRepresentation.length > i) {
        textRepresentation.insert(i, thousandSeparator);
      } else {
        break;
      }
    }

    String masked = textRepresentation.reversed.join('');

    // if (rightSymbol.length > 0) {
    //   masked += rightSymbol;
    // }

    // if (leftSymbol.length > 0) {
    //   masked = leftSymbol + masked;
    // }

    print("MASK: $masked");
    return NumberFormat.simpleCurrency().format(double.parse(masked));
  }
}
