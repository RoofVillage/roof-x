import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'option.dart';

class Mask {
  static final _phoneNumberMask = '+00 (00) 0000-0000';

  final MaskOption option;

  Mask(this.option);

  String apply(String value) {
    MaskedTextController controller;

    switch (option) {
      case MaskOption.phoneNumber:
        controller = MaskedTextController(mask: _phoneNumberMask);
    }

    return controller.text;
    ;
  }
}
