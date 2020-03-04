import 'dart:math';
import '_string_mask.dart';

class MoneyStringMask extends StringMask {
  static final intMask = "0";

  final bool isEditing;
  final bool withDecimals;
  final String decimalSeparator;
  final String groupSeparator;
  final String rightSymbol;
  final String leftSymbol;
  final int precision;

  MoneyStringMask({
    this.isEditing,
    this.withDecimals = true,
    this.decimalSeparator = ',',
    this.groupSeparator = '.',
    this.rightSymbol = '',
    this.leftSymbol = '',
    this.precision = 2,
  });

  @override
  String apply(String text, bool isEditing) {
    final onlyNumbers = getOnlyNumbers(text);
    if (onlyNumbers.isEmpty && !isEditing) return '';

    String body = _makeBody(text, isEditing);

    if (leftSymbol != null) body = leftSymbol + body;
    if (rightSymbol != null) body = body + rightSymbol;

    return body;
  }

  String _makeBody(String text, bool isEditing) {
    if (isEditing && _isInvalid(text)) return '';

    final numDecimalSeparators = decimalSeparator.allMatches(text).length;

    if (numDecimalSeparators > 1) {
      text = _stripExtraDecimalSeparators(text);
    }

    final decimalGroups = text.split(decimalSeparator);
    final integer = decimalGroups.first;

    String body = applyMask(integer, _maskForInteger(integer));

    if (!withDecimals) return body;
    
    if (numDecimalSeparators > 0) {
      body += decimalSeparator;
      if (decimalGroups.length > 1) {
        body += _maskDecimals(decimalGroups.last);
      }
    } else if (!isEditing) {
      body += decimalSeparator + "00";
    }

    return body;
  }

  String _maskDecimals(String decimals) {
    if (isEditing) {
      return decimals.substring(0, min(precision, decimals.length));
    } else {
      for (var i = 0; i < precision - decimals.length; i++) {
        decimals += '0';
      }
      return decimals;
    }
  }

  String _maskForInteger(String integer) {
    final onlyNumbers = getOnlyNumbers(integer);
    final groupMaskLength = 3;

    if (onlyNumbers.length <= groupMaskLength) {
      return intMask * onlyNumbers.length;
    }

    final tailMaskRange = onlyNumbers.length - groupMaskLength;
    return _maskForInteger(onlyNumbers.substring(0, tailMaskRange)) +
        groupSeparator +
        _maskForInteger(onlyNumbers.substring(tailMaskRange));
  }

  String _stripExtraDecimalSeparators(String text) {
    final indexOfLastDecimalSeparator = text.lastIndexOf(decimalSeparator);
    return text
            .substring(0, indexOfLastDecimalSeparator)
            .replaceAll(decimalSeparator, '') +
        text.substring(indexOfLastDecimalSeparator);
  }

  bool _isInvalid(String text) {
    if (text.isEmpty) return true;
    final noSymbols =
        text.replaceAll(rightSymbol, '').replaceAll(leftSymbol, '');
    return noSymbols.startsWith(decimalSeparator) || noSymbols.startsWith('0');
  }
}
