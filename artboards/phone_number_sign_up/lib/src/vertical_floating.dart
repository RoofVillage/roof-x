import 'package:flutter/material.dart';
import 'package:form_vertical_floating_artboard_template/index.dart';

import '_data.dart';

class PhoneNumberSignUpVerticalFloatingArtboard
    extends FormVerticalFloatingArtboard with PhoneNumberSignUpArtboardData {
  final PhoneNumberDependentSubmit onSubmit;
  PhoneNumberSignUpVerticalFloatingArtboard({@required this.onSubmit});
}
