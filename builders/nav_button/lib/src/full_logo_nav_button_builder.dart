import 'package:flutter/material.dart';

import '_components/full_logo.dart';

mixin FullLogoNavButtonBuilder {
  FullLogoNavButton buildFullLogoNavButton(
    BuildContext context, {
    @required void Function() onTap,
  }) {
    return FullLogoNavButton(
      onTap: onTap,
    );
  }
}
