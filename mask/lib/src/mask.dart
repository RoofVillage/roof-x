import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'option.dart';
import '_string_mask.dart';
import '_money_string_mask.dart';
import '_phone_number_string_mask.dart';

class Mask {
  final MaskOption option;

  Mask(this.option);

  String apply(
      {@required String text,
      bool isEditing = false,
      @required BuildContext context}) {
    StringMask mask;

    switch (option) {
      case MaskOption.phoneNumber:
        mask = PhoneNumberStringMask();
        break;
      case MaskOption.money:
        mask = _makeMoneyStringMask(context, isEditing);
        break;
    }

    return mask.apply(text, isEditing);
  }

  MoneyStringMask _makeMoneyStringMask(BuildContext context, bool isEditing) {
    final locale = Localizations.localeOf(context);
    final format =
        NumberFormat(null, locale.languageCode + '_' + locale.countryCode);
    final symbol = format.simpleCurrencySymbol(format.currencyName);
    final decimalSeperator = format.symbols.DECIMAL_SEP;
    final thousandsSeperator = format.symbols.GROUP_SEP;
    return MoneyStringMask(
        isEditing: isEditing,
        leftSymbol: symbol,
        decimalSeparator: decimalSeperator,
        groupSeparator: thousandsSeperator);
  }
}
