import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mask/index.dart';
import 'text_field.dart';

class CurrencyFormTextFieldData extends FormTextFieldData {
  CurrencyFormTextFieldData(
      {String title = "Amount",
      String placeholder = "0.00",
      String initialValue,
      double size,
      bool autofocus,
      ValueChanged<String> onSubmitted,
      ValueChanged<String> onChanged,
      ValueChanged<bool> onFocusChanged,
      bool isHidden})
      : super(
            mask: MaskOption.money,
            title: title,
            placeholder: placeholder,
            initialValue: initialValue,
            onSubmitted: onSubmitted,
            onChanged: onChanged,
            onFocusChanged: onFocusChanged,
            autofocus: autofocus,
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
            ), //TextInputType.numberWithOptions(decimal: true),
            size: size,
            isHidden: isHidden);

  Future<void> validate() async {}
}
