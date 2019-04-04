import 'package:flutter/material.dart';
import 'package:icon_library/index.dart';

import '_components/transition.dart';

mixin TransitionButtonBuilder {
  RoofTransitionButton buildTransitionButton(BuildContext context,
      {@required String text,
      StandardIconReference iconReference,
      @required OnTap onTap}) {
    return RoofTransitionButton(
        text: text, iconReference: iconReference, onTap: onTap);
  }
}
