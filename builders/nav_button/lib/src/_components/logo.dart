import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

import 'nav_button.dart';

class LogoNavButton extends StatelessWidget with NavButton {
  final void Function() onTap;

  @override
  Widget buildIcon(BuildContext context) {
    return SemanticTheme.of(context).logo.icon;
  }

  LogoNavButton({@required this.onTap});
}
