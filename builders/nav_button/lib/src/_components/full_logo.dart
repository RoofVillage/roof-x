import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

import 'nav_button.dart';

class FullLogoNavButton extends StatelessWidget with NavButton {
  final void Function() onTap;

  @override
  Widget buildIcon(BuildContext context) {
    return SemanticTheme.of(context).logo.full;
  }

  FullLogoNavButton({
    @required this.onTap,
  });
}
