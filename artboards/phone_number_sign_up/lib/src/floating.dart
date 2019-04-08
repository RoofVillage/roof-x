import 'package:flutter/material.dart';
import 'package:vertical_floating_artboard_templates/index.dart';

import '_builder.dart';

class PhoneNumberSignUpVerticalFloatingArtboard
    extends FormVerticalFloatingArtboard with PhoneNumberSignUpArtboardBuilder {
  final PhoneNumberDependentSubmit onSubmit;
  PhoneNumberSignUpVerticalFloatingArtboard({@required this.onSubmit});
}
