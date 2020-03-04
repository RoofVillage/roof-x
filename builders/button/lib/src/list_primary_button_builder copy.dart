import 'package:flutter/material.dart';
import 'package:standard_icon_library/index.dart';
import 'package:typedefs/index.dart';

import '_components/list_primary_button.dart';

mixin PrimaryListButtonBuilder {
  PrimaryListButton buildPrimaryListButton(
    BuildContext context, {
    @required ContextPasser onTap,
    @required String text,
    @required String badgeText,
    StandardIcon iconReference,
  }) =>
      PrimaryListButton(
        onTap: onTap,
        text: text,
        badgeText: badgeText,
        iconReference: iconReference,
      );
}
