import 'package:flutter/material.dart';

import '_components/full_logo_button.dart';

mixin FullLogoButtonBuilder {
  FullLogoButton buildFullLogoButton({
    @required void Function() onTap,
  }) {
    return FullLogoButton(
      onTap: onTap,
    );
  }
}
