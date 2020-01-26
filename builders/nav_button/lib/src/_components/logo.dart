import 'package:flutter/material.dart';
import 'package:navigation_icon_library/index.dart';
import 'package:typedefs/index.dart';
import 'package:semantic_theme/index.dart';

import 'nav_button.dart';

class LogoNavButton extends StatelessWidget with NavButton {
  final ContextPasser onTap;

  @override
  Widget iconForTheme(SemanticInheritedTheme theme) {
    return NavigationIcon.logoHouse.buildWidget(
      color: theme.color.icon.logo,
    );
  }

  LogoNavButton({@required this.onTap});
}
