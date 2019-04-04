import 'package:flutter/material.dart';
import 'package:floating_artboard_templates/index.dart';

import '_builder.dart';

class PhoneNumberSignUpFloatingArtboard extends FormFloatingArtboard
    with PhoneNumberSignUpArtboardBuilder {
  final PhoneNumberDependentSubmit onSubmit;
  PhoneNumberSignUpFloatingArtboard({@required this.onSubmit});
}
