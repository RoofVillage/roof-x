import 'option.dart';
import '_string_mask.dart';
import '_money_string_mask.dart';
import '_phone_number_string_mask.dart';

class Mask {
  final MaskOption option;

  Mask(this.option);

  String apply(String text) {
    StringMask mask;

    switch (option) {
      case MaskOption.phoneNumber:
        mask = PhoneNumberStringMask();
        break;
      case MaskOption.money:
        mask = MoneyStringMask();
        break;
    }

    return mask.apply(text);
  }
}
