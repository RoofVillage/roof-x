import 'package:flutter/material.dart';
import 'package:semantic_theme/index.dart';

import 'standard_icon_button.dart';

class FullLogoButton extends StatelessWidget with StandardIconButton {
  final void Function() onTap;

  @override
  Widget buildIcon(BuildContext context) {
    return SemanticTheme.of(context).logo.full;
  }

  FullLogoButton({
    @required this.onTap,
  });
}
