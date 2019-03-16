import 'package:meta/meta.dart';
import 'package:string_mask/string_mask.dart';

import 'option.dart';

class Mask {
  static StringMask _phoneNumber = StringMask('+00 (00) 0000-0000');

  final MaskOption option;

  Mask(this.option);

  String apply(String value) {
    StringMask formatter;

    switch (option) {
      case MaskOption.phoneNumber:
        formatter = _phoneNumber;
    }

    return formatter.apply(value);
  }
}
