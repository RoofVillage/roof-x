import 'option.dart';
import '_string_mask.dart';
import '_money_string_mask.dart';

class Mask {
  static final _phoneNumberMask = '+00 (00) 0000-0000';

  final MaskOption option;

  Mask(this.option);

  String apply(String text) {
    StringMask controller;

    switch (option) {
      case MaskOption.phoneNumber:
        controller = StringMask(mask: _phoneNumberMask);
        break;
      case MaskOption.money:
        controller = MoneyStringMask();
        break;
    }

    return controller.apply(text);
  }
}
