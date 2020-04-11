import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask/src/_ein_string_mask.dart';
import 'package:mask/src/_short_ssn_string_mask.dart';
import 'package:mask/src/_ssn_string_mask.dart';

import 'option.dart';
import '_string_mask.dart';
import '_money_string_mask.dart';
import '_phone_number_string_mask.dart';

String applyMask(
  MaskOption option, {
  @required String text,
  bool isEditing = false,
  @required BuildContext context,
}) {
  StringMask mask;

  switch (option) {
    case MaskOption.phoneNumber:
      mask = PhoneNumberStringMask();
      break;
    case MaskOption.money:
      mask = _makeMoneyStringMask(context, isEditing, true);
      break;
    case MaskOption.moneyNoDecimals:
      mask = _makeMoneyStringMask(context, isEditing, false);
      break;
    case MaskOption.ssn:
      mask = SsnStringMask();
      break;
    case MaskOption.shortSsn:
      mask = ShortSsnStringMask();
      break;
    case MaskOption.ein:
      mask = EinStringMask();
  }

  return mask.apply(text, isEditing);
}

MoneyStringMask _makeMoneyStringMask(
    BuildContext context, bool isEditing, bool withDecimals) {
  final locale = Localizations.localeOf(context);
  final format =
      NumberFormat(null, locale.languageCode + '_' + locale.countryCode);
  final symbol = format.simpleCurrencySymbol(format.currencyName);
  final decimalSeperator = format.symbols.DECIMAL_SEP;
  final thousandsSeperator = format.symbols.GROUP_SEP;
  return MoneyStringMask(
    isEditing: isEditing,
    withDecimals: withDecimals,
    leftSymbol: symbol,
    decimalSeparator: decimalSeperator,
    groupSeparator: thousandsSeperator,
  );
}
