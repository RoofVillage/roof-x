import '_string_mask.dart';

class PhoneNumberStringMask extends StringMask {
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
      case 6:
      case 7:
        return "000-0000";
      case 8:
      case 9:
      case 10:
        return "(000) 000-0000";
      case 11:
        return "+1 (000) 000-0000";
      default:
        return "+00 (00) 0000-0000";
    }
  }
}
