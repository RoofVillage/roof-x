import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';
import 'package:typedefs/index.dart';

import 'nav_button.dart';

class LogoNavButton extends StatelessWidget with NavButton {
  final ContextPasser onTap;

  @override
  Widget buildIcon(BuildContext context) {
    return SemanticTheme.of(context).logo.full;
  }

  LogoNavButton({@required this.onTap});
}
