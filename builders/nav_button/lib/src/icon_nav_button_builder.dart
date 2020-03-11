import 'package:flutter/material.dart';
import 'package:navigation_icon_library/index.dart';

import '_components/icon.dart';

mixin IconNavButtonBuilder {
  IconNavButton buildIconNavButton(
    BuildContext context, {
    @required NavigationIcon iconReference,
    @required void Function() onTap,
    Color color,
  }) {
    return IconNavButton(
      onTap: onTap,
      iconReference: iconReference,
      color: color,
    );
  }
}
