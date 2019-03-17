import 'package:flutter/material.dart';

class StringMask {
  String mask;

  final Map<String, RegExp> _translator = {
    'A': new RegExp(r'[A-Za-z]'),
    '0': new RegExp(r'[0-9]'),
    '@': new RegExp(r'[A-Za-z0-9]'),
    '*': new RegExp(r'.*')
  };

  StringMask({@required this.mask});

  String apply(String text) {
    if (text != null) {
      return this._applyMask(text);
    } else {
      return '';
    }
  }

  String _applyMask(String value) {
    String result = '';

    var maskCharIndex = 0;
    var valueCharIndex = 0;

    while (maskCharIndex < mask.length && valueCharIndex < value.length) {
      final maskChar = mask[maskCharIndex];
      final valueChar = value[valueCharIndex];

      // value equals mask, just set
      if (maskChar == valueChar) {
        result += maskChar;
        valueCharIndex += 1;
        maskCharIndex += 1;
      } else if (this._translator.containsKey(maskChar)) {
        if (this._translator[maskChar].hasMatch(valueChar)) {
          result += valueChar;
          maskCharIndex += 1;
        }

        valueCharIndex += 1;
      } else {
        result += maskChar;
        maskCharIndex += 1;
      }
    }

    return result;
  }
}
