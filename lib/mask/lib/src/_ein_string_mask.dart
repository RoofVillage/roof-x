import '_string_mask.dart';

class EinStringMask extends StringMask {
  @override
  String maskForText(String text) {
    final onlyNumbers = getOnlyNumbers(text);
    switch (onlyNumbers.length) {
      case 0:
        return "";
      case 1:
      case 2:
        return "00";
      default:
        return "00-0000000";
    }
  }
}
