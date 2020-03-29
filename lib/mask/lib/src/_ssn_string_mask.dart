import '_string_mask.dart';

class SsnStringMask extends StringMask {
  @override
  String maskForText(String text) {
    final onlyNumbers = getOnlyNumbers(text);
    switch (onlyNumbers.length) {
      case 0:
        return "";
      case 1:
      case 2:
      case 3:
        return "000";
      case 4:
      case 5:
        return "000-00";
      case 6:
      case 7:
      case 8:
      case 9:
      default:
        return "000-00-0000";
    }
  }
}
