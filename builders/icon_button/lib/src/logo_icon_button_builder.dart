import 'package:flutter/material.dart';

import '_components/logo_icon_button.dart';

mixin LogoIconButtonBuilder {
  LogoIconButton buildLogoIconButton({
    @required void Function() onTap,
  }) {
    return LogoIconButton(onTap: onTap);
  }
}
