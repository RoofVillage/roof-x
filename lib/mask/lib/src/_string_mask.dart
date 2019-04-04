abstract class StringMask {
  final Map<String, RegExp> _translator = {
    'A': new RegExp(r'[A-Za-z]'),
    '0': new RegExp(r'[0-9]'),
    '@': new RegExp(r'[A-Za-z0-9]'),
    '*': new RegExp(r'.*')
  };

  String apply(String text, bool isEditing) {
    String masked = this.applyMask(text, maskForText(text));
    return masked;
  }

  String getOnlyNumbers(String text) {
    String cleanedText = text;

    var onlyNumbersRegex = new RegExp(r'[^\d]');

    cleanedText = cleanedText.replaceAll(onlyNumbersRegex, '');

    return cleanedText;
  }

  String maskForText(String text) => "";

  String applyMask(String text, String mask) {
    String result = '';

    var maskCharIndex = 0;
    var valueCharIndex = 0;

    while (maskCharIndex < mask.length && valueCharIndex < text.length) {
      final maskChar = mask[maskCharIndex];
      final valueChar = text[valueCharIndex];

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
