import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'option.dart';
import '_string_mask.dart';
import '_money_string_mask.dart';
import '_phone_number_string_mask.dart';

class Mask {
  final MaskOption option;

  Mask(this.option);

  String apply({@required String text, @required BuildContext context}) {
    StringMask mask;

    switch (option) {
      case MaskOption.phoneNumber:
        mask = PhoneNumberStringMask();
        break;
      case MaskOption.money:
        final local = Localizations.localeOf(context);
        final symbol = NumberFormat(local: local).currencySymbol;
        final
        break;
    }

    return mask.apply(text);
  }
}