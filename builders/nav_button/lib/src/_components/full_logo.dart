import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:svg/index.dart';
import 'package:typedefs/index.dart';

import 'nav_button.dart';

class FullLogoNavButton extends StatelessWidget with NavButton {
  final ContextPasser onTap;

  @override
  Widget iconForTheme(SemanticInheritedTheme theme) {
    return SvgReference.logoFull.buildSvg(
      color: theme.color.icon.logo,
    );
  }

  FullLogoNavButton({
    @required this.onTap,
  });
}
