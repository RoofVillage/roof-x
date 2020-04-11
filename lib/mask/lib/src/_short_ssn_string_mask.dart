import '_string_mask.dart';

class ShortSsnStringMask extends StringMask {
  @override
  String maskForText(String text) {
    final onlyNumbers = getOnlyNumbers(text);
    switch (onlyNumbers.length) {
      case 0:
        return "";
      default:
        return "0000";
    }
  }
}
