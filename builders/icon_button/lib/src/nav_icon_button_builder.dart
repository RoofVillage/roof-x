import 'package:flutter/material.dart';
import 'package:navigation_icon_library/index.dart';

import '_components/nav_icon_button.dart';

mixin NavIconButtonBuilder {
  NavIconButton buildNavIconButton({
    @required NavigationIcon iconReference,
    @required void Function() onTap,
  }) {
    return NavIconButton(
      onTap: onTap,
      iconReference: iconReference,
    );
  }
}
